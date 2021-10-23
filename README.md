# docker_turtlebot3_gazebo

## Instructions

First, make sure to build the Docker image
```
docker build . -t turtlebot3
```

To enable the GUI for viewing gazebo, run
```
xhost +local:root
```

Launch Docker service for turtlebot3 / gazebo
```
docker-compose up
```

You can connect to the running Docker container and executure code via the command
```
docker exec -it [name_of_the_running_docker_container] bash
```

Be sure to perform development of your packages in ~/melodic_workspace. This is the volume that the docker container mounts.
