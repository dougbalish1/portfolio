// SPDX-License-Identifier: GPL-2.0

#include <linux/kobject.h>
#include <linux/string.h>
#include <linux/debugfs.h>
#include <linux/sysfs.h>
#include <linux/slab.h>
#include <linux/module.h>
#include <linux/init.h>
#include <linux/miscdevice.h>
#include <linux/fs.h>

DEFINE_SPINLOCK(list_lock);

struct swapstore {
	struct kobject kobj;
	char data[PAGE_SIZE];
	int readonly;
	int removable;
};
#define to_swapstore(x) container_of(x, struct swapstore, kobj)

/* a custom attribute that works just for a struct foo_obj. */
struct swap_attribute {
	struct attribute attr;
	ssize_t (*show)(struct swapstore *swap, struct swap_attribute *attr, char *buf);
	ssize_t (*store)(struct swapstore *swap, struct swap_attribute *attr, const char *buf, size_t count);
};
#define to_swap_attr(x) container_of(x, struct swap_attribute, attr)

char bufin[128];
static struct kset *swapstoreSET;
static struct swapstore *defaultt;
static struct swapstore *attached;
static struct dentry *dir;


static ssize_t swap_attr_show(struct kobject *kobj,
			     struct attribute *attr,
			     char *buf)
{
	struct swap_attribute *attribute;
	struct swapstore *swap;

	attribute = to_swap_attr(attr);
	swap = to_swapstore(kobj);

	if (!attribute->show)
		return -EIO;

	return attribute->show(swap, attribute, buf);
}

static ssize_t swap_attr_store(struct kobject *kobj,
			      struct attribute *attr,
			      const char *buf, size_t len)
{
	struct swap_attribute *attribute;
	struct swapstore *swap;

	attribute = to_swap_attr(attr);
	swap = to_swapstore(kobj);

	if (!attribute->store)
		return -EIO;

	return attribute->store(swap, attribute, buf, len);
}

static const struct sysfs_ops swap_sysfs_ops = {
	.show = swap_attr_show,
	.store = swap_attr_store,
};

static void swap_release(struct kobject *kobj)
{
	struct swapstore *swap;

	swap = to_swapstore(kobj);
	kfree(swap);
}

static ssize_t readremove_show(struct swapstore *swap, struct swap_attribute *attr,
		      char *buf)
{
	int var;

	if (strcmp(attr->attr.name, "readonly") == 0)
		var = swap->readonly;
	else
		var = swap->removable;
	return sprintf(buf, "%d\n", var);
}

static ssize_t readremove_store(struct swapstore *swap, struct swap_attribute *attr,
		       const char *buf, size_t count)
{
	int var, ret;

	ret = kstrtoint(buf, 10, &var);
	if (ret < 0)
		return ret;

	if (strcmp(attr->attr.name, "readonly") == 0)
		if (var == 0 || var == 1)
			swap->readonly = var;
		else
			return -EINVAL;
	else
		return -EPERM;
	return count;
}

static struct swap_attribute readonly_attribute =
	__ATTR(readonly, 0600, readremove_show, readremove_store);
static struct swap_attribute removable_attribute =
	__ATTR(removable, 0400, readremove_show, readremove_store);

static struct attribute *swapstore_default_attrs[] = {
	&readonly_attribute.attr,
	&removable_attribute.attr,
	NULL
};
ATTRIBUTE_GROUPS(swapstore_default);

static struct kobj_type swapstore_ktype = {
	.sysfs_ops = &swap_sysfs_ops,
	.release = swap_release,
	.default_groups = swapstore_default_groups,
};




static struct swapstore *create_swapstore(const char *name)
{
	struct swapstore *swap;
	int retval;

	swap = kzalloc(sizeof(*swap), GFP_KERNEL);
	if (!swap)
		return NULL;

	swap->kobj.kset = swapstoreSET;

	retval = kobject_init_and_add(&swap->kobj, &swapstore_ktype, NULL, "%s", name);
	if (retval) {
		kobject_put(&swap->kobj);
		return NULL;
	}

	kobject_uevent(&swap->kobj, KOBJ_ADD);

	if (defaultt)
		swap->removable = 1;

	return swap;
}

static void destroy_swapstore(struct swapstore *swap)
{
	if (swap->removable == 1)
		kobject_put(&swap->kobj);
}

static ssize_t eject_read(struct file *filp, char __user *buf,
			size_t count, loff_t *ppos)
{
	return -EPERM;
}

static ssize_t insert_read(struct file *filp, char __user *buf,
			size_t count, loff_t *ppos)
{
	return -EPERM;
}

static ssize_t swapstore_read(struct file *filp, char __user *buf,
			size_t count, loff_t *ppos)
{

	char str[128];
	size_t avail = 0;

	avail = snprintf(str, 128, "%s\n", attached->kobj.name);

	return simple_read_from_buffer(buf, count, ppos, str, avail);
}

