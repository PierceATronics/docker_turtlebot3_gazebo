#! /usr/bin/env python3

import docker
import os

client = docker.from_env()

image_name="turtlebot3"
name="my_turtlebot3_env"
host_proj_dir="/home/pierce/intro_robotics_labs"
container_proj_dir="/catkin_ws/src/intro_robotics_labs"
x11_volume_mnt = "/tmp/.X11-unix:/tmp/.X11-unix:rw"

hostname="turtlebot3"
env_file="env_vars.list"
env_vars = ["PYTHONUNBUFFERED=1", 
                    "DISPLAY", "QT_X11_NO_MITSHM=1",
                    "NVIDIA_VISIBLE_DEVICE=all", 
                    "NVIDIA_DRIVER_CAPABILITIES=all"]
restart_policy={"Name": "always"}

#create the volumes for the container
volume_list = [host_proj_dir + ":" + container_proj_dir, x11_volume_mnt]

try:
    turtlebot3_container = client.containers.get(name)
    container_status = turtlebot3_container.status

    print("[WARNING] Container", name, "is already created!")
    print("\t [INFO] Container", name, "status:", turtlebot3_container.status)
    
    if(container_status == "exited"):
        turtlebot3_container.start()
        print("\t [INFO] Restarting container", name)
    elif(container_status == "running"):
        print("\t [INFO] Container", name, "already running.")

except:
    print("[INFO] Staring container", name)

    client.containers.run(image_name, name=name, volumes=volume_list, hostname=hostname,stdin_open=True, detach=True, environment=env_vars, restart_policy=restart_policy)



