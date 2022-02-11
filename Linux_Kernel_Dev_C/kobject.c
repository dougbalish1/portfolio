// SPDX-License-Identifier: GPL-2.0

#include <linux/kobject.h>
#include <linux/string.h>
#include <linux/sysfs.h>
#include <linux/slab.h>
#include <linux/module.h>
#include <linux/init.h>

char models[][50] = {"Samsung EVO SSD", "Western Digital Green HD",
				"Crucial SSD", "Samsung EVO NVMe"};
unsigned long capacities[] = {1922320888, 2884153776, 229701780, 205937544};
char revs[][20] = {"e7va", "wd3922123b", "sg41", "e9nv1"};
int powersaves[] = {0, 1, 1, 0};

struct fakedrive {
	unsigned long capacity;
	const char *model;
	const char *rev;
	struct kobject kobj;
	int powersave;
};

struct kmem_cache *fakedrive_cache;

#define make_fakedrive(x) container_of(x, struct fakedrive, kobj)

struct fake_attribute {
	struct attribute attr;
	ssize_t (*show)(struct fakedrive *fake, struct fake_attribute *attr, char *buf);
	ssize_t (*store)(struct fakedrive *fake, struct fake_attribute *attr, const char *buf, size_t count);
};
#define make_fake_attr(x) container_of(x, struct fake_attribute, attr)

static ssize_t fake_attr_show(struct kobject *kobj,
			     struct attribute *attr,
			     char *buf)
{
	struct fake_attribute *attribute;
	struct fakedrive *fake;

	attribute = make_fake_attr(attr);
	fake = make_fakedrive(kobj);

	if (!attribute->show)
		return -EIO;

	return attribute->show(fake, attribute, buf);
}

static ssize_t fake_attr_store(struct kobject *kobj,
			      struct attribute *attr,
			      const char *buf, size_t len)
{
	struct fake_attribute *attribute;
	struct fakedrive *fake;

	attribute = make_fake_attr(attr);
	fake = make_fakedrive(kobj);

	if (!attribute->store)
		return -EIO;

	return attribute->store(fake, attribute, buf, len);
}

static const struct sysfs_ops fakedrive_sysfs_ops = {
	.show = fake_attr_show,
	.store = fake_attr_store,
};

static void fake_release(struct kobject *kobj)
{
	struct fakedrive *fake;

	fake = make_fakedrive(kobj);
	kmem_cache_free(fakedrive_cache, fake);
}

static ssize_t powersave_show(struct fakedrive *fake, struct fake_attribute *attr,
			char *buf)
{
	return sprintf(buf, "%d\n", fake->powersave);
}

static ssize_t powersave_store(struct fakedrive *fake, struct fake_attribute *attr,
			 const char *buf, size_t count)
{
	int ret;
	int check;

	ret = kstrtoint(buf, 10, &check);
	if (ret < 0)
		return ret;

	if (check == 0 || check == 1) {
		fake->powersave = check;
		return count;
	}

	return -EINVAL;
}

static struct fake_attribute powersave_attribute =
	__ATTR(powersave, 0664, powersave_show, powersave_store);

static ssize_t info_show(struct fakedrive *fake, struct fake_attribute *attr,
		      char *buf)
{
	int var;
	const char *Cvar;

	if (strcmp(attr->attr.name, "capacity") == 0) {
		var = fake->capacity;
		return sprintf(buf, "%d\n", var);
	} else if (strcmp(attr->attr.name, "model") == 0)
		Cvar = fake->model;
	else
		Cvar = fake->rev;

	return sprintf(buf, "%s\n", Cvar);

}

static ssize_t info_store(struct fakedrive *fake, struct fake_attribute *attr,
		       const char *buf, size_t count)
{
	return -EPERM;
}

static struct fake_attribute capacity_attribute =
	__ATTR(capacity, 0444, info_show, info_store);
