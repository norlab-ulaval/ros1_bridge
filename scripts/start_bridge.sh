#! /bin/bash

export ROS1_INSTALL_PATH=/home/robot/ros1_ws/devel
export ROS2_INSTALL_PATH=/home/robot/ros2_ws/install
export ROS_MASTER_URI=http://cpr-lav07:11311
export ROS_DOMAIN_ID=3

screen_name="ros1_bridge"
screen -S $screen_name -X stuff $'\003'

echo "Setting up ROS1 communication..."
source $ROS1_INSTALL_PATH/setup.bash
until rosparam load /home/robot/bridge_ws/src/ros1_bridge/config/bridge_topics.yaml ; 
    do sleep 1 && echo "Waiting for master..." ; 
done
echo "Connected to master!"

echo "Setting up ROS2 communication..."
source /home/robot/bridge_ws/install/setup.bash
source $ROS2_INSTALL_PATH/setup.bash
screen -dmS $screen_name ros2 run ros1_bridge parameter_bridge

sleep 2
if screen -list | grep -q $screen_name; then
    echo "Bridge started successfully in screen  '$screen_name.'"
else
    echo "ERROR! Failed to start bridge."
fi