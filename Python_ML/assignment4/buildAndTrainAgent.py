!pip install tf-agents
!pip install gym
!python -m pip install --upgrade 'gym[atari]'
!python -m atari_py.import_roms .

import os
import PIL
import gym
%matplotlib inline
import numpy as np
import tensorflow as tf
from tensorflow import keras
import matplotlib.pyplot as plt
from gym.wrappers import TimeLimit
import tf_agents.environments.wrappers
from tf_agents.metrics import tf_metrics
import matplotlib.animation as animation
from tf_agents.policies import PolicySaver
from tf_agents.utils.common import function
from tf_agents.environments import suite_gym
from tf_agents.environments import suite_atari
from tf_agents.networks.q_network import QNetwork
from tf_agents.agents.dqn.dqn_agent import DqnAgent
from tf_agents.eval.metric_utils import log_metrics
from tf_agents.environments.atari_wrappers import FrameStack4
from tf_agents.replay_buffers import tf_uniform_replay_buffer
from tf_agents.policies.random_tf_policy import RandomTFPolicy
from tf_agents.drivers.dynamic_step_driver import DynamicStepDriver
from tf_agents.environments.tf_py_environment import TFPyEnvironment
from tf_agents.environments.atari_preprocessing import AtariPreprocessing


class ShowProgress:
    def __init__(self, total):
        self.counter = 0
        self.total = total
    def __call__(self, trajectory):
        if not trajectory.is_boundary():
            self.counter += 1
        if self.counter % 100 == 0:
            print("\r{}/{}".format(self.counter, self.total), end="")
    
def update_scene(num, frames, patch):
    patch.set_data(frames[num])
    return patch,

def plot_animation(frames, repeat=False, interval=40):
    fig = plt.figure()
    patch = plt.imshow(frames[0])
    plt.axis('off')
    anim = animation.FuncAnimation(
        fig, update_scene, fargs=(frames, patch),
        frames=len(frames), repeat=repeat, interval=interval)
    plt.close()
    return anim

def plot_observation(obs):
  obs = obs.astype(np.float32)
  img = obs[..., :3]
  current_frame_delta = np.maximum(obs[..., 3] - obs[..., :3].mean(axis=-1), 0.)
  img[..., 0] += current_frame_delta
  img[..., 2] += current_frame_delta
  img = np.clip(img / 150, 0, 1)
  plt.imshow(img)
  plt.axis("off")

def train_agent(n_iterations):
  time_step = None
  policy_state = agent.collect_policy.get_initial_state(tf_env.batch_size)
  saver = PolicySaver(agent.policy, tf_env.batch_size)
  iterator = iter(dataset)
  for iteration in range(n_iterations):
    time_step, policy_state = collect_driver.run(time_step, policy_state)
    trajectories, buffer_info = next(iterator)
    train_loss = agent.train(trajectories)
    print("\r{} loss:{:.5f}".format(
      iteration, train_loss.loss.numpy()), end="")
    if iteration % 1000 == 0:
      log_metrics(train_metrics)
    if iteration % 10000 == 0:
      checkpoint.save('lastModelCheckpoint')
      saver.save('savedPolicy')

env=suite_gym.load('Enduro-v0')
env.reset()
myLimRepEnv=suite_gym.load('Enduro-v0', gym_env_wrappers=[lambda env : TimeLimit(env,max_episode_steps=100000)], env_wrappers=[lambda env : tf_agents.environments.wrappers.ActionRepeat(env,times=4)])
max_episode_steps = 100000 
environment_name = "EnduroNoFrameskip-v0"
env = suite_atari.load(environment_name, max_episode_steps=max_episode_steps, gym_env_wrappers=[AtariPreprocessing, FrameStack4])
tf_env = TFPyEnvironment(env)
preprocessing_layer = tf.keras.layers.Lambda(lambda obs : tf.cast(obs, np.float32) / 255.)
conv_layer_params=[(32, (8, 8), 4), (64, (4, 4), 2), (64, (3, 3), 1)]
fc_layer_params=[512]
q_net = QNetwork(tf_env.observation_spec(), tf_env.action_spec(), preprocessing_layers=preprocessing_layer, conv_layer_params=conv_layer_params, fc_layer_params=fc_layer_params)
checkpoint = tf.train.Checkpoint(q_net)
import tensorflow as tf
train_step = tf.Variable(0)
update_period = 4 # run a training step every 4 collect steps
optimizer = tf.compat.v1.train.RMSPropOptimizer(learning_rate=2.5e-4, decay=0.95, momentum=0.0, epsilon=0.00001, centered=True)
epsilon_fn = keras.optimizers.schedules.PolynomialDecay(initial_learning_rate=1.0, decay_steps=250000 // update_period, end_learning_rate=0.01)
agent = DqnAgent(tf_env.time_step_spec(), tf_env.action_spec(), q_network=q_net, optimizer=optimizer, target_update_period=2000, 
                 td_errors_loss_fn=keras.losses.Huber(reduction="none"), gamma=0.99, train_step_counter=train_step, epsilon_greedy=lambda: epsilon_fn(train_step))

agent.initialize()
replay_buffer = tf_uniform_replay_buffer.TFUniformReplayBuffer(data_spec=agent.collect_data_spec, batch_size=tf_env.batch_size, max_length=500000)
replay_buffer_observer = replay_buffer.add_batch
train_metrics = [
tf_metrics.NumberOfEpisodes(),
tf_metrics.EnvironmentSteps(),
tf_metrics.AverageReturnMetric(),
tf_metrics.AverageEpisodeLengthMetric(),
]
collect_driver = DynamicStepDriver(tf_env, agent.collect_policy, observers=[replay_buffer_observer] + train_metrics, num_steps=update_period)
initial_collect_policy = RandomTFPolicy(tf_env.time_step_spec(), tf_env.action_spec())
init_driver = DynamicStepDriver(
tf_env,
initial_collect_policy,
observers=[replay_buffer.add_batch],
num_steps=20000)
final_time_step, final_policy_state = init_driver.run()
dataset = replay_buffer.as_dataset(sample_batch_size=64, num_steps=2, num_parallel_calls=3).prefetch(3)
collect_driver.run = function(collect_driver.run)
agent.train = function(agent.train)

train_agent(n_iterations=450000)

frames = []
def save_frames(trajectory):
    global frames
    frames.append(tf_env.pyenv.envs[0].render(mode="rgb_array"))

watch_driver = DynamicStepDriver(
    tf_env,
    agent.policy,
    observers=[save_frames, ShowProgress(10000)],
    num_steps=10000)
final_time_step, final_policy_state = watch_driver.run()
anim = plot_animation(frames)


image_path = 'myAgentPlays.gif'
frame_images = [PIL.Image.fromarray(frame) for frame in frames[:500]]
frame_images[0].save(image_path, format='GIF',
                     append_images=frame_images[1:],
                     save_all=True,
                     duration=30,
                     loop=0)