static ssize_t eject_write(struct file *filp, const char __user *buf,
			size_t count, loff_t *ppos)
{
	int ret = 0;
	struct kobject *entry, *sav;
	struct swapstore *target = NULL;

	ret = simple_write_to_buffer(bufin, 128, ppos, buf, count);
	bufin[ret] = '\0';

	list_for_each_entry_safe(entry, sav, &swapstoreSET->list, entry) {
		if (strcmp(entry->name, bufin) == 0)
			target = to_swapstore(entry);
	}

	if (target) {
		destroy_swapstore(target);
		return ret;
	}

	return -EINVAL;
}

static ssize_t insert_write(struct file *filp, const char __user *buf,
				size_t count, loff_t *ppos)
{
	int ret = 0;
	struct kobject *entry, *sav;
	struct swapstore *target = NULL;

	ret = simple_write_to_buffer(bufin, 128, ppos, buf, count);
	bufin[ret] = '\0';


	list_for_each_entry_safe(entry, sav, &swapstoreSET->list, entry) {
		if (strcmp(entry->name, bufin) == 0)
			target = to_swapstore(entry);
	}

	if (target)
		return -EINVAL;


	create_swapstore(bufin);

	return ret;
}

static ssize_t swapstore_write(struct file *filp, const char __user *buf,
			size_t count, loff_t *ppos)
{
	int ret = 0;
	struct kobject *entry, *sav;
	struct swapstore *target = NULL;

	ret = simple_write_to_buffer(bufin, 128, ppos, buf, count);
	bufin[ret] = '\0';

	list_for_each_entry_safe(entry, sav, &swapstoreSET->list, entry) {
		if (strcmp(entry->name, bufin) == 0)
			target = to_swapstore(entry);
	}

	if (refcount_read(&attached->kobj.kref.refcount) > 2)
		return -EBUSY;

	if (target) {
		spin_lock(&list_lock);
		kobject_put(&attached->kobj);
		attached = target;
		kobject_get(&attached->kobj);
		spin_unlock(&list_lock);
		return ret;
	}

	return -EINVAL;
}

static const struct file_operations insert_fops = {
	.owner = THIS_MODULE,
	.read  = insert_read,
	.write = insert_write,
};

static const struct file_operations eject_fops = {
	.owner = THIS_MODULE,
	.read  = eject_read,
	.write = eject_write,
};

static const struct file_operations swapstore_fops = {
	.owner = THIS_MODULE,
	.read  = swapstore_read,
	.write = swapstore_write,
};

static int _open(struct inode *inode, struct file *filp)
{
	spin_lock(&list_lock);
	kobject_get(&attached->kobj);
	spin_unlock(&list_lock);
	return 0;
}

static int _release(struct inode *inode, struct file *filp)
{
	spin_lock(&list_lock);
	kobject_put(&attached->kobj);
	spin_unlock(&list_lock);
	return 0;
}

static ssize_t _read(struct file *filp, char __user *buf,
						size_t size, loff_t *offset)
{
	char str[PAGE_SIZE];
	size_t avail = 0;

	memset(str, '\0', PAGE_SIZE);

	avail = snprintf(str, PAGE_SIZE, "%s\n", attached->data);

	return simple_read_from_buffer(buf, avail, offset, str, avail);

}

static ssize_t _write(struct file *filp, const char __user *buf,
						size_t size, loff_t *offset)
{

	int ret;

	if (attached->readonly == 1)
		return -EPERM;

	ret = simple_write_to_buffer(attached->data, PAGE_SIZE, offset, buf, PAGE_SIZE);
	memset(buf, '\0', ret);

	return ret;
}

static const struct file_operations fops = {
	.owner = THIS_MODULE,
	.read = _read,
	.write = _write,
	.open = _open,
	.release = _release,
};

static struct miscdevice _device = {
	.minor = MISC_DYNAMIC_MINOR,
	.name = "swapper",
	.fops = &fops,
};

static int __init swapstore_init(void)
{

	swapstoreSET = kset_create_and_add("swapstore", NULL, kernel_kobj);
	if (!swapstoreSET)
		return -ENOMEM;

	dir = debugfs_create_dir("swapper", NULL);
	debugfs_create_file("insert", 0200, dir, NULL, &insert_fops);
	debugfs_create_file("eject", 0200, dir, NULL, &eject_fops);
	debugfs_create_file("swapstore", 0600, dir, NULL, &swapstore_fops);

	defaultt = create_swapstore("default");
	if (!defaultt)
		goto default_error;

	misc_register(&_device);
	attached = defaultt;
	kobject_get(&attached->kobj);

	return 0;

default_error:
	kset_unregister(swapstoreSET);
	return -EINVAL;
}

static void __exit swapstore_exit(void)
{
	struct kobject *entry, *sav;

	kobject_put(&attached->kobj);
	list_for_each_entry_safe(entry, sav, &swapstoreSET->list, entry) {
		kobject_put(entry);
	}
	debugfs_remove_recursive(dir);
	kset_unregister(swapstoreSET);
	misc_deregister(&_device);
}

module_init(swapstore_init);
module_exit(swapstore_exit);
MODULE_LICENSE("GPL v2");
MODULE_AUTHOR("Douglas Balish <db984@drexel.edu>");
