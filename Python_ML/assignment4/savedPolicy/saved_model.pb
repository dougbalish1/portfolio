??
??
?
ArgMax

input"T
	dimension"Tidx
output"output_type"!
Ttype:
2	
"
Tidxtype0:
2	"
output_typetype0	:
2	
B
AssignVariableOp
resource
value"dtype"
dtypetype?
~
BiasAdd

value"T	
bias"T
output"T" 
Ttype:
2	"-
data_formatstringNHWC:
NHWCNCHW
Z
BroadcastTo

input"T
shape"Tidx
output"T"	
Ttype"
Tidxtype0:
2	
N
Cast	
x"SrcT	
y"DstT"
SrcTtype"
DstTtype"
Truncatebool( 
8
Const
output"dtype"
valuetensor"
dtypetype
?
Conv2D

input"T
filter"T
output"T"
Ttype:	
2"
strides	list(int)"
use_cudnn_on_gpubool(",
paddingstring:
SAMEVALIDEXPLICIT""
explicit_paddings	list(int)
 "-
data_formatstringNHWC:
NHWCNCHW" 
	dilations	list(int)

.
Identity

input"T
output"T"	
Ttype
q
MatMul
a"T
b"T
product"T"
transpose_abool( "
transpose_bbool( "
Ttype:

2	
>
Maximum
x"T
y"T
z"T"
Ttype:
2	
e
MergeV2Checkpoints
checkpoint_prefixes
destination_prefix"
delete_old_dirsbool(?
:
Minimum
x"T
y"T
z"T"
Ttype:

2	

NoOp
M
Pack
values"T*N
output"T"
Nint(0"	
Ttype"
axisint 
?
PartitionedCall
args2Tin
output2Tout"
Tin
list(type)("
Tout
list(type)("	
ffunc"
configstring "
config_protostring "
executor_typestring 
C
Placeholder
output"dtype"
dtypetype"
shapeshape:
@
ReadVariableOp
resource
value"dtype"
dtypetype?
@
RealDiv
x"T
y"T
z"T"
Ttype:
2	
E
Relu
features"T
activations"T"
Ttype:
2	
[
Reshape
tensor"T
shape"Tshape
output"T"	
Ttype"
Tshapetype0:
2	
o
	RestoreV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0?
l
SaveV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0?
?
Select
	condition

t"T
e"T
output"T"	
Ttype
H
ShardedFilename
basename	
shard

num_shards
filename
?
StatefulPartitionedCall
args2Tin
output2Tout"
Tin
list(type)("
Tout
list(type)("	
ffunc"
configstring "
config_protostring "
executor_typestring ?
@
StaticRegexFullMatch	
input

output
"
patternstring
N

StringJoin
inputs*N

output"
Nint(0"
	separatorstring 
?
VarHandleOp
resource"
	containerstring "
shared_namestring "
dtypetype"
shapeshape"#
allowed_deviceslist(string)
 ?"serve*2.5.02v2.5.0-0-ga4dfb8d1a718??
d
VariableVarHandleOp*
_output_shapes
: *
dtype0	*
shape: *
shared_name
Variable
]
Variable/Read/ReadVariableOpReadVariableOpVariable*
_output_shapes
: *
dtype0	
?
&QNetwork/EncodingNetwork/conv2d/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape: *7
shared_name(&QNetwork/EncodingNetwork/conv2d/kernel
?
:QNetwork/EncodingNetwork/conv2d/kernel/Read/ReadVariableOpReadVariableOp&QNetwork/EncodingNetwork/conv2d/kernel*&
_output_shapes
: *
dtype0
?
$QNetwork/EncodingNetwork/conv2d/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape: *5
shared_name&$QNetwork/EncodingNetwork/conv2d/bias
?
8QNetwork/EncodingNetwork/conv2d/bias/Read/ReadVariableOpReadVariableOp$QNetwork/EncodingNetwork/conv2d/bias*
_output_shapes
: *
dtype0
?
(QNetwork/EncodingNetwork/conv2d_1/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape: @*9
shared_name*(QNetwork/EncodingNetwork/conv2d_1/kernel
?
<QNetwork/EncodingNetwork/conv2d_1/kernel/Read/ReadVariableOpReadVariableOp(QNetwork/EncodingNetwork/conv2d_1/kernel*&
_output_shapes
: @*
dtype0
?
&QNetwork/EncodingNetwork/conv2d_1/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*7
shared_name(&QNetwork/EncodingNetwork/conv2d_1/bias
?
:QNetwork/EncodingNetwork/conv2d_1/bias/Read/ReadVariableOpReadVariableOp&QNetwork/EncodingNetwork/conv2d_1/bias*
_output_shapes
:@*
dtype0
?
(QNetwork/EncodingNetwork/conv2d_2/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:@@*9
shared_name*(QNetwork/EncodingNetwork/conv2d_2/kernel
?
<QNetwork/EncodingNetwork/conv2d_2/kernel/Read/ReadVariableOpReadVariableOp(QNetwork/EncodingNetwork/conv2d_2/kernel*&
_output_shapes
:@@*
dtype0
?
&QNetwork/EncodingNetwork/conv2d_2/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*7
shared_name(&QNetwork/EncodingNetwork/conv2d_2/bias
?
:QNetwork/EncodingNetwork/conv2d_2/bias/Read/ReadVariableOpReadVariableOp&QNetwork/EncodingNetwork/conv2d_2/bias*
_output_shapes
:@*
dtype0
?
%QNetwork/EncodingNetwork/dense/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:
??*6
shared_name'%QNetwork/EncodingNetwork/dense/kernel
?
9QNetwork/EncodingNetwork/dense/kernel/Read/ReadVariableOpReadVariableOp%QNetwork/EncodingNetwork/dense/kernel* 
_output_shapes
:
??*
dtype0
?
#QNetwork/EncodingNetwork/dense/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:?*4
shared_name%#QNetwork/EncodingNetwork/dense/bias
?
7QNetwork/EncodingNetwork/dense/bias/Read/ReadVariableOpReadVariableOp#QNetwork/EncodingNetwork/dense/bias*
_output_shapes	
:?*
dtype0
?
QNetwork/dense_1/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:	?	*(
shared_nameQNetwork/dense_1/kernel
?
+QNetwork/dense_1/kernel/Read/ReadVariableOpReadVariableOpQNetwork/dense_1/kernel*
_output_shapes
:	?	*
dtype0
?
QNetwork/dense_1/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:	*&
shared_nameQNetwork/dense_1/bias
{
)QNetwork/dense_1/bias/Read/ReadVariableOpReadVariableOpQNetwork/dense_1/bias*
_output_shapes
:	*
dtype0

NoOpNoOp
?#
ConstConst"/device:CPU:0*
_output_shapes
: *
dtype0*?#
value?#B?# B?#
T

train_step
metadata
model_variables
_all_assets

signatures
CA
VARIABLE_VALUEVariable%train_step/.ATTRIBUTES/VARIABLE_VALUE
 
F
0
1
2
	3

4
5
6
7
8
9

0
 
hf
VARIABLE_VALUE&QNetwork/EncodingNetwork/conv2d/kernel,model_variables/0/.ATTRIBUTES/VARIABLE_VALUE
fd
VARIABLE_VALUE$QNetwork/EncodingNetwork/conv2d/bias,model_variables/1/.ATTRIBUTES/VARIABLE_VALUE
jh
VARIABLE_VALUE(QNetwork/EncodingNetwork/conv2d_1/kernel,model_variables/2/.ATTRIBUTES/VARIABLE_VALUE
hf
VARIABLE_VALUE&QNetwork/EncodingNetwork/conv2d_1/bias,model_variables/3/.ATTRIBUTES/VARIABLE_VALUE
jh
VARIABLE_VALUE(QNetwork/EncodingNetwork/conv2d_2/kernel,model_variables/4/.ATTRIBUTES/VARIABLE_VALUE
hf
VARIABLE_VALUE&QNetwork/EncodingNetwork/conv2d_2/bias,model_variables/5/.ATTRIBUTES/VARIABLE_VALUE
ge
VARIABLE_VALUE%QNetwork/EncodingNetwork/dense/kernel,model_variables/6/.ATTRIBUTES/VARIABLE_VALUE
ec
VARIABLE_VALUE#QNetwork/EncodingNetwork/dense/bias,model_variables/7/.ATTRIBUTES/VARIABLE_VALUE
YW
VARIABLE_VALUEQNetwork/dense_1/kernel,model_variables/8/.ATTRIBUTES/VARIABLE_VALUE
WU
VARIABLE_VALUEQNetwork/dense_1/bias,model_variables/9/.ATTRIBUTES/VARIABLE_VALUE

ref
1


_q_network
t
_encoder
_q_value_layer
	variables
trainable_variables
regularization_losses
	keras_api
?
_flat_preprocessing_layers
_postprocessing_layers
	variables
trainable_variables
regularization_losses
	keras_api
h

kernel
bias
	variables
 trainable_variables
!regularization_losses
"	keras_api
F
0
1
2
	3

4
5
6
7
8
9
F
0
1
2
	3

4
5
6
7
8
9
 
?
	variables
#layer_metrics
$metrics

%layers
&non_trainable_variables
'layer_regularization_losses
trainable_variables
regularization_losses

(0
#
)0
*1
+2
,3
-4
8
0
1
2
	3

4
5
6
7
8
0
1
2
	3

4
5
6
7
 
?
	variables
.layer_metrics
/metrics

0layers
1non_trainable_variables
2layer_regularization_losses
trainable_variables
regularization_losses

0
1

0
1
 
?
	variables
3layer_metrics
4metrics

5layers
6non_trainable_variables
7layer_regularization_losses
 trainable_variables
!regularization_losses
 
 

0
1
 
 
R
8	variables
9trainable_variables
:regularization_losses
;	keras_api
h

kernel
bias
<	variables
=trainable_variables
>regularization_losses
?	keras_api
h

kernel
	bias
@	variables
Atrainable_variables
Bregularization_losses
C	keras_api
h


kernel
bias
D	variables
Etrainable_variables
Fregularization_losses
G	keras_api
R
H	variables
Itrainable_variables
Jregularization_losses
K	keras_api
h

kernel
bias
L	variables
Mtrainable_variables
Nregularization_losses
O	keras_api
 
 
*
(0
)1
*2
+3
,4
-5
 
 
 
 
 
 
 
 
 
 
?
8	variables
Player_metrics
Qmetrics

Rlayers
Snon_trainable_variables
Tlayer_regularization_losses
9trainable_variables
:regularization_losses

0
1

0
1
 
?
<	variables
Ulayer_metrics
Vmetrics

Wlayers
Xnon_trainable_variables
Ylayer_regularization_losses
=trainable_variables
>regularization_losses

0
	1

0
	1
 
?
@	variables
Zlayer_metrics
[metrics

\layers
]non_trainable_variables
^layer_regularization_losses
Atrainable_variables
Bregularization_losses


0
1


0
1
 
?
D	variables
_layer_metrics
`metrics

alayers
bnon_trainable_variables
clayer_regularization_losses
Etrainable_variables
Fregularization_losses
 
 
 
?
H	variables
dlayer_metrics
emetrics

flayers
gnon_trainable_variables
hlayer_regularization_losses
Itrainable_variables
Jregularization_losses

0
1

0
1
 
?
L	variables
ilayer_metrics
jmetrics

klayers
lnon_trainable_variables
mlayer_regularization_losses
Mtrainable_variables
Nregularization_losses
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
Z
action_0/discountPlaceholder*
_output_shapes
:*
dtype0*
shape:
u
action_0/observationPlaceholder*&
_output_shapes
:TT*
dtype0*
shape:TT
X
action_0/rewardPlaceholder*
_output_shapes
:*
dtype0*
shape:
[
action_0/step_typePlaceholder*
_output_shapes
:*
dtype0*
shape:
?
StatefulPartitionedCallStatefulPartitionedCallaction_0/discountaction_0/observationaction_0/rewardaction_0/step_type&QNetwork/EncodingNetwork/conv2d/kernel$QNetwork/EncodingNetwork/conv2d/bias(QNetwork/EncodingNetwork/conv2d_1/kernel&QNetwork/EncodingNetwork/conv2d_1/bias(QNetwork/EncodingNetwork/conv2d_2/kernel&QNetwork/EncodingNetwork/conv2d_2/bias%QNetwork/EncodingNetwork/dense/kernel#QNetwork/EncodingNetwork/dense/biasQNetwork/dense_1/kernelQNetwork/dense_1/bias*
Tin
2*
Tout
2	*
_collective_manager_ids
 *
_output_shapes
:*,
_read_only_resource_inputs

	
*0
config_proto 

CPU

GPU2*0J 8? *.
f)R'
%__inference_signature_wrapper_8225924
?
PartitionedCallPartitionedCall*	
Tin
 *

Tout
 *
_collective_manager_ids
 * 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8? *.
f)R'
%__inference_signature_wrapper_8225928
?
PartitionedCall_1PartitionedCall*	
Tin
 *

Tout
 *
_collective_manager_ids
 * 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8? *.
f)R'
%__inference_signature_wrapper_8225940
?
StatefulPartitionedCall_1StatefulPartitionedCallVariable*
Tin
2*
Tout
2	*
_collective_manager_ids
 *
_output_shapes
: *#
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8? *.
f)R'
%__inference_signature_wrapper_8225936
O
saver_filenamePlaceholder*
_output_shapes
: *
dtype0*
shape: 
?
StatefulPartitionedCall_2StatefulPartitionedCallsaver_filenameVariable/Read/ReadVariableOp:QNetwork/EncodingNetwork/conv2d/kernel/Read/ReadVariableOp8QNetwork/EncodingNetwork/conv2d/bias/Read/ReadVariableOp<QNetwork/EncodingNetwork/conv2d_1/kernel/Read/ReadVariableOp:QNetwork/EncodingNetwork/conv2d_1/bias/Read/ReadVariableOp<QNetwork/EncodingNetwork/conv2d_2/kernel/Read/ReadVariableOp:QNetwork/EncodingNetwork/conv2d_2/bias/Read/ReadVariableOp9QNetwork/EncodingNetwork/dense/kernel/Read/ReadVariableOp7QNetwork/EncodingNetwork/dense/bias/Read/ReadVariableOp+QNetwork/dense_1/kernel/Read/ReadVariableOp)QNetwork/dense_1/bias/Read/ReadVariableOpConst*
Tin
2	*
Tout
2*
_collective_manager_ids
 *
_output_shapes
: * 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8? *)
f$R"
 __inference__traced_save_8226000
?
StatefulPartitionedCall_3StatefulPartitionedCallsaver_filenameVariable&QNetwork/EncodingNetwork/conv2d/kernel$QNetwork/EncodingNetwork/conv2d/bias(QNetwork/EncodingNetwork/conv2d_1/kernel&QNetwork/EncodingNetwork/conv2d_1/bias(QNetwork/EncodingNetwork/conv2d_2/kernel&QNetwork/EncodingNetwork/conv2d_2/bias%QNetwork/EncodingNetwork/dense/kernel#QNetwork/EncodingNetwork/dense/biasQNetwork/dense_1/kernelQNetwork/dense_1/bias*
Tin
2*
Tout
2*
_collective_manager_ids
 *
_output_shapes
: * 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8? *,
f'R%
#__inference__traced_restore_8226043??
?
'
%__inference_signature_wrapper_8225928?
PartitionedCallPartitionedCall*	
Tin
 *

Tout
 *
_collective_manager_ids
 *
_output_shapes
 * 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8? *4
f/R-
+__inference_function_with_signature_53695082
PartitionedCall*(
_construction_contextkEagerRuntime*
_input_shapes 
?X
?
/__inference_polymorphic_distribution_fn_5369708
	step_type

reward
discount
observationX
>qnetwork_encodingnetwork_conv2d_conv2d_readvariableop_resource: M
?qnetwork_encodingnetwork_conv2d_biasadd_readvariableop_resource: Z
@qnetwork_encodingnetwork_conv2d_1_conv2d_readvariableop_resource: @O
Aqnetwork_encodingnetwork_conv2d_1_biasadd_readvariableop_resource:@Z
@qnetwork_encodingnetwork_conv2d_2_conv2d_readvariableop_resource:@@O
Aqnetwork_encodingnetwork_conv2d_2_biasadd_readvariableop_resource:@Q
=qnetwork_encodingnetwork_dense_matmul_readvariableop_resource:
??M
>qnetwork_encodingnetwork_dense_biasadd_readvariableop_resource:	?B
/qnetwork_dense_1_matmul_readvariableop_resource:	?	>
0qnetwork_dense_1_biasadd_readvariableop_resource:	
identity	??6QNetwork/EncodingNetwork/conv2d/BiasAdd/ReadVariableOp?5QNetwork/EncodingNetwork/conv2d/Conv2D/ReadVariableOp?8QNetwork/EncodingNetwork/conv2d_1/BiasAdd/ReadVariableOp?7QNetwork/EncodingNetwork/conv2d_1/Conv2D/ReadVariableOp?8QNetwork/EncodingNetwork/conv2d_2/BiasAdd/ReadVariableOp?7QNetwork/EncodingNetwork/conv2d_2/Conv2D/ReadVariableOp?5QNetwork/EncodingNetwork/dense/BiasAdd/ReadVariableOp?4QNetwork/EncodingNetwork/dense/MatMul/ReadVariableOp?'QNetwork/dense_1/BiasAdd/ReadVariableOp?&QNetwork/dense_1/MatMul/ReadVariableOp?
$QNetwork/EncodingNetwork/lambda/CastCastobservation*

DstT0*

SrcT0*&
_output_shapes
:TT2&
$QNetwork/EncodingNetwork/lambda/Cast?
)QNetwork/EncodingNetwork/lambda/truediv/yConst*
_output_shapes
: *
dtype0*
valueB
 *  C2+
)QNetwork/EncodingNetwork/lambda/truediv/y?
'QNetwork/EncodingNetwork/lambda/truedivRealDiv(QNetwork/EncodingNetwork/lambda/Cast:y:02QNetwork/EncodingNetwork/lambda/truediv/y:output:0*
T0*&
_output_shapes
:TT2)
'QNetwork/EncodingNetwork/lambda/truediv?
5QNetwork/EncodingNetwork/conv2d/Conv2D/ReadVariableOpReadVariableOp>qnetwork_encodingnetwork_conv2d_conv2d_readvariableop_resource*&
_output_shapes
: *
dtype027
5QNetwork/EncodingNetwork/conv2d/Conv2D/ReadVariableOp?
&QNetwork/EncodingNetwork/conv2d/Conv2DConv2D+QNetwork/EncodingNetwork/lambda/truediv:z:0=QNetwork/EncodingNetwork/conv2d/Conv2D/ReadVariableOp:value:0*
T0*&
_output_shapes
: *
paddingVALID*
strides
2(
&QNetwork/EncodingNetwork/conv2d/Conv2D?
6QNetwork/EncodingNetwork/conv2d/BiasAdd/ReadVariableOpReadVariableOp?qnetwork_encodingnetwork_conv2d_biasadd_readvariableop_resource*
_output_shapes
: *
dtype028
6QNetwork/EncodingNetwork/conv2d/BiasAdd/ReadVariableOp?
'QNetwork/EncodingNetwork/conv2d/BiasAddBiasAdd/QNetwork/EncodingNetwork/conv2d/Conv2D:output:0>QNetwork/EncodingNetwork/conv2d/BiasAdd/ReadVariableOp:value:0*
T0*&
_output_shapes
: 2)
'QNetwork/EncodingNetwork/conv2d/BiasAdd?
$QNetwork/EncodingNetwork/conv2d/ReluRelu0QNetwork/EncodingNetwork/conv2d/BiasAdd:output:0*
T0*&
_output_shapes
: 2&
$QNetwork/EncodingNetwork/conv2d/Relu?
7QNetwork/EncodingNetwork/conv2d_1/Conv2D/ReadVariableOpReadVariableOp@qnetwork_encodingnetwork_conv2d_1_conv2d_readvariableop_resource*&
_output_shapes
: @*
dtype029
7QNetwork/EncodingNetwork/conv2d_1/Conv2D/ReadVariableOp?
(QNetwork/EncodingNetwork/conv2d_1/Conv2DConv2D2QNetwork/EncodingNetwork/conv2d/Relu:activations:0?QNetwork/EncodingNetwork/conv2d_1/Conv2D/ReadVariableOp:value:0*
T0*&
_output_shapes
:		@*
paddingVALID*
strides
2*
(QNetwork/EncodingNetwork/conv2d_1/Conv2D?
8QNetwork/EncodingNetwork/conv2d_1/BiasAdd/ReadVariableOpReadVariableOpAqnetwork_encodingnetwork_conv2d_1_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype02:
8QNetwork/EncodingNetwork/conv2d_1/BiasAdd/ReadVariableOp?
)QNetwork/EncodingNetwork/conv2d_1/BiasAddBiasAdd1QNetwork/EncodingNetwork/conv2d_1/Conv2D:output:0@QNetwork/EncodingNetwork/conv2d_1/BiasAdd/ReadVariableOp:value:0*
T0*&
_output_shapes
:		@2+
)QNetwork/EncodingNetwork/conv2d_1/BiasAdd?
&QNetwork/EncodingNetwork/conv2d_1/ReluRelu2QNetwork/EncodingNetwork/conv2d_1/BiasAdd:output:0*
T0*&
_output_shapes
:		@2(
&QNetwork/EncodingNetwork/conv2d_1/Relu?
7QNetwork/EncodingNetwork/conv2d_2/Conv2D/ReadVariableOpReadVariableOp@qnetwork_encodingnetwork_conv2d_2_conv2d_readvariableop_resource*&
_output_shapes
:@@*
dtype029
7QNetwork/EncodingNetwork/conv2d_2/Conv2D/ReadVariableOp?
(QNetwork/EncodingNetwork/conv2d_2/Conv2DConv2D4QNetwork/EncodingNetwork/conv2d_1/Relu:activations:0?QNetwork/EncodingNetwork/conv2d_2/Conv2D/ReadVariableOp:value:0*
T0*&
_output_shapes
:@*
paddingVALID*
strides
2*
(QNetwork/EncodingNetwork/conv2d_2/Conv2D?
8QNetwork/EncodingNetwork/conv2d_2/BiasAdd/ReadVariableOpReadVariableOpAqnetwork_encodingnetwork_conv2d_2_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype02:
8QNetwork/EncodingNetwork/conv2d_2/BiasAdd/ReadVariableOp?
)QNetwork/EncodingNetwork/conv2d_2/BiasAddBiasAdd1QNetwork/EncodingNetwork/conv2d_2/Conv2D:output:0@QNetwork/EncodingNetwork/conv2d_2/BiasAdd/ReadVariableOp:value:0*
T0*&
_output_shapes
:@2+
)QNetwork/EncodingNetwork/conv2d_2/BiasAdd?
&QNetwork/EncodingNetwork/conv2d_2/ReluRelu2QNetwork/EncodingNetwork/conv2d_2/BiasAdd:output:0*
T0*&
_output_shapes
:@2(
&QNetwork/EncodingNetwork/conv2d_2/Relu?
&QNetwork/EncodingNetwork/flatten/ConstConst*
_output_shapes
:*
dtype0*
valueB"????@  2(
&QNetwork/EncodingNetwork/flatten/Const?
(QNetwork/EncodingNetwork/flatten/ReshapeReshape4QNetwork/EncodingNetwork/conv2d_2/Relu:activations:0/QNetwork/EncodingNetwork/flatten/Const:output:0*
T0*
_output_shapes
:	?2*
(QNetwork/EncodingNetwork/flatten/Reshape?
4QNetwork/EncodingNetwork/dense/MatMul/ReadVariableOpReadVariableOp=qnetwork_encodingnetwork_dense_matmul_readvariableop_resource* 
_output_shapes
:
??*
dtype026
4QNetwork/EncodingNetwork/dense/MatMul/ReadVariableOp?
%QNetwork/EncodingNetwork/dense/MatMulMatMul1QNetwork/EncodingNetwork/flatten/Reshape:output:0<QNetwork/EncodingNetwork/dense/MatMul/ReadVariableOp:value:0*
T0*
_output_shapes
:	?2'
%QNetwork/EncodingNetwork/dense/MatMul?
5QNetwork/EncodingNetwork/dense/BiasAdd/ReadVariableOpReadVariableOp>qnetwork_encodingnetwork_dense_biasadd_readvariableop_resource*
_output_shapes	
:?*
dtype027
5QNetwork/EncodingNetwork/dense/BiasAdd/ReadVariableOp?
&QNetwork/EncodingNetwork/dense/BiasAddBiasAdd/QNetwork/EncodingNetwork/dense/MatMul:product:0=QNetwork/EncodingNetwork/dense/BiasAdd/ReadVariableOp:value:0*
T0*
_output_shapes
:	?2(
&QNetwork/EncodingNetwork/dense/BiasAdd?
#QNetwork/EncodingNetwork/dense/ReluRelu/QNetwork/EncodingNetwork/dense/BiasAdd:output:0*
T0*
_output_shapes
:	?2%
#QNetwork/EncodingNetwork/dense/Relu?
&QNetwork/dense_1/MatMul/ReadVariableOpReadVariableOp/qnetwork_dense_1_matmul_readvariableop_resource*
_output_shapes
:	?	*
dtype02(
&QNetwork/dense_1/MatMul/ReadVariableOp?
QNetwork/dense_1/MatMulMatMul1QNetwork/EncodingNetwork/dense/Relu:activations:0.QNetwork/dense_1/MatMul/ReadVariableOp:value:0*
T0*
_output_shapes

:	2
QNetwork/dense_1/MatMul?
'QNetwork/dense_1/BiasAdd/ReadVariableOpReadVariableOp0qnetwork_dense_1_biasadd_readvariableop_resource*
_output_shapes
:	*
dtype02)
'QNetwork/dense_1/BiasAdd/ReadVariableOp?
QNetwork/dense_1/BiasAddBiasAdd!QNetwork/dense_1/MatMul:product:0/QNetwork/dense_1/BiasAdd/ReadVariableOp:value:0*
T0*
_output_shapes

:	2
QNetwork/dense_1/BiasAdd?
#Categorical_1/mode/ArgMax/dimensionConst*
_output_shapes
: *
dtype0*
valueB :
?????????2%
#Categorical_1/mode/ArgMax/dimension?
Categorical_1/mode/ArgMaxArgMax!QNetwork/dense_1/BiasAdd:output:0,Categorical_1/mode/ArgMax/dimension:output:0*
T0*
_output_shapes
:2
Categorical_1/mode/ArgMaxj
Deterministic/atolConst*
_output_shapes
: *
dtype0	*
value	B	 R 2
Deterministic/atolj
Deterministic/rtolConst*
_output_shapes
: *
dtype0	*
value	B	 R 2
Deterministic/rtoln
Deterministic_1/atolConst*
_output_shapes
: *
dtype0	*
value	B	 R 2
Deterministic_1/atoln
Deterministic_1/rtolConst*
_output_shapes
: *
dtype0	*
value	B	 R 2
Deterministic_1/rtol?
IdentityIdentity"Categorical_1/mode/ArgMax:output:07^QNetwork/EncodingNetwork/conv2d/BiasAdd/ReadVariableOp6^QNetwork/EncodingNetwork/conv2d/Conv2D/ReadVariableOp9^QNetwork/EncodingNetwork/conv2d_1/BiasAdd/ReadVariableOp8^QNetwork/EncodingNetwork/conv2d_1/Conv2D/ReadVariableOp9^QNetwork/EncodingNetwork/conv2d_2/BiasAdd/ReadVariableOp8^QNetwork/EncodingNetwork/conv2d_2/Conv2D/ReadVariableOp6^QNetwork/EncodingNetwork/dense/BiasAdd/ReadVariableOp5^QNetwork/EncodingNetwork/dense/MatMul/ReadVariableOp(^QNetwork/dense_1/BiasAdd/ReadVariableOp'^QNetwork/dense_1/MatMul/ReadVariableOp*
T0	*
_output_shapes
:2

Identityn
Deterministic_2/atolConst*
_output_shapes
: *
dtype0	*
value	B	 R 2
Deterministic_2/atoln
Deterministic_2/rtolConst*
_output_shapes
: *
dtype0	*
value	B	 R 2
Deterministic_2/rtol"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*K
_input_shapes:
8::::TT: : : : : : : : : : 2p
6QNetwork/EncodingNetwork/conv2d/BiasAdd/ReadVariableOp6QNetwork/EncodingNetwork/conv2d/BiasAdd/ReadVariableOp2n
5QNetwork/EncodingNetwork/conv2d/Conv2D/ReadVariableOp5QNetwork/EncodingNetwork/conv2d/Conv2D/ReadVariableOp2t
8QNetwork/EncodingNetwork/conv2d_1/BiasAdd/ReadVariableOp8QNetwork/EncodingNetwork/conv2d_1/BiasAdd/ReadVariableOp2r
7QNetwork/EncodingNetwork/conv2d_1/Conv2D/ReadVariableOp7QNetwork/EncodingNetwork/conv2d_1/Conv2D/ReadVariableOp2t
8QNetwork/EncodingNetwork/conv2d_2/BiasAdd/ReadVariableOp8QNetwork/EncodingNetwork/conv2d_2/BiasAdd/ReadVariableOp2r
7QNetwork/EncodingNetwork/conv2d_2/Conv2D/ReadVariableOp7QNetwork/EncodingNetwork/conv2d_2/Conv2D/ReadVariableOp2n
5QNetwork/EncodingNetwork/dense/BiasAdd/ReadVariableOp5QNetwork/EncodingNetwork/dense/BiasAdd/ReadVariableOp2l
4QNetwork/EncodingNetwork/dense/MatMul/ReadVariableOp4QNetwork/EncodingNetwork/dense/MatMul/ReadVariableOp2R
'QNetwork/dense_1/BiasAdd/ReadVariableOp'QNetwork/dense_1/BiasAdd/ReadVariableOp2P
&QNetwork/dense_1/MatMul/ReadVariableOp&QNetwork/dense_1/MatMul/ReadVariableOp:E A

_output_shapes
:
#
_user_specified_name	step_type:B>

_output_shapes
:
 
_user_specified_namereward:D@

_output_shapes
:
"
_user_specified_name
discount:SO
&
_output_shapes
:TT
%
_user_specified_nameobservation
?
-
+__inference_function_with_signature_5369508?
PartitionedCallPartitionedCall*	
Tin
 *

Tout
 *
_collective_manager_ids
 *
_output_shapes
 * 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8? *%
f R
__inference_function_53695072
PartitionedCall*(
_construction_contextkEagerRuntime*
_input_shapes 
?
k
+__inference_function_with_signature_5369519
unknown:	 
identity	??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallunknown*
Tin
2*
Tout
2	*
_collective_manager_ids
 *
_output_shapes
: *#
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8? *%
f R
__inference_<lambda>_53691772
StatefulPartitionedCall}
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0	*
_output_shapes
: 2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*
_input_shapes
: 22
StatefulPartitionedCallStatefulPartitionedCall
]

__inference_<lambda>_5369180*(
_construction_contextkEagerRuntime*
_input_shapes 
?
-
+__inference_function_with_signature_5369530?
PartitionedCallPartitionedCall*	
Tin
 *

Tout
 *
_collective_manager_ids
 *
_output_shapes
 * 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8? *%
f R
__inference_<lambda>_53691802
PartitionedCall*(
_construction_contextkEagerRuntime*
_input_shapes 
?
c
__inference_<lambda>_5369177!
readvariableop_resource:	 
identity	??ReadVariableOpp
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
: *
dtype0	2
ReadVariableOpj
IdentityIdentityReadVariableOp:value:0^ReadVariableOp*
T0	*
_output_shapes
: 2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*
_input_shapes
: 2 
ReadVariableOpReadVariableOp
?`
?
)__inference_polymorphic_action_fn_5369594
	step_type

reward
discount
observationX
>qnetwork_encodingnetwork_conv2d_conv2d_readvariableop_resource: M
?qnetwork_encodingnetwork_conv2d_biasadd_readvariableop_resource: Z
@qnetwork_encodingnetwork_conv2d_1_conv2d_readvariableop_resource: @O
Aqnetwork_encodingnetwork_conv2d_1_biasadd_readvariableop_resource:@Z
@qnetwork_encodingnetwork_conv2d_2_conv2d_readvariableop_resource:@@O
Aqnetwork_encodingnetwork_conv2d_2_biasadd_readvariableop_resource:@Q
=qnetwork_encodingnetwork_dense_matmul_readvariableop_resource:
??M
>qnetwork_encodingnetwork_dense_biasadd_readvariableop_resource:	?B
/qnetwork_dense_1_matmul_readvariableop_resource:	?	>
0qnetwork_dense_1_biasadd_readvariableop_resource:	
identity	??6QNetwork/EncodingNetwork/conv2d/BiasAdd/ReadVariableOp?5QNetwork/EncodingNetwork/conv2d/Conv2D/ReadVariableOp?8QNetwork/EncodingNetwork/conv2d_1/BiasAdd/ReadVariableOp?7QNetwork/EncodingNetwork/conv2d_1/Conv2D/ReadVariableOp?8QNetwork/EncodingNetwork/conv2d_2/BiasAdd/ReadVariableOp?7QNetwork/EncodingNetwork/conv2d_2/Conv2D/ReadVariableOp?5QNetwork/EncodingNetwork/dense/BiasAdd/ReadVariableOp?4QNetwork/EncodingNetwork/dense/MatMul/ReadVariableOp?'QNetwork/dense_1/BiasAdd/ReadVariableOp?&QNetwork/dense_1/MatMul/ReadVariableOp?
$QNetwork/EncodingNetwork/lambda/CastCastobservation*

DstT0*

SrcT0*&
_output_shapes
:TT2&
$QNetwork/EncodingNetwork/lambda/Cast?
)QNetwork/EncodingNetwork/lambda/truediv/yConst*
_output_shapes
: *
dtype0*
valueB
 *  C2+
)QNetwork/EncodingNetwork/lambda/truediv/y?
'QNetwork/EncodingNetwork/lambda/truedivRealDiv(QNetwork/EncodingNetwork/lambda/Cast:y:02QNetwork/EncodingNetwork/lambda/truediv/y:output:0*
T0*&
_output_shapes
:TT2)
'QNetwork/EncodingNetwork/lambda/truediv?
5QNetwork/EncodingNetwork/conv2d/Conv2D/ReadVariableOpReadVariableOp>qnetwork_encodingnetwork_conv2d_conv2d_readvariableop_resource*&
_output_shapes
: *
dtype027
5QNetwork/EncodingNetwork/conv2d/Conv2D/ReadVariableOp?
&QNetwork/EncodingNetwork/conv2d/Conv2DConv2D+QNetwork/EncodingNetwork/lambda/truediv:z:0=QNetwork/EncodingNetwork/conv2d/Conv2D/ReadVariableOp:value:0*
T0*&
_output_shapes
: *
paddingVALID*
strides
2(
&QNetwork/EncodingNetwork/conv2d/Conv2D?
6QNetwork/EncodingNetwork/conv2d/BiasAdd/ReadVariableOpReadVariableOp?qnetwork_encodingnetwork_conv2d_biasadd_readvariableop_resource*
_output_shapes
: *
dtype028
6QNetwork/EncodingNetwork/conv2d/BiasAdd/ReadVariableOp?
'QNetwork/EncodingNetwork/conv2d/BiasAddBiasAdd/QNetwork/EncodingNetwork/conv2d/Conv2D:output:0>QNetwork/EncodingNetwork/conv2d/BiasAdd/ReadVariableOp:value:0*
T0*&
_output_shapes
: 2)
'QNetwork/EncodingNetwork/conv2d/BiasAdd?
$QNetwork/EncodingNetwork/conv2d/ReluRelu0QNetwork/EncodingNetwork/conv2d/BiasAdd:output:0*
T0*&
_output_shapes
: 2&
$QNetwork/EncodingNetwork/conv2d/Relu?
7QNetwork/EncodingNetwork/conv2d_1/Conv2D/ReadVariableOpReadVariableOp@qnetwork_encodingnetwork_conv2d_1_conv2d_readvariableop_resource*&
_output_shapes
: @*
dtype029
7QNetwork/EncodingNetwork/conv2d_1/Conv2D/ReadVariableOp?
(QNetwork/EncodingNetwork/conv2d_1/Conv2DConv2D2QNetwork/EncodingNetwork/conv2d/Relu:activations:0?QNetwork/EncodingNetwork/conv2d_1/Conv2D/ReadVariableOp:value:0*
T0*&
_output_shapes
:		@*
paddingVALID*
strides
2*
(QNetwork/EncodingNetwork/conv2d_1/Conv2D?
8QNetwork/EncodingNetwork/conv2d_1/BiasAdd/ReadVariableOpReadVariableOpAqnetwork_encodingnetwork_conv2d_1_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype02:
8QNetwork/EncodingNetwork/conv2d_1/BiasAdd/ReadVariableOp?
)QNetwork/EncodingNetwork/conv2d_1/BiasAddBiasAdd1QNetwork/EncodingNetwork/conv2d_1/Conv2D:output:0@QNetwork/EncodingNetwork/conv2d_1/BiasAdd/ReadVariableOp:value:0*
T0*&
_output_shapes
:		@2+
)QNetwork/EncodingNetwork/conv2d_1/BiasAdd?
&QNetwork/EncodingNetwork/conv2d_1/ReluRelu2QNetwork/EncodingNetwork/conv2d_1/BiasAdd:output:0*
T0*&
_output_shapes
:		@2(
&QNetwork/EncodingNetwork/conv2d_1/Relu?
7QNetwork/EncodingNetwork/conv2d_2/Conv2D/ReadVariableOpReadVariableOp@qnetwork_encodingnetwork_conv2d_2_conv2d_readvariableop_resource*&
_output_shapes
:@@*
dtype029
7QNetwork/EncodingNetwork/conv2d_2/Conv2D/ReadVariableOp?
(QNetwork/EncodingNetwork/conv2d_2/Conv2DConv2D4QNetwork/EncodingNetwork/conv2d_1/Relu:activations:0?QNetwork/EncodingNetwork/conv2d_2/Conv2D/ReadVariableOp:value:0*
T0*&
_output_shapes
:@*
paddingVALID*
strides
2*
(QNetwork/EncodingNetwork/conv2d_2/Conv2D?
8QNetwork/EncodingNetwork/conv2d_2/BiasAdd/ReadVariableOpReadVariableOpAqnetwork_encodingnetwork_conv2d_2_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype02:
8QNetwork/EncodingNetwork/conv2d_2/BiasAdd/ReadVariableOp?
)QNetwork/EncodingNetwork/conv2d_2/BiasAddBiasAdd1QNetwork/EncodingNetwork/conv2d_2/Conv2D:output:0@QNetwork/EncodingNetwork/conv2d_2/BiasAdd/ReadVariableOp:value:0*
T0*&
_output_shapes
:@2+
)QNetwork/EncodingNetwork/conv2d_2/BiasAdd?
&QNetwork/EncodingNetwork/conv2d_2/ReluRelu2QNetwork/EncodingNetwork/conv2d_2/BiasAdd:output:0*
T0*&
_output_shapes
:@2(
&QNetwork/EncodingNetwork/conv2d_2/Relu?
&QNetwork/EncodingNetwork/flatten/ConstConst*
_output_shapes
:*
dtype0*
valueB"????@  2(
&QNetwork/EncodingNetwork/flatten/Const?
(QNetwork/EncodingNetwork/flatten/ReshapeReshape4QNetwork/EncodingNetwork/conv2d_2/Relu:activations:0/QNetwork/EncodingNetwork/flatten/Const:output:0*
T0*
_output_shapes
:	?2*
(QNetwork/EncodingNetwork/flatten/Reshape?
4QNetwork/EncodingNetwork/dense/MatMul/ReadVariableOpReadVariableOp=qnetwork_encodingnetwork_dense_matmul_readvariableop_resource* 
_output_shapes
:
??*
dtype026
4QNetwork/EncodingNetwork/dense/MatMul/ReadVariableOp?
%QNetwork/EncodingNetwork/dense/MatMulMatMul1QNetwork/EncodingNetwork/flatten/Reshape:output:0<QNetwork/EncodingNetwork/dense/MatMul/ReadVariableOp:value:0*
T0*
_output_shapes
:	?2'
%QNetwork/EncodingNetwork/dense/MatMul?
5QNetwork/EncodingNetwork/dense/BiasAdd/ReadVariableOpReadVariableOp>qnetwork_encodingnetwork_dense_biasadd_readvariableop_resource*
_output_shapes	
:?*
dtype027
5QNetwork/EncodingNetwork/dense/BiasAdd/ReadVariableOp?
&QNetwork/EncodingNetwork/dense/BiasAddBiasAdd/QNetwork/EncodingNetwork/dense/MatMul:product:0=QNetwork/EncodingNetwork/dense/BiasAdd/ReadVariableOp:value:0*
T0*
_output_shapes
:	?2(
&QNetwork/EncodingNetwork/dense/BiasAdd?
#QNetwork/EncodingNetwork/dense/ReluRelu/QNetwork/EncodingNetwork/dense/BiasAdd:output:0*
T0*
_output_shapes
:	?2%
#QNetwork/EncodingNetwork/dense/Relu?
&QNetwork/dense_1/MatMul/ReadVariableOpReadVariableOp/qnetwork_dense_1_matmul_readvariableop_resource*
_output_shapes
:	?	*
dtype02(
&QNetwork/dense_1/MatMul/ReadVariableOp?
QNetwork/dense_1/MatMulMatMul1QNetwork/EncodingNetwork/dense/Relu:activations:0.QNetwork/dense_1/MatMul/ReadVariableOp:value:0*
T0*
_output_shapes

:	2
QNetwork/dense_1/MatMul?
'QNetwork/dense_1/BiasAdd/ReadVariableOpReadVariableOp0qnetwork_dense_1_biasadd_readvariableop_resource*
_output_shapes
:	*
dtype02)
'QNetwork/dense_1/BiasAdd/ReadVariableOp?
QNetwork/dense_1/BiasAddBiasAdd!QNetwork/dense_1/MatMul:product:0/QNetwork/dense_1/BiasAdd/ReadVariableOp:value:0*
T0*
_output_shapes

:	2
QNetwork/dense_1/BiasAdd?
#Categorical_1/mode/ArgMax/dimensionConst*
_output_shapes
: *
dtype0*
valueB :
?????????2%
#Categorical_1/mode/ArgMax/dimension?
Categorical_1/mode/ArgMaxArgMax!QNetwork/dense_1/BiasAdd:output:0,Categorical_1/mode/ArgMax/dimension:output:0*
T0*
_output_shapes
:2
Categorical_1/mode/ArgMaxj
Deterministic/atolConst*
_output_shapes
: *
dtype0	*
value	B	 R 2
Deterministic/atolj
Deterministic/rtolConst*
_output_shapes
: *
dtype0	*
value	B	 R 2
Deterministic/rtol?
#Deterministic_1/sample/sample_shapeConst*
_output_shapes
: *
dtype0*
valueB 2%
#Deterministic_1/sample/sample_shape
Deterministic_1/sample/ConstConst*
_output_shapes
: *
dtype0*
valueB 2
Deterministic_1/sample/Const?
(Deterministic_1/sample/BroadcastTo/shapeConst*
_output_shapes
:*
dtype0*
valueB"      2*
(Deterministic_1/sample/BroadcastTo/shape?
"Deterministic_1/sample/BroadcastToBroadcastTo"Categorical_1/mode/ArgMax:output:01Deterministic_1/sample/BroadcastTo/shape:output:0*
T0	*
_output_shapes

:2$
"Deterministic_1/sample/BroadcastTo?
$Deterministic_1/sample/Reshape/shapeConst*
_output_shapes
:*
dtype0*
valueB:2&
$Deterministic_1/sample/Reshape/shape?
Deterministic_1/sample/ReshapeReshape+Deterministic_1/sample/BroadcastTo:output:0-Deterministic_1/sample/Reshape/shape:output:0*
T0	*
_output_shapes
:2 
Deterministic_1/sample/Reshapet
clip_by_value/Minimum/yConst*
_output_shapes
: *
dtype0	*
value	B	 R2
clip_by_value/Minimum/y?
clip_by_value/MinimumMinimum'Deterministic_1/sample/Reshape:output:0 clip_by_value/Minimum/y:output:0*
T0	*
_output_shapes
:2
clip_by_value/Minimumd
clip_by_value/yConst*
_output_shapes
: *
dtype0	*
value	B	 R 2
clip_by_value/y?
clip_by_valueMaximumclip_by_value/Minimum:z:0clip_by_value/y:output:0*
T0	*
_output_shapes
:2
clip_by_value?
IdentityIdentityclip_by_value:z:07^QNetwork/EncodingNetwork/conv2d/BiasAdd/ReadVariableOp6^QNetwork/EncodingNetwork/conv2d/Conv2D/ReadVariableOp9^QNetwork/EncodingNetwork/conv2d_1/BiasAdd/ReadVariableOp8^QNetwork/EncodingNetwork/conv2d_1/Conv2D/ReadVariableOp9^QNetwork/EncodingNetwork/conv2d_2/BiasAdd/ReadVariableOp8^QNetwork/EncodingNetwork/conv2d_2/Conv2D/ReadVariableOp6^QNetwork/EncodingNetwork/dense/BiasAdd/ReadVariableOp5^QNetwork/EncodingNetwork/dense/MatMul/ReadVariableOp(^QNetwork/dense_1/BiasAdd/ReadVariableOp'^QNetwork/dense_1/MatMul/ReadVariableOp*
T0	*
_output_shapes
:2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*K
_input_shapes:
8::::TT: : : : : : : : : : 2p
6QNetwork/EncodingNetwork/conv2d/BiasAdd/ReadVariableOp6QNetwork/EncodingNetwork/conv2d/BiasAdd/ReadVariableOp2n
5QNetwork/EncodingNetwork/conv2d/Conv2D/ReadVariableOp5QNetwork/EncodingNetwork/conv2d/Conv2D/ReadVariableOp2t
8QNetwork/EncodingNetwork/conv2d_1/BiasAdd/ReadVariableOp8QNetwork/EncodingNetwork/conv2d_1/BiasAdd/ReadVariableOp2r
7QNetwork/EncodingNetwork/conv2d_1/Conv2D/ReadVariableOp7QNetwork/EncodingNetwork/conv2d_1/Conv2D/ReadVariableOp2t
8QNetwork/EncodingNetwork/conv2d_2/BiasAdd/ReadVariableOp8QNetwork/EncodingNetwork/conv2d_2/BiasAdd/ReadVariableOp2r
7QNetwork/EncodingNetwork/conv2d_2/Conv2D/ReadVariableOp7QNetwork/EncodingNetwork/conv2d_2/Conv2D/ReadVariableOp2n
5QNetwork/EncodingNetwork/dense/BiasAdd/ReadVariableOp5QNetwork/EncodingNetwork/dense/BiasAdd/ReadVariableOp2l
4QNetwork/EncodingNetwork/dense/MatMul/ReadVariableOp4QNetwork/EncodingNetwork/dense/MatMul/ReadVariableOp2R
'QNetwork/dense_1/BiasAdd/ReadVariableOp'QNetwork/dense_1/BiasAdd/ReadVariableOp2P
&QNetwork/dense_1/MatMul/ReadVariableOp&QNetwork/dense_1/MatMul/ReadVariableOp:E A

_output_shapes
:
#
_user_specified_name	step_type:B>

_output_shapes
:
 
_user_specified_namereward:D@

_output_shapes
:
"
_user_specified_name
discount:SO
&
_output_shapes
:TT
%
_user_specified_nameobservation
?
e
%__inference_signature_wrapper_8225936
unknown:	 
identity	??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallunknown*
Tin
2*
Tout
2	*
_collective_manager_ids
 *
_output_shapes
: *#
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8? *4
f/R-
+__inference_function_with_signature_53695192
StatefulPartitionedCall}
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0	*
_output_shapes
: 2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*
_input_shapes
: 22
StatefulPartitionedCallStatefulPartitionedCall
]

__inference_function_5369507*(
_construction_contextkEagerRuntime*
_input_shapes 
?
?
%__inference_signature_wrapper_8225924
discount
observation

reward
	step_type!
unknown: 
	unknown_0: #
	unknown_1: @
	unknown_2:@#
	unknown_3:@@
	unknown_4:@
	unknown_5:
??
	unknown_6:	?
	unknown_7:	?	
	unknown_8:	
identity	??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCall	step_typerewarddiscountobservationunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8*
Tin
2*
Tout
2	*
_collective_manager_ids
 *
_output_shapes
:*,
_read_only_resource_inputs

	
*0
config_proto 

CPU

GPU2*0J 8? *4
f/R-
+__inference_function_with_signature_53694732
StatefulPartitionedCall?
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0	*
_output_shapes
:2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*K
_input_shapes:
8::TT::: : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:F B

_output_shapes
:
$
_user_specified_name
0/discount:UQ
&
_output_shapes
:TT
'
_user_specified_name0/observation:D@

_output_shapes
:
"
_user_specified_name
0/reward:GC

_output_shapes
:
%
_user_specified_name0/step_type
?4
?
#__inference__traced_restore_8226043
file_prefix#
assignvariableop_variable:	 S
9assignvariableop_1_qnetwork_encodingnetwork_conv2d_kernel: E
7assignvariableop_2_qnetwork_encodingnetwork_conv2d_bias: U
;assignvariableop_3_qnetwork_encodingnetwork_conv2d_1_kernel: @G
9assignvariableop_4_qnetwork_encodingnetwork_conv2d_1_bias:@U
;assignvariableop_5_qnetwork_encodingnetwork_conv2d_2_kernel:@@G
9assignvariableop_6_qnetwork_encodingnetwork_conv2d_2_bias:@L
8assignvariableop_7_qnetwork_encodingnetwork_dense_kernel:
??E
6assignvariableop_8_qnetwork_encodingnetwork_dense_bias:	?=
*assignvariableop_9_qnetwork_dense_1_kernel:	?	7
)assignvariableop_10_qnetwork_dense_1_bias:	
identity_12??AssignVariableOp?AssignVariableOp_1?AssignVariableOp_10?AssignVariableOp_2?AssignVariableOp_3?AssignVariableOp_4?AssignVariableOp_5?AssignVariableOp_6?AssignVariableOp_7?AssignVariableOp_8?AssignVariableOp_9?
RestoreV2/tensor_namesConst"/device:CPU:0*
_output_shapes
:*
dtype0*?
value?B?B%train_step/.ATTRIBUTES/VARIABLE_VALUEB,model_variables/0/.ATTRIBUTES/VARIABLE_VALUEB,model_variables/1/.ATTRIBUTES/VARIABLE_VALUEB,model_variables/2/.ATTRIBUTES/VARIABLE_VALUEB,model_variables/3/.ATTRIBUTES/VARIABLE_VALUEB,model_variables/4/.ATTRIBUTES/VARIABLE_VALUEB,model_variables/5/.ATTRIBUTES/VARIABLE_VALUEB,model_variables/6/.ATTRIBUTES/VARIABLE_VALUEB,model_variables/7/.ATTRIBUTES/VARIABLE_VALUEB,model_variables/8/.ATTRIBUTES/VARIABLE_VALUEB,model_variables/9/.ATTRIBUTES/VARIABLE_VALUEB_CHECKPOINTABLE_OBJECT_GRAPH2
RestoreV2/tensor_names?
RestoreV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:*
dtype0*+
value"B B B B B B B B B B B B B 2
RestoreV2/shape_and_slices?
	RestoreV2	RestoreV2file_prefixRestoreV2/tensor_names:output:0#RestoreV2/shape_and_slices:output:0"/device:CPU:0*D
_output_shapes2
0::::::::::::*
dtypes
2	2
	RestoreV2g
IdentityIdentityRestoreV2:tensors:0"/device:CPU:0*
T0	*
_output_shapes
:2

Identity?
AssignVariableOpAssignVariableOpassignvariableop_variableIdentity:output:0"/device:CPU:0*
_output_shapes
 *
dtype0	2
AssignVariableOpk

Identity_1IdentityRestoreV2:tensors:1"/device:CPU:0*
T0*
_output_shapes
:2

Identity_1?
AssignVariableOp_1AssignVariableOp9assignvariableop_1_qnetwork_encodingnetwork_conv2d_kernelIdentity_1:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_1k

Identity_2IdentityRestoreV2:tensors:2"/device:CPU:0*
T0*
_output_shapes
:2

Identity_2?
AssignVariableOp_2AssignVariableOp7assignvariableop_2_qnetwork_encodingnetwork_conv2d_biasIdentity_2:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_2k

Identity_3IdentityRestoreV2:tensors:3"/device:CPU:0*
T0*
_output_shapes
:2

Identity_3?
AssignVariableOp_3AssignVariableOp;assignvariableop_3_qnetwork_encodingnetwork_conv2d_1_kernelIdentity_3:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_3k

Identity_4IdentityRestoreV2:tensors:4"/device:CPU:0*
T0*
_output_shapes
:2

Identity_4?
AssignVariableOp_4AssignVariableOp9assignvariableop_4_qnetwork_encodingnetwork_conv2d_1_biasIdentity_4:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_4k

Identity_5IdentityRestoreV2:tensors:5"/device:CPU:0*
T0*
_output_shapes
:2

Identity_5?
AssignVariableOp_5AssignVariableOp;assignvariableop_5_qnetwork_encodingnetwork_conv2d_2_kernelIdentity_5:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_5k

Identity_6IdentityRestoreV2:tensors:6"/device:CPU:0*
T0*
_output_shapes
:2

Identity_6?
AssignVariableOp_6AssignVariableOp9assignvariableop_6_qnetwork_encodingnetwork_conv2d_2_biasIdentity_6:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_6k

Identity_7IdentityRestoreV2:tensors:7"/device:CPU:0*
T0*
_output_shapes
:2

Identity_7?
AssignVariableOp_7AssignVariableOp8assignvariableop_7_qnetwork_encodingnetwork_dense_kernelIdentity_7:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_7k

Identity_8IdentityRestoreV2:tensors:8"/device:CPU:0*
T0*
_output_shapes
:2

Identity_8?
AssignVariableOp_8AssignVariableOp6assignvariableop_8_qnetwork_encodingnetwork_dense_biasIdentity_8:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_8k

Identity_9IdentityRestoreV2:tensors:9"/device:CPU:0*
T0*
_output_shapes
:2

Identity_9?
AssignVariableOp_9AssignVariableOp*assignvariableop_9_qnetwork_dense_1_kernelIdentity_9:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_9n
Identity_10IdentityRestoreV2:tensors:10"/device:CPU:0*
T0*
_output_shapes
:2
Identity_10?
AssignVariableOp_10AssignVariableOp)assignvariableop_10_qnetwork_dense_1_biasIdentity_10:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_109
NoOpNoOp"/device:CPU:0*
_output_shapes
 2
NoOp?
Identity_11Identityfile_prefix^AssignVariableOp^AssignVariableOp_1^AssignVariableOp_10^AssignVariableOp_2^AssignVariableOp_3^AssignVariableOp_4^AssignVariableOp_5^AssignVariableOp_6^AssignVariableOp_7^AssignVariableOp_8^AssignVariableOp_9^NoOp"/device:CPU:0*
T0*
_output_shapes
: 2
Identity_11?
Identity_12IdentityIdentity_11:output:0^AssignVariableOp^AssignVariableOp_1^AssignVariableOp_10^AssignVariableOp_2^AssignVariableOp_3^AssignVariableOp_4^AssignVariableOp_5^AssignVariableOp_6^AssignVariableOp_7^AssignVariableOp_8^AssignVariableOp_9*
T0*
_output_shapes
: 2
Identity_12"#
identity_12Identity_12:output:0*+
_input_shapes
: : : : : : : : : : : : 2$
AssignVariableOpAssignVariableOp2(
AssignVariableOp_1AssignVariableOp_12*
AssignVariableOp_10AssignVariableOp_102(
AssignVariableOp_2AssignVariableOp_22(
AssignVariableOp_3AssignVariableOp_32(
AssignVariableOp_4AssignVariableOp_42(
AssignVariableOp_5AssignVariableOp_52(
AssignVariableOp_6AssignVariableOp_62(
AssignVariableOp_7AssignVariableOp_72(
AssignVariableOp_8AssignVariableOp_82(
AssignVariableOp_9AssignVariableOp_9:C ?

_output_shapes
: 
%
_user_specified_namefile_prefix
?
?
+__inference_function_with_signature_5369473
	step_type

reward
discount
observation!
unknown: 
	unknown_0: #
	unknown_1: @
	unknown_2:@#
	unknown_3:@@
	unknown_4:@
	unknown_5:
??
	unknown_6:	?
	unknown_7:	?	
	unknown_8:	
identity	??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCall	step_typerewarddiscountobservationunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8*
Tin
2*
Tout
2	*
_collective_manager_ids
 *
_output_shapes
:*,
_read_only_resource_inputs

	
*0
config_proto 

CPU

GPU2*0J 8? *2
f-R+
)__inference_polymorphic_action_fn_53694502
StatefulPartitionedCall?
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0	*
_output_shapes
:2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*K
_input_shapes:
8::::TT: : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:G C

_output_shapes
:
%
_user_specified_name0/step_type:D@

_output_shapes
:
"
_user_specified_name
0/reward:FB

_output_shapes
:
$
_user_specified_name
0/discount:UQ
&
_output_shapes
:TT
'
_user_specified_name0/observation
?a
?
)__inference_polymorphic_action_fn_5369654
time_step_step_type
time_step_reward
time_step_discount
time_step_observationX
>qnetwork_encodingnetwork_conv2d_conv2d_readvariableop_resource: M
?qnetwork_encodingnetwork_conv2d_biasadd_readvariableop_resource: Z
@qnetwork_encodingnetwork_conv2d_1_conv2d_readvariableop_resource: @O
Aqnetwork_encodingnetwork_conv2d_1_biasadd_readvariableop_resource:@Z
@qnetwork_encodingnetwork_conv2d_2_conv2d_readvariableop_resource:@@O
Aqnetwork_encodingnetwork_conv2d_2_biasadd_readvariableop_resource:@Q
=qnetwork_encodingnetwork_dense_matmul_readvariableop_resource:
??M
>qnetwork_encodingnetwork_dense_biasadd_readvariableop_resource:	?B
/qnetwork_dense_1_matmul_readvariableop_resource:	?	>
0qnetwork_dense_1_biasadd_readvariableop_resource:	
identity	??6QNetwork/EncodingNetwork/conv2d/BiasAdd/ReadVariableOp?5QNetwork/EncodingNetwork/conv2d/Conv2D/ReadVariableOp?8QNetwork/EncodingNetwork/conv2d_1/BiasAdd/ReadVariableOp?7QNetwork/EncodingNetwork/conv2d_1/Conv2D/ReadVariableOp?8QNetwork/EncodingNetwork/conv2d_2/BiasAdd/ReadVariableOp?7QNetwork/EncodingNetwork/conv2d_2/Conv2D/ReadVariableOp?5QNetwork/EncodingNetwork/dense/BiasAdd/ReadVariableOp?4QNetwork/EncodingNetwork/dense/MatMul/ReadVariableOp?'QNetwork/dense_1/BiasAdd/ReadVariableOp?&QNetwork/dense_1/MatMul/ReadVariableOp?
$QNetwork/EncodingNetwork/lambda/CastCasttime_step_observation*

DstT0*

SrcT0*&
_output_shapes
:TT2&
$QNetwork/EncodingNetwork/lambda/Cast?
)QNetwork/EncodingNetwork/lambda/truediv/yConst*
_output_shapes
: *
dtype0*
valueB
 *  C2+
)QNetwork/EncodingNetwork/lambda/truediv/y?
'QNetwork/EncodingNetwork/lambda/truedivRealDiv(QNetwork/EncodingNetwork/lambda/Cast:y:02QNetwork/EncodingNetwork/lambda/truediv/y:output:0*
T0*&
_output_shapes
:TT2)
'QNetwork/EncodingNetwork/lambda/truediv?
5QNetwork/EncodingNetwork/conv2d/Conv2D/ReadVariableOpReadVariableOp>qnetwork_encodingnetwork_conv2d_conv2d_readvariableop_resource*&
_output_shapes
: *
dtype027
5QNetwork/EncodingNetwork/conv2d/Conv2D/ReadVariableOp?
&QNetwork/EncodingNetwork/conv2d/Conv2DConv2D+QNetwork/EncodingNetwork/lambda/truediv:z:0=QNetwork/EncodingNetwork/conv2d/Conv2D/ReadVariableOp:value:0*
T0*&
_output_shapes
: *
paddingVALID*
strides
2(
&QNetwork/EncodingNetwork/conv2d/Conv2D?
6QNetwork/EncodingNetwork/conv2d/BiasAdd/ReadVariableOpReadVariableOp?qnetwork_encodingnetwork_conv2d_biasadd_readvariableop_resource*
_output_shapes
: *
dtype028
6QNetwork/EncodingNetwork/conv2d/BiasAdd/ReadVariableOp?
'QNetwork/EncodingNetwork/conv2d/BiasAddBiasAdd/QNetwork/EncodingNetwork/conv2d/Conv2D:output:0>QNetwork/EncodingNetwork/conv2d/BiasAdd/ReadVariableOp:value:0*
T0*&
_output_shapes
: 2)
'QNetwork/EncodingNetwork/conv2d/BiasAdd?
$QNetwork/EncodingNetwork/conv2d/ReluRelu0QNetwork/EncodingNetwork/conv2d/BiasAdd:output:0*
T0*&
_output_shapes
: 2&
$QNetwork/EncodingNetwork/conv2d/Relu?
7QNetwork/EncodingNetwork/conv2d_1/Conv2D/ReadVariableOpReadVariableOp@qnetwork_encodingnetwork_conv2d_1_conv2d_readvariableop_resource*&
_output_shapes
: @*
dtype029
7QNetwork/EncodingNetwork/conv2d_1/Conv2D/ReadVariableOp?
(QNetwork/EncodingNetwork/conv2d_1/Conv2DConv2D2QNetwork/EncodingNetwork/conv2d/Relu:activations:0?QNetwork/EncodingNetwork/conv2d_1/Conv2D/ReadVariableOp:value:0*
T0*&
_output_shapes
:		@*
paddingVALID*
strides
2*
(QNetwork/EncodingNetwork/conv2d_1/Conv2D?
8QNetwork/EncodingNetwork/conv2d_1/BiasAdd/ReadVariableOpReadVariableOpAqnetwork_encodingnetwork_conv2d_1_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype02:
8QNetwork/EncodingNetwork/conv2d_1/BiasAdd/ReadVariableOp?
)QNetwork/EncodingNetwork/conv2d_1/BiasAddBiasAdd1QNetwork/EncodingNetwork/conv2d_1/Conv2D:output:0@QNetwork/EncodingNetwork/conv2d_1/BiasAdd/ReadVariableOp:value:0*
T0*&
_output_shapes
:		@2+
)QNetwork/EncodingNetwork/conv2d_1/BiasAdd?
&QNetwork/EncodingNetwork/conv2d_1/ReluRelu2QNetwork/EncodingNetwork/conv2d_1/BiasAdd:output:0*
T0*&
_output_shapes
:		@2(
&QNetwork/EncodingNetwork/conv2d_1/Relu?
7QNetwork/EncodingNetwork/conv2d_2/Conv2D/ReadVariableOpReadVariableOp@qnetwork_encodingnetwork_conv2d_2_conv2d_readvariableop_resource*&
_output_shapes
:@@*
dtype029
7QNetwork/EncodingNetwork/conv2d_2/Conv2D/ReadVariableOp?
(QNetwork/EncodingNetwork/conv2d_2/Conv2DConv2D4QNetwork/EncodingNetwork/conv2d_1/Relu:activations:0?QNetwork/EncodingNetwork/conv2d_2/Conv2D/ReadVariableOp:value:0*
T0*&
_output_shapes
:@*
paddingVALID*
strides
2*
(QNetwork/EncodingNetwork/conv2d_2/Conv2D?
8QNetwork/EncodingNetwork/conv2d_2/BiasAdd/ReadVariableOpReadVariableOpAqnetwork_encodingnetwork_conv2d_2_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype02:
8QNetwork/EncodingNetwork/conv2d_2/BiasAdd/ReadVariableOp?
)QNetwork/EncodingNetwork/conv2d_2/BiasAddBiasAdd1QNetwork/EncodingNetwork/conv2d_2/Conv2D:output:0@QNetwork/EncodingNetwork/conv2d_2/BiasAdd/ReadVariableOp:value:0*
T0*&
_output_shapes
:@2+
)QNetwork/EncodingNetwork/conv2d_2/BiasAdd?
&QNetwork/EncodingNetwork/conv2d_2/ReluRelu2QNetwork/EncodingNetwork/conv2d_2/BiasAdd:output:0*
T0*&
_output_shapes
:@2(
&QNetwork/EncodingNetwork/conv2d_2/Relu?
&QNetwork/EncodingNetwork/flatten/ConstConst*
_output_shapes
:*
dtype0*
valueB"????@  2(
&QNetwork/EncodingNetwork/flatten/Const?
(QNetwork/EncodingNetwork/flatten/ReshapeReshape4QNetwork/EncodingNetwork/conv2d_2/Relu:activations:0/QNetwork/EncodingNetwork/flatten/Const:output:0*
T0*
_output_shapes
:	?2*
(QNetwork/EncodingNetwork/flatten/Reshape?
4QNetwork/EncodingNetwork/dense/MatMul/ReadVariableOpReadVariableOp=qnetwork_encodingnetwork_dense_matmul_readvariableop_resource* 
_output_shapes
:
??*
dtype026
4QNetwork/EncodingNetwork/dense/MatMul/ReadVariableOp?
%QNetwork/EncodingNetwork/dense/MatMulMatMul1QNetwork/EncodingNetwork/flatten/Reshape:output:0<QNetwork/EncodingNetwork/dense/MatMul/ReadVariableOp:value:0*
T0*
_output_shapes
:	?2'
%QNetwork/EncodingNetwork/dense/MatMul?
5QNetwork/EncodingNetwork/dense/BiasAdd/ReadVariableOpReadVariableOp>qnetwork_encodingnetwork_dense_biasadd_readvariableop_resource*
_output_shapes	
:?*
dtype027
5QNetwork/EncodingNetwork/dense/BiasAdd/ReadVariableOp?
&QNetwork/EncodingNetwork/dense/BiasAddBiasAdd/QNetwork/EncodingNetwork/dense/MatMul:product:0=QNetwork/EncodingNetwork/dense/BiasAdd/ReadVariableOp:value:0*
T0*
_output_shapes
:	?2(
&QNetwork/EncodingNetwork/dense/BiasAdd?
#QNetwork/EncodingNetwork/dense/ReluRelu/QNetwork/EncodingNetwork/dense/BiasAdd:output:0*
T0*
_output_shapes
:	?2%
#QNetwork/EncodingNetwork/dense/Relu?
&QNetwork/dense_1/MatMul/ReadVariableOpReadVariableOp/qnetwork_dense_1_matmul_readvariableop_resource*
_output_shapes
:	?	*
dtype02(
&QNetwork/dense_1/MatMul/ReadVariableOp?
QNetwork/dense_1/MatMulMatMul1QNetwork/EncodingNetwork/dense/Relu:activations:0.QNetwork/dense_1/MatMul/ReadVariableOp:value:0*
T0*
_output_shapes

:	2
QNetwork/dense_1/MatMul?
'QNetwork/dense_1/BiasAdd/ReadVariableOpReadVariableOp0qnetwork_dense_1_biasadd_readvariableop_resource*
_output_shapes
:	*
dtype02)
'QNetwork/dense_1/BiasAdd/ReadVariableOp?
QNetwork/dense_1/BiasAddBiasAdd!QNetwork/dense_1/MatMul:product:0/QNetwork/dense_1/BiasAdd/ReadVariableOp:value:0*
T0*
_output_shapes

:	2
QNetwork/dense_1/BiasAdd?
#Categorical_1/mode/ArgMax/dimensionConst*
_output_shapes
: *
dtype0*
valueB :
?????????2%
#Categorical_1/mode/ArgMax/dimension?
Categorical_1/mode/ArgMaxArgMax!QNetwork/dense_1/BiasAdd:output:0,Categorical_1/mode/ArgMax/dimension:output:0*
T0*
_output_shapes
:2
Categorical_1/mode/ArgMaxj
Deterministic/atolConst*
_output_shapes
: *
dtype0	*
value	B	 R 2
Deterministic/atolj
Deterministic/rtolConst*
_output_shapes
: *
dtype0	*
value	B	 R 2
Deterministic/rtol?
#Deterministic_1/sample/sample_shapeConst*
_output_shapes
: *
dtype0*
valueB 2%
#Deterministic_1/sample/sample_shape
Deterministic_1/sample/ConstConst*
_output_shapes
: *
dtype0*
valueB 2
Deterministic_1/sample/Const?
(Deterministic_1/sample/BroadcastTo/shapeConst*
_output_shapes
:*
dtype0*
valueB"      2*
(Deterministic_1/sample/BroadcastTo/shape?
"Deterministic_1/sample/BroadcastToBroadcastTo"Categorical_1/mode/ArgMax:output:01Deterministic_1/sample/BroadcastTo/shape:output:0*
T0	*
_output_shapes

:2$
"Deterministic_1/sample/BroadcastTo?
$Deterministic_1/sample/Reshape/shapeConst*
_output_shapes
:*
dtype0*
valueB:2&
$Deterministic_1/sample/Reshape/shape?
Deterministic_1/sample/ReshapeReshape+Deterministic_1/sample/BroadcastTo:output:0-Deterministic_1/sample/Reshape/shape:output:0*
T0	*
_output_shapes
:2 
Deterministic_1/sample/Reshapet
clip_by_value/Minimum/yConst*
_output_shapes
: *
dtype0	*
value	B	 R2
clip_by_value/Minimum/y?
clip_by_value/MinimumMinimum'Deterministic_1/sample/Reshape:output:0 clip_by_value/Minimum/y:output:0*
T0	*
_output_shapes
:2
clip_by_value/Minimumd
clip_by_value/yConst*
_output_shapes
: *
dtype0	*
value	B	 R 2
clip_by_value/y?
clip_by_valueMaximumclip_by_value/Minimum:z:0clip_by_value/y:output:0*
T0	*
_output_shapes
:2
clip_by_value?
IdentityIdentityclip_by_value:z:07^QNetwork/EncodingNetwork/conv2d/BiasAdd/ReadVariableOp6^QNetwork/EncodingNetwork/conv2d/Conv2D/ReadVariableOp9^QNetwork/EncodingNetwork/conv2d_1/BiasAdd/ReadVariableOp8^QNetwork/EncodingNetwork/conv2d_1/Conv2D/ReadVariableOp9^QNetwork/EncodingNetwork/conv2d_2/BiasAdd/ReadVariableOp8^QNetwork/EncodingNetwork/conv2d_2/Conv2D/ReadVariableOp6^QNetwork/EncodingNetwork/dense/BiasAdd/ReadVariableOp5^QNetwork/EncodingNetwork/dense/MatMul/ReadVariableOp(^QNetwork/dense_1/BiasAdd/ReadVariableOp'^QNetwork/dense_1/MatMul/ReadVariableOp*
T0	*
_output_shapes
:2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*K
_input_shapes:
8::::TT: : : : : : : : : : 2p
6QNetwork/EncodingNetwork/conv2d/BiasAdd/ReadVariableOp6QNetwork/EncodingNetwork/conv2d/BiasAdd/ReadVariableOp2n
5QNetwork/EncodingNetwork/conv2d/Conv2D/ReadVariableOp5QNetwork/EncodingNetwork/conv2d/Conv2D/ReadVariableOp2t
8QNetwork/EncodingNetwork/conv2d_1/BiasAdd/ReadVariableOp8QNetwork/EncodingNetwork/conv2d_1/BiasAdd/ReadVariableOp2r
7QNetwork/EncodingNetwork/conv2d_1/Conv2D/ReadVariableOp7QNetwork/EncodingNetwork/conv2d_1/Conv2D/ReadVariableOp2t
8QNetwork/EncodingNetwork/conv2d_2/BiasAdd/ReadVariableOp8QNetwork/EncodingNetwork/conv2d_2/BiasAdd/ReadVariableOp2r
7QNetwork/EncodingNetwork/conv2d_2/Conv2D/ReadVariableOp7QNetwork/EncodingNetwork/conv2d_2/Conv2D/ReadVariableOp2n
5QNetwork/EncodingNetwork/dense/BiasAdd/ReadVariableOp5QNetwork/EncodingNetwork/dense/BiasAdd/ReadVariableOp2l
4QNetwork/EncodingNetwork/dense/MatMul/ReadVariableOp4QNetwork/EncodingNetwork/dense/MatMul/ReadVariableOp2R
'QNetwork/dense_1/BiasAdd/ReadVariableOp'QNetwork/dense_1/BiasAdd/ReadVariableOp2P
&QNetwork/dense_1/MatMul/ReadVariableOp&QNetwork/dense_1/MatMul/ReadVariableOp:O K

_output_shapes
:
-
_user_specified_nametime_step/step_type:LH

_output_shapes
:
*
_user_specified_nametime_step/reward:NJ

_output_shapes
:
,
_user_specified_nametime_step/discount:]Y
&
_output_shapes
:TT
/
_user_specified_nametime_step/observation
?
'
%__inference_signature_wrapper_8225940?
PartitionedCallPartitionedCall*	
Tin
 *

Tout
 *
_collective_manager_ids
 *
_output_shapes
 * 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8? *4
f/R-
+__inference_function_with_signature_53695302
PartitionedCall*(
_construction_contextkEagerRuntime*
_input_shapes 
?`
?
)__inference_polymorphic_action_fn_5369450
	time_step
time_step_1
time_step_2
time_step_3X
>qnetwork_encodingnetwork_conv2d_conv2d_readvariableop_resource: M
?qnetwork_encodingnetwork_conv2d_biasadd_readvariableop_resource: Z
@qnetwork_encodingnetwork_conv2d_1_conv2d_readvariableop_resource: @O
Aqnetwork_encodingnetwork_conv2d_1_biasadd_readvariableop_resource:@Z
@qnetwork_encodingnetwork_conv2d_2_conv2d_readvariableop_resource:@@O
Aqnetwork_encodingnetwork_conv2d_2_biasadd_readvariableop_resource:@Q
=qnetwork_encodingnetwork_dense_matmul_readvariableop_resource:
??M
>qnetwork_encodingnetwork_dense_biasadd_readvariableop_resource:	?B
/qnetwork_dense_1_matmul_readvariableop_resource:	?	>
0qnetwork_dense_1_biasadd_readvariableop_resource:	
identity	??6QNetwork/EncodingNetwork/conv2d/BiasAdd/ReadVariableOp?5QNetwork/EncodingNetwork/conv2d/Conv2D/ReadVariableOp?8QNetwork/EncodingNetwork/conv2d_1/BiasAdd/ReadVariableOp?7QNetwork/EncodingNetwork/conv2d_1/Conv2D/ReadVariableOp?8QNetwork/EncodingNetwork/conv2d_2/BiasAdd/ReadVariableOp?7QNetwork/EncodingNetwork/conv2d_2/Conv2D/ReadVariableOp?5QNetwork/EncodingNetwork/dense/BiasAdd/ReadVariableOp?4QNetwork/EncodingNetwork/dense/MatMul/ReadVariableOp?'QNetwork/dense_1/BiasAdd/ReadVariableOp?&QNetwork/dense_1/MatMul/ReadVariableOp?
$QNetwork/EncodingNetwork/lambda/CastCasttime_step_3*

DstT0*

SrcT0*&
_output_shapes
:TT2&
$QNetwork/EncodingNetwork/lambda/Cast?
)QNetwork/EncodingNetwork/lambda/truediv/yConst*
_output_shapes
: *
dtype0*
valueB
 *  C2+
)QNetwork/EncodingNetwork/lambda/truediv/y?
'QNetwork/EncodingNetwork/lambda/truedivRealDiv(QNetwork/EncodingNetwork/lambda/Cast:y:02QNetwork/EncodingNetwork/lambda/truediv/y:output:0*
T0*&
_output_shapes
:TT2)
'QNetwork/EncodingNetwork/lambda/truediv?
5QNetwork/EncodingNetwork/conv2d/Conv2D/ReadVariableOpReadVariableOp>qnetwork_encodingnetwork_conv2d_conv2d_readvariableop_resource*&
_output_shapes
: *
dtype027
5QNetwork/EncodingNetwork/conv2d/Conv2D/ReadVariableOp?
&QNetwork/EncodingNetwork/conv2d/Conv2DConv2D+QNetwork/EncodingNetwork/lambda/truediv:z:0=QNetwork/EncodingNetwork/conv2d/Conv2D/ReadVariableOp:value:0*
T0*&
_output_shapes
: *
paddingVALID*
strides
2(
&QNetwork/EncodingNetwork/conv2d/Conv2D?
6QNetwork/EncodingNetwork/conv2d/BiasAdd/ReadVariableOpReadVariableOp?qnetwork_encodingnetwork_conv2d_biasadd_readvariableop_resource*
_output_shapes
: *
dtype028
6QNetwork/EncodingNetwork/conv2d/BiasAdd/ReadVariableOp?
'QNetwork/EncodingNetwork/conv2d/BiasAddBiasAdd/QNetwork/EncodingNetwork/conv2d/Conv2D:output:0>QNetwork/EncodingNetwork/conv2d/BiasAdd/ReadVariableOp:value:0*
T0*&
_output_shapes
: 2)
'QNetwork/EncodingNetwork/conv2d/BiasAdd?
$QNetwork/EncodingNetwork/conv2d/ReluRelu0QNetwork/EncodingNetwork/conv2d/BiasAdd:output:0*
T0*&
_output_shapes
: 2&
$QNetwork/EncodingNetwork/conv2d/Relu?
7QNetwork/EncodingNetwork/conv2d_1/Conv2D/ReadVariableOpReadVariableOp@qnetwork_encodingnetwork_conv2d_1_conv2d_readvariableop_resource*&
_output_shapes
: @*
dtype029
7QNetwork/EncodingNetwork/conv2d_1/Conv2D/ReadVariableOp?
(QNetwork/EncodingNetwork/conv2d_1/Conv2DConv2D2QNetwork/EncodingNetwork/conv2d/Relu:activations:0?QNetwork/EncodingNetwork/conv2d_1/Conv2D/ReadVariableOp:value:0*
T0*&
_output_shapes
:		@*
paddingVALID*
strides
2*
(QNetwork/EncodingNetwork/conv2d_1/Conv2D?
8QNetwork/EncodingNetwork/conv2d_1/BiasAdd/ReadVariableOpReadVariableOpAqnetwork_encodingnetwork_conv2d_1_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype02:
8QNetwork/EncodingNetwork/conv2d_1/BiasAdd/ReadVariableOp?
)QNetwork/EncodingNetwork/conv2d_1/BiasAddBiasAdd1QNetwork/EncodingNetwork/conv2d_1/Conv2D:output:0@QNetwork/EncodingNetwork/conv2d_1/BiasAdd/ReadVariableOp:value:0*
T0*&
_output_shapes
:		@2+
)QNetwork/EncodingNetwork/conv2d_1/BiasAdd?
&QNetwork/EncodingNetwork/conv2d_1/ReluRelu2QNetwork/EncodingNetwork/conv2d_1/BiasAdd:output:0*
T0*&
_output_shapes
:		@2(
&QNetwork/EncodingNetwork/conv2d_1/Relu?
7QNetwork/EncodingNetwork/conv2d_2/Conv2D/ReadVariableOpReadVariableOp@qnetwork_encodingnetwork_conv2d_2_conv2d_readvariableop_resource*&
_output_shapes
:@@*
dtype029
7QNetwork/EncodingNetwork/conv2d_2/Conv2D/ReadVariableOp?
(QNetwork/EncodingNetwork/conv2d_2/Conv2DConv2D4QNetwork/EncodingNetwork/conv2d_1/Relu:activations:0?QNetwork/EncodingNetwork/conv2d_2/Conv2D/ReadVariableOp:value:0*
T0*&
_output_shapes
:@*
paddingVALID*
strides
2*
(QNetwork/EncodingNetwork/conv2d_2/Conv2D?
8QNetwork/EncodingNetwork/conv2d_2/BiasAdd/ReadVariableOpReadVariableOpAqnetwork_encodingnetwork_conv2d_2_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype02:
8QNetwork/EncodingNetwork/conv2d_2/BiasAdd/ReadVariableOp?
)QNetwork/EncodingNetwork/conv2d_2/BiasAddBiasAdd1QNetwork/EncodingNetwork/conv2d_2/Conv2D:output:0@QNetwork/EncodingNetwork/conv2d_2/BiasAdd/ReadVariableOp:value:0*
T0*&
_output_shapes
:@2+
)QNetwork/EncodingNetwork/conv2d_2/BiasAdd?
&QNetwork/EncodingNetwork/conv2d_2/ReluRelu2QNetwork/EncodingNetwork/conv2d_2/BiasAdd:output:0*
T0*&
_output_shapes
:@2(
&QNetwork/EncodingNetwork/conv2d_2/Relu?
&QNetwork/EncodingNetwork/flatten/ConstConst*
_output_shapes
:*
dtype0*
valueB"????@  2(
&QNetwork/EncodingNetwork/flatten/Const?
(QNetwork/EncodingNetwork/flatten/ReshapeReshape4QNetwork/EncodingNetwork/conv2d_2/Relu:activations:0/QNetwork/EncodingNetwork/flatten/Const:output:0*
T0*
_output_shapes
:	?2*
(QNetwork/EncodingNetwork/flatten/Reshape?
4QNetwork/EncodingNetwork/dense/MatMul/ReadVariableOpReadVariableOp=qnetwork_encodingnetwork_dense_matmul_readvariableop_resource* 
_output_shapes
:
??*
dtype026
4QNetwork/EncodingNetwork/dense/MatMul/ReadVariableOp?
%QNetwork/EncodingNetwork/dense/MatMulMatMul1QNetwork/EncodingNetwork/flatten/Reshape:output:0<QNetwork/EncodingNetwork/dense/MatMul/ReadVariableOp:value:0*
T0*
_output_shapes
:	?2'
%QNetwork/EncodingNetwork/dense/MatMul?
5QNetwork/EncodingNetwork/dense/BiasAdd/ReadVariableOpReadVariableOp>qnetwork_encodingnetwork_dense_biasadd_readvariableop_resource*
_output_shapes	
:?*
dtype027
5QNetwork/EncodingNetwork/dense/BiasAdd/ReadVariableOp?
&QNetwork/EncodingNetwork/dense/BiasAddBiasAdd/QNetwork/EncodingNetwork/dense/MatMul:product:0=QNetwork/EncodingNetwork/dense/BiasAdd/ReadVariableOp:value:0*
T0*
_output_shapes
:	?2(
&QNetwork/EncodingNetwork/dense/BiasAdd?
#QNetwork/EncodingNetwork/dense/ReluRelu/QNetwork/EncodingNetwork/dense/BiasAdd:output:0*
T0*
_output_shapes
:	?2%
#QNetwork/EncodingNetwork/dense/Relu?
&QNetwork/dense_1/MatMul/ReadVariableOpReadVariableOp/qnetwork_dense_1_matmul_readvariableop_resource*
_output_shapes
:	?	*
dtype02(
&QNetwork/dense_1/MatMul/ReadVariableOp?
QNetwork/dense_1/MatMulMatMul1QNetwork/EncodingNetwork/dense/Relu:activations:0.QNetwork/dense_1/MatMul/ReadVariableOp:value:0*
T0*
_output_shapes

:	2
QNetwork/dense_1/MatMul?
'QNetwork/dense_1/BiasAdd/ReadVariableOpReadVariableOp0qnetwork_dense_1_biasadd_readvariableop_resource*
_output_shapes
:	*
dtype02)
'QNetwork/dense_1/BiasAdd/ReadVariableOp?
QNetwork/dense_1/BiasAddBiasAdd!QNetwork/dense_1/MatMul:product:0/QNetwork/dense_1/BiasAdd/ReadVariableOp:value:0*
T0*
_output_shapes

:	2
QNetwork/dense_1/BiasAdd?
#Categorical_1/mode/ArgMax/dimensionConst*
_output_shapes
: *
dtype0*
valueB :
?????????2%
#Categorical_1/mode/ArgMax/dimension?
Categorical_1/mode/ArgMaxArgMax!QNetwork/dense_1/BiasAdd:output:0,Categorical_1/mode/ArgMax/dimension:output:0*
T0*
_output_shapes
:2
Categorical_1/mode/ArgMaxj
Deterministic/atolConst*
_output_shapes
: *
dtype0	*
value	B	 R 2
Deterministic/atolj
Deterministic/rtolConst*
_output_shapes
: *
dtype0	*
value	B	 R 2
Deterministic/rtol?
#Deterministic_1/sample/sample_shapeConst*
_output_shapes
: *
dtype0*
valueB 2%
#Deterministic_1/sample/sample_shape
Deterministic_1/sample/ConstConst*
_output_shapes
: *
dtype0*
valueB 2
Deterministic_1/sample/Const?
(Deterministic_1/sample/BroadcastTo/shapeConst*
_output_shapes
:*
dtype0*
valueB"      2*
(Deterministic_1/sample/BroadcastTo/shape?
"Deterministic_1/sample/BroadcastToBroadcastTo"Categorical_1/mode/ArgMax:output:01Deterministic_1/sample/BroadcastTo/shape:output:0*
T0	*
_output_shapes

:2$
"Deterministic_1/sample/BroadcastTo?
$Deterministic_1/sample/Reshape/shapeConst*
_output_shapes
:*
dtype0*
valueB:2&
$Deterministic_1/sample/Reshape/shape?
Deterministic_1/sample/ReshapeReshape+Deterministic_1/sample/BroadcastTo:output:0-Deterministic_1/sample/Reshape/shape:output:0*
T0	*
_output_shapes
:2 
Deterministic_1/sample/Reshapet
clip_by_value/Minimum/yConst*
_output_shapes
: *
dtype0	*
value	B	 R2
clip_by_value/Minimum/y?
clip_by_value/MinimumMinimum'Deterministic_1/sample/Reshape:output:0 clip_by_value/Minimum/y:output:0*
T0	*
_output_shapes
:2
clip_by_value/Minimumd
clip_by_value/yConst*
_output_shapes
: *
dtype0	*
value	B	 R 2
clip_by_value/y?
clip_by_valueMaximumclip_by_value/Minimum:z:0clip_by_value/y:output:0*
T0	*
_output_shapes
:2
clip_by_value?
IdentityIdentityclip_by_value:z:07^QNetwork/EncodingNetwork/conv2d/BiasAdd/ReadVariableOp6^QNetwork/EncodingNetwork/conv2d/Conv2D/ReadVariableOp9^QNetwork/EncodingNetwork/conv2d_1/BiasAdd/ReadVariableOp8^QNetwork/EncodingNetwork/conv2d_1/Conv2D/ReadVariableOp9^QNetwork/EncodingNetwork/conv2d_2/BiasAdd/ReadVariableOp8^QNetwork/EncodingNetwork/conv2d_2/Conv2D/ReadVariableOp6^QNetwork/EncodingNetwork/dense/BiasAdd/ReadVariableOp5^QNetwork/EncodingNetwork/dense/MatMul/ReadVariableOp(^QNetwork/dense_1/BiasAdd/ReadVariableOp'^QNetwork/dense_1/MatMul/ReadVariableOp*
T0	*
_output_shapes
:2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*K
_input_shapes:
8::::TT: : : : : : : : : : 2p
6QNetwork/EncodingNetwork/conv2d/BiasAdd/ReadVariableOp6QNetwork/EncodingNetwork/conv2d/BiasAdd/ReadVariableOp2n
5QNetwork/EncodingNetwork/conv2d/Conv2D/ReadVariableOp5QNetwork/EncodingNetwork/conv2d/Conv2D/ReadVariableOp2t
8QNetwork/EncodingNetwork/conv2d_1/BiasAdd/ReadVariableOp8QNetwork/EncodingNetwork/conv2d_1/BiasAdd/ReadVariableOp2r
7QNetwork/EncodingNetwork/conv2d_1/Conv2D/ReadVariableOp7QNetwork/EncodingNetwork/conv2d_1/Conv2D/ReadVariableOp2t
8QNetwork/EncodingNetwork/conv2d_2/BiasAdd/ReadVariableOp8QNetwork/EncodingNetwork/conv2d_2/BiasAdd/ReadVariableOp2r
7QNetwork/EncodingNetwork/conv2d_2/Conv2D/ReadVariableOp7QNetwork/EncodingNetwork/conv2d_2/Conv2D/ReadVariableOp2n
5QNetwork/EncodingNetwork/dense/BiasAdd/ReadVariableOp5QNetwork/EncodingNetwork/dense/BiasAdd/ReadVariableOp2l
4QNetwork/EncodingNetwork/dense/MatMul/ReadVariableOp4QNetwork/EncodingNetwork/dense/MatMul/ReadVariableOp2R
'QNetwork/dense_1/BiasAdd/ReadVariableOp'QNetwork/dense_1/BiasAdd/ReadVariableOp2P
&QNetwork/dense_1/MatMul/ReadVariableOp&QNetwork/dense_1/MatMul/ReadVariableOp:E A

_output_shapes
:
#
_user_specified_name	time_step:EA

_output_shapes
:
#
_user_specified_name	time_step:EA

_output_shapes
:
#
_user_specified_name	time_step:QM
&
_output_shapes
:TT
#
_user_specified_name	time_step
?%
?
 __inference__traced_save_8226000
file_prefix'
#savev2_variable_read_readvariableop	E
Asavev2_qnetwork_encodingnetwork_conv2d_kernel_read_readvariableopC
?savev2_qnetwork_encodingnetwork_conv2d_bias_read_readvariableopG
Csavev2_qnetwork_encodingnetwork_conv2d_1_kernel_read_readvariableopE
Asavev2_qnetwork_encodingnetwork_conv2d_1_bias_read_readvariableopG
Csavev2_qnetwork_encodingnetwork_conv2d_2_kernel_read_readvariableopE
Asavev2_qnetwork_encodingnetwork_conv2d_2_bias_read_readvariableopD
@savev2_qnetwork_encodingnetwork_dense_kernel_read_readvariableopB
>savev2_qnetwork_encodingnetwork_dense_bias_read_readvariableop6
2savev2_qnetwork_dense_1_kernel_read_readvariableop4
0savev2_qnetwork_dense_1_bias_read_readvariableop
savev2_const

identity_1??MergeV2Checkpoints?
StaticRegexFullMatchStaticRegexFullMatchfile_prefix"/device:CPU:**
_output_shapes
: *
pattern
^s3://.*2
StaticRegexFullMatchc
ConstConst"/device:CPU:**
_output_shapes
: *
dtype0*
valueB B.part2
Constl
Const_1Const"/device:CPU:**
_output_shapes
: *
dtype0*
valueB B
_temp/part2	
Const_1?
SelectSelectStaticRegexFullMatch:output:0Const:output:0Const_1:output:0"/device:CPU:**
T0*
_output_shapes
: 2
Selectt

StringJoin
StringJoinfile_prefixSelect:output:0"/device:CPU:**
N*
_output_shapes
: 2

StringJoinZ

num_shardsConst*
_output_shapes
: *
dtype0*
value	B :2

num_shards
ShardedFilename/shardConst"/device:CPU:0*
_output_shapes
: *
dtype0*
value	B : 2
ShardedFilename/shard?
ShardedFilenameShardedFilenameStringJoin:output:0ShardedFilename/shard:output:0num_shards:output:0"/device:CPU:0*
_output_shapes
: 2
ShardedFilename?
SaveV2/tensor_namesConst"/device:CPU:0*
_output_shapes
:*
dtype0*?
value?B?B%train_step/.ATTRIBUTES/VARIABLE_VALUEB,model_variables/0/.ATTRIBUTES/VARIABLE_VALUEB,model_variables/1/.ATTRIBUTES/VARIABLE_VALUEB,model_variables/2/.ATTRIBUTES/VARIABLE_VALUEB,model_variables/3/.ATTRIBUTES/VARIABLE_VALUEB,model_variables/4/.ATTRIBUTES/VARIABLE_VALUEB,model_variables/5/.ATTRIBUTES/VARIABLE_VALUEB,model_variables/6/.ATTRIBUTES/VARIABLE_VALUEB,model_variables/7/.ATTRIBUTES/VARIABLE_VALUEB,model_variables/8/.ATTRIBUTES/VARIABLE_VALUEB,model_variables/9/.ATTRIBUTES/VARIABLE_VALUEB_CHECKPOINTABLE_OBJECT_GRAPH2
SaveV2/tensor_names?
SaveV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:*
dtype0*+
value"B B B B B B B B B B B B B 2
SaveV2/shape_and_slices?
SaveV2SaveV2ShardedFilename:filename:0SaveV2/tensor_names:output:0 SaveV2/shape_and_slices:output:0#savev2_variable_read_readvariableopAsavev2_qnetwork_encodingnetwork_conv2d_kernel_read_readvariableop?savev2_qnetwork_encodingnetwork_conv2d_bias_read_readvariableopCsavev2_qnetwork_encodingnetwork_conv2d_1_kernel_read_readvariableopAsavev2_qnetwork_encodingnetwork_conv2d_1_bias_read_readvariableopCsavev2_qnetwork_encodingnetwork_conv2d_2_kernel_read_readvariableopAsavev2_qnetwork_encodingnetwork_conv2d_2_bias_read_readvariableop@savev2_qnetwork_encodingnetwork_dense_kernel_read_readvariableop>savev2_qnetwork_encodingnetwork_dense_bias_read_readvariableop2savev2_qnetwork_dense_1_kernel_read_readvariableop0savev2_qnetwork_dense_1_bias_read_readvariableopsavev2_const"/device:CPU:0*
_output_shapes
 *
dtypes
2	2
SaveV2?
&MergeV2Checkpoints/checkpoint_prefixesPackShardedFilename:filename:0^SaveV2"/device:CPU:0*
N*
T0*
_output_shapes
:2(
&MergeV2Checkpoints/checkpoint_prefixes?
MergeV2CheckpointsMergeV2Checkpoints/MergeV2Checkpoints/checkpoint_prefixes:output:0file_prefix"/device:CPU:0*
_output_shapes
 2
MergeV2Checkpointsr
IdentityIdentityfile_prefix^MergeV2Checkpoints"/device:CPU:0*
T0*
_output_shapes
: 2

Identitym

Identity_1IdentityIdentity:output:0^MergeV2Checkpoints*
T0*
_output_shapes
: 2

Identity_1"!

identity_1Identity_1:output:0*?
_input_shapest
r: : : : : @:@:@@:@:
??:?:	?	:	: 2(
MergeV2CheckpointsMergeV2Checkpoints:C ?

_output_shapes
: 
%
_user_specified_namefile_prefix:

_output_shapes
: :,(
&
_output_shapes
: : 

_output_shapes
: :,(
&
_output_shapes
: @: 

_output_shapes
:@:,(
&
_output_shapes
:@@: 

_output_shapes
:@:&"
 
_output_shapes
:
??:!	

_output_shapes	
:?:%
!

_output_shapes
:	?	: 

_output_shapes
:	:

_output_shapes
: "?L
saver_filename:0StatefulPartitionedCall_2:0StatefulPartitionedCall_38"
saved_model_main_op

NoOp*>
__saved_model_init_op%#
__saved_model_init_op

NoOp*?
action?
+

0/discount
action_0/discount:0
=
0/observation,
action_0/observation:0TT
'
0/reward
action_0/reward:0
-
0/step_type
action_0/step_type:0-
action#
StatefulPartitionedCall:0	tensorflow/serving/predict*1
get_initial_statetensorflow/serving/predict*,
get_metadatatensorflow/serving/predict*Z
get_train_stepH*
int64!
StatefulPartitionedCall_1:0	 tensorflow/serving/predict:??
?

train_step
metadata
model_variables
_all_assets

signatures

naction
odistribution
pget_initial_state
qget_metadata
rget_train_step"
_generic_user_object
:	 (2Variable
 "
trackable_dict_wrapper
g
0
1
2
	3

4
5
6
7
8
9"
trackable_tuple_wrapper
'
0"
trackable_list_wrapper
`

saction
tget_initial_state
uget_train_step
vget_metadata"
signature_map
@:> 2&QNetwork/EncodingNetwork/conv2d/kernel
2:0 2$QNetwork/EncodingNetwork/conv2d/bias
B:@ @2(QNetwork/EncodingNetwork/conv2d_1/kernel
4:2@2&QNetwork/EncodingNetwork/conv2d_1/bias
B:@@@2(QNetwork/EncodingNetwork/conv2d_2/kernel
4:2@2&QNetwork/EncodingNetwork/conv2d_2/bias
9:7
??2%QNetwork/EncodingNetwork/dense/kernel
2:0?2#QNetwork/EncodingNetwork/dense/bias
*:(	?	2QNetwork/dense_1/kernel
#:!	2QNetwork/dense_1/bias
1
ref
1"
trackable_tuple_wrapper
.

_q_network"
_generic_user_object
?
_encoder
_q_value_layer
	variables
trainable_variables
regularization_losses
	keras_api
*w&call_and_return_all_conditional_losses
x__call__"?
_tf_keras_layer?{"name": "QNetwork", "trainable": true, "expects_training_arg": true, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "class_name": "QNetwork", "config": {"layer was saved without config": true}}
?
_flat_preprocessing_layers
_postprocessing_layers
	variables
trainable_variables
regularization_losses
	keras_api
*y&call_and_return_all_conditional_losses
z__call__"?
_tf_keras_layer?{"name": "EncodingNetwork", "trainable": true, "expects_training_arg": true, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "class_name": "EncodingNetwork", "config": {"layer was saved without config": true}}
?

kernel
bias
	variables
 trainable_variables
!regularization_losses
"	keras_api
*{&call_and_return_all_conditional_losses
|__call__"?
_tf_keras_layer?{"name": "dense_1", "trainable": true, "expects_training_arg": false, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "class_name": "Dense", "config": {"name": "dense_1", "trainable": true, "dtype": "float32", "units": 9, "activation": "linear", "use_bias": true, "kernel_initializer": {"class_name": "RandomUniform", "config": {"minval": -0.03, "maxval": 0.03, "seed": null}}, "bias_initializer": {"class_name": "Constant", "config": {"value": -0.2}}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}, "input_spec": {"class_name": "InputSpec", "config": {"dtype": null, "shape": null, "ndim": null, "max_ndim": null, "min_ndim": 2, "axes": {"-1": 512}}}, "build_input_shape": {"class_name": "TensorShape", "items": [1, 512]}}
f
0
1
2
	3

4
5
6
7
8
9"
trackable_list_wrapper
f
0
1
2
	3

4
5
6
7
8
9"
trackable_list_wrapper
 "
trackable_list_wrapper
?
	variables
#layer_metrics
$metrics

%layers
&non_trainable_variables
'layer_regularization_losses
trainable_variables
regularization_losses
x__call__
*w&call_and_return_all_conditional_losses
&w"call_and_return_conditional_losses"
_generic_user_object
'
(0"
trackable_list_wrapper
C
)0
*1
+2
,3
-4"
trackable_list_wrapper
X
0
1
2
	3

4
5
6
7"
trackable_list_wrapper
X
0
1
2
	3

4
5
6
7"
trackable_list_wrapper
 "
trackable_list_wrapper
?
	variables
.layer_metrics
/metrics

0layers
1non_trainable_variables
2layer_regularization_losses
trainable_variables
regularization_losses
z__call__
*y&call_and_return_all_conditional_losses
&y"call_and_return_conditional_losses"
_generic_user_object
.
0
1"
trackable_list_wrapper
.
0
1"
trackable_list_wrapper
 "
trackable_list_wrapper
?
	variables
3layer_metrics
4metrics

5layers
6non_trainable_variables
7layer_regularization_losses
 trainable_variables
!regularization_losses
|__call__
*{&call_and_return_all_conditional_losses
&{"call_and_return_conditional_losses"
_generic_user_object
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
.
0
1"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
?
8	variables
9trainable_variables
:regularization_losses
;	keras_api
*}&call_and_return_all_conditional_losses
~__call__"?
_tf_keras_layer?{"name": "lambda", "trainable": true, "expects_training_arg": true, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "class_name": "Lambda", "config": {"name": "lambda", "trainable": true, "dtype": "float32", "function": {"class_name": "__tuple__", "items": ["4wEAAAAAAAAAAQAAAAQAAABDAAAAcxIAAAB0AKABfAB0AmoDoQJkARsAUwApAk7nAAAAAADgb0Ap\nBNoCdGbaBGNhc3TaAm5w2gdmbG9hdDMyKQHaA29ic6kAcgcAAAD6HjxpcHl0aG9uLWlucHV0LTgt\nZDQ3ZTA0Yzc5NmEwPtoIPGxhbWJkYT4BAAAA8wAAAAA=\n", null, null]}, "function_type": "lambda", "module": "__main__", "output_shape": null, "output_shape_type": "raw", "output_shape_module": null, "arguments": {}}}
?


kernel
bias
<	variables
=trainable_variables
>regularization_losses
?	keras_api
*&call_and_return_all_conditional_losses
?__call__"?	
_tf_keras_layer?	{"name": "conv2d", "trainable": true, "expects_training_arg": false, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "class_name": "Conv2D", "config": {"name": "conv2d", "trainable": true, "dtype": "float32", "filters": 32, "kernel_size": {"class_name": "__tuple__", "items": [8, 8]}, "strides": {"class_name": "__tuple__", "items": [4, 4]}, "padding": "valid", "data_format": "channels_last", "dilation_rate": {"class_name": "__tuple__", "items": [1, 1]}, "groups": 1, "activation": "relu", "use_bias": true, "kernel_initializer": {"class_name": "VarianceScaling", "config": {"scale": 2.0, "mode": "fan_in", "distribution": "truncated_normal", "seed": null, "dtype": "float32"}}, "bias_initializer": {"class_name": "Zeros", "config": {}}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}, "input_spec": {"class_name": "InputSpec", "config": {"dtype": null, "shape": null, "ndim": null, "max_ndim": null, "min_ndim": 4, "axes": {"-1": 4}}}, "build_input_shape": {"class_name": "TensorShape", "items": [1, 84, 84, 4]}}
?


kernel
	bias
@	variables
Atrainable_variables
Bregularization_losses
C	keras_api
+?&call_and_return_all_conditional_losses
?__call__"?	
_tf_keras_layer?	{"name": "conv2d_1", "trainable": true, "expects_training_arg": false, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "class_name": "Conv2D", "config": {"name": "conv2d_1", "trainable": true, "dtype": "float32", "filters": 64, "kernel_size": {"class_name": "__tuple__", "items": [4, 4]}, "strides": {"class_name": "__tuple__", "items": [2, 2]}, "padding": "valid", "data_format": "channels_last", "dilation_rate": {"class_name": "__tuple__", "items": [1, 1]}, "groups": 1, "activation": "relu", "use_bias": true, "kernel_initializer": {"class_name": "VarianceScaling", "config": {"scale": 2.0, "mode": "fan_in", "distribution": "truncated_normal", "seed": null, "dtype": "float32"}}, "bias_initializer": {"class_name": "Zeros", "config": {}}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}, "input_spec": {"class_name": "InputSpec", "config": {"dtype": null, "shape": null, "ndim": null, "max_ndim": null, "min_ndim": 4, "axes": {"-1": 32}}}, "build_input_shape": {"class_name": "TensorShape", "items": [1, 20, 20, 32]}}
?



kernel
bias
D	variables
Etrainable_variables
Fregularization_losses
G	keras_api
+?&call_and_return_all_conditional_losses
?__call__"?	
_tf_keras_layer?	{"name": "conv2d_2", "trainable": true, "expects_training_arg": false, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "class_name": "Conv2D", "config": {"name": "conv2d_2", "trainable": true, "dtype": "float32", "filters": 64, "kernel_size": {"class_name": "__tuple__", "items": [3, 3]}, "strides": {"class_name": "__tuple__", "items": [1, 1]}, "padding": "valid", "data_format": "channels_last", "dilation_rate": {"class_name": "__tuple__", "items": [1, 1]}, "groups": 1, "activation": "relu", "use_bias": true, "kernel_initializer": {"class_name": "VarianceScaling", "config": {"scale": 2.0, "mode": "fan_in", "distribution": "truncated_normal", "seed": null, "dtype": "float32"}}, "bias_initializer": {"class_name": "Zeros", "config": {}}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}, "input_spec": {"class_name": "InputSpec", "config": {"dtype": null, "shape": null, "ndim": null, "max_ndim": null, "min_ndim": 4, "axes": {"-1": 64}}}, "build_input_shape": {"class_name": "TensorShape", "items": [1, 9, 9, 64]}}
?
H	variables
Itrainable_variables
Jregularization_losses
K	keras_api
+?&call_and_return_all_conditional_losses
?__call__"?
_tf_keras_layer?{"name": "flatten", "trainable": true, "expects_training_arg": false, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "class_name": "Flatten", "config": {"name": "flatten", "trainable": true, "dtype": "float32", "data_format": "channels_last"}, "input_spec": {"class_name": "InputSpec", "config": {"dtype": null, "shape": null, "ndim": null, "max_ndim": null, "min_ndim": 1, "axes": {}}}}
?

kernel
bias
L	variables
Mtrainable_variables
Nregularization_losses
O	keras_api
+?&call_and_return_all_conditional_losses
?__call__"?
_tf_keras_layer?{"name": "dense", "trainable": true, "expects_training_arg": false, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "class_name": "Dense", "config": {"name": "dense", "trainable": true, "dtype": "float32", "units": 512, "activation": "relu", "use_bias": true, "kernel_initializer": {"class_name": "VarianceScaling", "config": {"scale": 2.0, "mode": "fan_in", "distribution": "truncated_normal", "seed": null, "dtype": "float32"}}, "bias_initializer": {"class_name": "Zeros", "config": {}}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}, "input_spec": {"class_name": "InputSpec", "config": {"dtype": null, "shape": null, "ndim": null, "max_ndim": null, "min_ndim": 2, "axes": {"-1": 3136}}}, "build_input_shape": {"class_name": "TensorShape", "items": [1, 3136]}}
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
J
(0
)1
*2
+3
,4
-5"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
?
8	variables
Player_metrics
Qmetrics

Rlayers
Snon_trainable_variables
Tlayer_regularization_losses
9trainable_variables
:regularization_losses
~__call__
*}&call_and_return_all_conditional_losses
&}"call_and_return_conditional_losses"
_generic_user_object
.
0
1"
trackable_list_wrapper
.
0
1"
trackable_list_wrapper
 "
trackable_list_wrapper
?
<	variables
Ulayer_metrics
Vmetrics

Wlayers
Xnon_trainable_variables
Ylayer_regularization_losses
=trainable_variables
>regularization_losses
?__call__
*&call_and_return_all_conditional_losses
&"call_and_return_conditional_losses"
_generic_user_object
.
0
	1"
trackable_list_wrapper
.
0
	1"
trackable_list_wrapper
 "
trackable_list_wrapper
?
@	variables
Zlayer_metrics
[metrics

\layers
]non_trainable_variables
^layer_regularization_losses
Atrainable_variables
Bregularization_losses
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses"
_generic_user_object
.

0
1"
trackable_list_wrapper
.

0
1"
trackable_list_wrapper
 "
trackable_list_wrapper
?
D	variables
_layer_metrics
`metrics

alayers
bnon_trainable_variables
clayer_regularization_losses
Etrainable_variables
Fregularization_losses
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses"
_generic_user_object
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
?
H	variables
dlayer_metrics
emetrics

flayers
gnon_trainable_variables
hlayer_regularization_losses
Itrainable_variables
Jregularization_losses
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses"
_generic_user_object
.
0
1"
trackable_list_wrapper
.
0
1"
trackable_list_wrapper
 "
trackable_list_wrapper
?
L	variables
ilayer_metrics
jmetrics

klayers
lnon_trainable_variables
mlayer_regularization_losses
Mtrainable_variables
Nregularization_losses
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses"
_generic_user_object
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
?2?
)__inference_polymorphic_action_fn_5369594
)__inference_polymorphic_action_fn_5369654?
???
FullArgSpec(
args ?
j	time_step
jpolicy_state
varargs
 
varkw
 
defaults?
? 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2?
/__inference_polymorphic_distribution_fn_5369708?
???
FullArgSpec(
args ?
j	time_step
jpolicy_state
varargs
 
varkw
 
defaults?
? 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2?
__inference_function_5369507?
???
FullArgSpec
args?
jself
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults? 
annotations? *
 
?B?
__inference_<lambda>_5369180"?
???
FullArgSpec
args? 
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?B?
__inference_<lambda>_5369177"?
???
FullArgSpec
args? 
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?B?
%__inference_signature_wrapper_8225924
0/discount0/observation0/reward0/step_type"?
???
FullArgSpec
args? 
varargs
 
varkwjkwargs
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?B?
%__inference_signature_wrapper_8225928"?
???
FullArgSpec
args? 
varargs
 
varkwjkwargs
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?B?
%__inference_signature_wrapper_8225936"?
???
FullArgSpec
args? 
varargs
 
varkwjkwargs
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?B?
%__inference_signature_wrapper_8225940"?
???
FullArgSpec
args? 
varargs
 
varkwjkwargs
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2??
???
FullArgSpecL
argsD?A
jself
jobservation
j	step_type
jnetwork_state

jtraining
varargs
 
varkw
 
defaults?

 
? 
p 

kwonlyargs? 
kwonlydefaults? 
annotations? *
 
?2??
???
FullArgSpecL
argsD?A
jself
jobservation
j	step_type
jnetwork_state

jtraining
varargs
 
varkw
 
defaults?

 
? 
p 

kwonlyargs? 
kwonlydefaults? 
annotations? *
 
?2??
???
FullArgSpecL
argsD?A
jself
jobservation
j	step_type
jnetwork_state

jtraining
varargs
 
varkw
 
defaults?

 
? 
p 

kwonlyargs? 
kwonlydefaults? 
annotations? *
 
?2??
???
FullArgSpecL
argsD?A
jself
jobservation
j	step_type
jnetwork_state

jtraining
varargs
 
varkw
 
defaults?

 
? 
p 

kwonlyargs? 
kwonlydefaults? 
annotations? *
 
?2??
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2??
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2??
???
FullArgSpec1
args)?&
jself
jinputs
jmask

jtraining
varargs
 
varkw
 
defaults?

 
p 

kwonlyargs? 
kwonlydefaults? 
annotations? *
 
?2??
???
FullArgSpec1
args)?&
jself
jinputs
jmask

jtraining
varargs
 
varkw
 
defaults?

 
p 

kwonlyargs? 
kwonlydefaults? 
annotations? *
 
?2??
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2??
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2??
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2??
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2??
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2??
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2??
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2??
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2??
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2??
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 ;
__inference_<lambda>_5369177?

? 
? "? 	4
__inference_<lambda>_5369180?

? 
? "? 4
__inference_function_5369507?

? 
? "? ?
)__inference_polymorphic_action_fn_5369594?
	
???
???
???
TimeStep#
	step_type?
	step_type
reward?
reward!
discount?
discount3
observation$?!
observationTT
? 
? "I?F

PolicyStep
action?
action	
state? 
info? ?
)__inference_polymorphic_action_fn_5369654?
	
???
???
???
TimeStep-
	step_type ?
time_step/step_type'
reward?
time_step/reward+
discount?
time_step/discount=
observation.?+
time_step/observationTT
? 
? "I?F

PolicyStep
action?
action	
state? 
info? ?
/__inference_polymorphic_distribution_fn_5369708?
	
???
???
???
TimeStep#
	step_type?
	step_type
reward?
reward!
discount?
discount3
observation$?!
observationTT
? 
? "???

PolicyStep?
action?????Ãt?q
`
C?@
"j tf_agents.policies.greedy_policy
jDeterministicWithLogProb
!?

loc?
Identity	
? _TFPTypeSpec
state? 
info? ?
%__inference_signature_wrapper_8225924?
	
???
? 
???
%

0/discount?

0/discount
7
0/observation&?#
0/observationTT
!
0/reward?
0/reward
'
0/step_type?
0/step_type""?

action?
action	=
%__inference_signature_wrapper_8225928?

? 
? "? Y
%__inference_signature_wrapper_82259360?

? 
? "?

int64?
int64 	=
%__inference_signature_wrapper_8225940?

? 
? "? 