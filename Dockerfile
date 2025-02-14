# Dockerfile for Turtlebot3 Gazebo Simulation

FROM ubuntu:18.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt update; apt install -y gnupg2

RUN sh -c 'echo "deb http://packages.ros.org/ros/ubuntu bionic main" > /etc/apt/sources.list.d/ros-latest.list' && \
    apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654

RUN apt update && \
    apt install -y \
        python-pip \
        python-tk \
        ros-melodic-desktop-full \
        python-rosdep \
        python-rosinstall \
        python-rosinstall-generator \
        python-wstool \
        build-essential \
        ros-melodic-joy \
        ros-melodic-tf2-sensor-msgs \
        ros-melodic-rosbash \
        ros-melodic-rviz \
        ros-melodic-teleop-twist-joy \
        ros-melodic-teleop-twist-keyboard \
        ros-melodic-laser-proc \
        ros-melodic-rgbd-launch \
        ros-melodic-depthimage-to-laserscan \
        ros-melodic-rosserial-arduino \
        ros-melodic-rosserial-python \
        ros-melodic-rosserial-server \
        ros-melodic-rosserial-client \
        ros-melodic-rosserial-msgs \
        ros-melodic-amcl \
        ros-melodic-map-server \
        ros-melodic-move-base \
        ros-melodic-urdf \
        ros-melodic-robot-state-publisher \
        ros-melodic-xacro \
        ros-melodic-compressed-image-transport \
        ros-melodic-rqt-image-view \
        ros-melodic-gmapping \
        ros-melodic-navigation \
        ros-melodic-interactive-markers \
        ros-melodic-dynamixel-sdk \
        ros-melodic-turtlebot3-msgs \
        ros-melodic-turtlebot3

# Build catkin_ws
RUN mkdir -p /catkin_ws/src && \
    rosdep init && \
    rosdep update
WORKDIR /catkin_ws/src
#RUN git clone https://github.com/ROBOTIS-GIT/turtlebot3_msgs.git && \
#    git clone -b melodic-devel https://github.com/ROBOTIS-GIT/turtlebot3.git && \
#    git clone -b melodic-devel https://github.com/ROBOTIS-GIT/turtlebot3_simulations.git && \
#    mkdir my_packages

RUN /bin/bash -c "source /opt/ros/melodic/setup.bash; cd /catkin_ws; catkin_make"

#  Source environments
RUN echo "source /opt/ros/melodic/setup.bash" >> /root/.bashrc && \
    echo "source /catkin_ws/devel/setup.bash" >> /root/.bashrc && \
    echo "export TURTLEBOT3_MODEL=burger" >> /root/.bashrc
    

# Cleanup
RUN rm -rf /root/.cache

# Entrypoint
ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

WORKDIR /catkin_ws
ENTRYPOINT [ "/entrypoint.sh" ]

