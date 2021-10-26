# docker_turtlebot3_gazebo

## Instructions

Install [Docker](https://docs.docker.com/engine/install/).

Build the image for the docker container. Note: You may need execute the following command with sudo/admin privelges depending on your system. Building the image will take a while.
```
docker build . -t turtlebot3
```

To enable the GUI for viewing gazebo and other GUI components, run
```
xhost +local:root
```

To launch the Docker container which runs an Ubuntu 18.04 environment complete with ROS Melodic, Gazebo, and packages associated with Turtlebot3, run the following:
```
python3 start_turtlebot3_container.py
```

Connect to the Docker container to run code/commands
```
./connect_to_turtlbot3_container
```

## TODO
- Make the volume to mount a parameter to "start_turtlebot3_container.py"
- Test how to do Xserver forwarding on MAC and  Windows
- Make a requirements.txt --> pip install docker for python3
- Add python3 as prerequiste requirement.