static struct fake_attribute model_attribute =
	__ATTR(model, 0444, info_show, info_store);
static struct fake_attribute rev_attribute =
	__ATTR(rev, 0444, info_show, info_store);

static struct attribute *fake_default_attrs[] = {
	&powersave_attribute.attr,
	NULL
};

static struct attribute *fake_info_attrs[] = {
	&capacity_attribute.attr,
	&model_attribute.attr,
	&rev_attribute.attr,
	NULL
};

static const struct attribute_group fake_default_group = {
	.attrs = fake_default_attrs
};

static const struct attribute_group fake_info_group = {
	.name  = "info",
	.attrs = fake_info_attrs
};

static const struct attribute_group *fake_default_groups[] = {
	&fake_default_group,
	&fake_info_group,
	NULL
};


static struct kobj_type fake_ktype = {
	.sysfs_ops = &fakedrive_sysfs_ops,
	.release = fake_release,
	.default_groups = fake_default_groups,
};

static struct kset *fakedriver;
static struct fakedrive *device0;
static struct fakedrive *device1;
static struct fakedrive *device2;
static struct fakedrive *device3;

static struct fakedrive *create_fakedrive_struct(const char *name)
{
	struct fakedrive *fake;
	int retval;

	fake = kmem_cache_alloc(fakedrive_cache, GFP_KERNEL | __GFP_ZERO);
	
	if (!fake)
		return NULL;

	fake->kobj.kset = fakedriver;

	retval = kobject_init_and_add(&fake->kobj, &fake_ktype, NULL, "%s", name);
	if (retval) {
		kobject_put(&fake->kobj);
		return NULL;
	}

	kobject_uevent(&fake->kobj, KOBJ_ADD);

	return fake;
}

static void destroy_fakedrive_struct(struct fakedrive *fake)
{
	kobject_put(&fake->kobj);
}

static int __init fakedrive_init(void)
{
	fakedrive_cache = KMEM_CACHE(fakedrive, 0);
	
	fakedriver = kset_create_and_add("fakedrive", NULL, kernel_kobj);
	if (!fakedriver)
		return -ENOMEM;

	device0 = create_fakedrive_struct("device0");
	if (!device0)
		goto device0_error;
	device0->powersave = powersaves[0];
	device0->capacity = capacities[0];
	device0->model = models[0];
	device0->rev = revs[0];

	device1 = create_fakedrive_struct("device1");
	if (!device1)
		goto device1_error;
	device1->powersave = powersaves[1];
	device1->capacity = capacities[1];
	device1->model = models[1];
	device1->rev = revs[1];

	device2 = create_fakedrive_struct("device2");
	if (!device2)
		goto device2_error;
	device2->powersave = powersaves[2];
	device2->capacity = capacities[2];
	device2->model = models[2];
	device2->rev = revs[2];

	device3 = create_fakedrive_struct("device3");
	if (!device3)
		goto device3_error;
	device3->powersave = powersaves[3];
	device3->capacity = capacities[3];
	device3->model = models[3];
	device3->rev = revs[3];

	return 0;

device0_error:
	destroy_fakedrive_struct(device0);
device1_error:
	destroy_fakedrive_struct(device1);
device2_error:
	destroy_fakedrive_struct(device2);
device3_error:
	destroy_fakedrive_struct(device3);

	return -EINVAL;
}

static void __exit fakedrive_exit(void)
{
	destroy_fakedrive_struct(device0);
	destroy_fakedrive_struct(device1);
	destroy_fakedrive_struct(device2);
	destroy_fakedrive_struct(device3);
	kmem_cache_destroy(fakedrive_cache);
	kset_unregister(fakedriver);
}

module_init(fakedrive_init);
module_exit(fakedrive_exit);

MODULE_LICENSE("GPL");
MODULE_AUTHOR("Douglas Balish <db984@drexel.edu>");
MODULE_DESCRIPTION("homework 7 - kobject and sysfs module");
