#! /bin/bash

export ROS1_INSTALL_PATH=/home/robot/ros1_ws/devel
export ROS2_INSTALL_PATH=/home/robot/ros2_ws/install
export ROS_MASTER_URI=http://cpr-lav07:11311
export ROS_DOMAIN_ID=3

sleep 30

source $ROS1_INSTALL_PATH/setup.bash
rosparam load /home/robot/bridge_ws/src/ros1_bridge/config/bridge_topics.yaml
source /home/robot/bridge_ws/install/setup.bash
source $ROS2_INSTALL_PATH/setup.bash
ros2 run ros1_bridge parameter_bridge