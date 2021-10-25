# docker_turtlebot3_gazebo

## Instructions

Install [Docker](https://docs.docker.com/engine/install/).

Install [docker-compose](https://docs.docker.com/compose/install/).

Build the image for the docker container. Note: You may need execute the following command with sudo/admin privelges depending on your system. Building the image will take a while.
```
docker build . -t turtlebot3
```

To enable the GUI for viewing gazebo and other GUI components, run
```
xhost +local:root
```

Launch the Docker container which runs a Ubuntu 18.04 environment complete with ROS Melodic, Gazebo, and packages associated with Turtlebot3.
```
./start_turtlebot3_container
```

Connect to the Docker container to run code/commands
```
./connect_to_turtlbot3_container
```

## TODO
- Make the volume to mount a parameter to "./start_turtlebot3_container"
- Test how to do Xserver forwarding on MAC and  Windows
- 
