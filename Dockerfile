FROM osrf/ros:noetic-desktop-full

SHELL ["/bin/bash", "-c"]

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y git python-is-python3 python3-catkin-tools \
        ros-noetic-joint-trajectory-controller \
        ros-noetic-moveit \
        ros-noetic-moveit-visual-tools \
        ros-noetic-industrial-trajectory-filters \
        ros-noetic-move-base \
        ros-noetic-global-planner \
        ros-noetic-dwa-local-planner \
        ros-noetic-robot-localization && \
    apt-get clean

RUN mkdir -p /ws/src

ADD all.launch /ws/all.launch

RUN source /opt/ros/$ROS_DISTRO/setup.bash && \
    mkdir -p /ws/src && \
    cd /ws/src && \
    catkin init && \
    git clone --depth=1 https://github.com/Unity-Technologies/ROS-TCP-Endpoint.git && \
    git clone --depth=1 https://github.com/pwri-opera/opera_tools.git && \
    git clone --depth=1 https://github.com/pwri-opera/zx120_ros.git && \
    git clone --depth=1 https://github.com/pwri-opera/ic120_ros.git && \
    cd /ws && \
    catkin config --install && \
    catkin config --cmake-args -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/opt/ros/$ROS_DISTRO -DCATKIN_ENABLE_TESTING=0 && \
    catkin build && \
    cp -r /ws/src/ROS-TCP-Endpoint/src/ros_tcp_endpoint /opt/ros/$ROS_DISTRO/lib/ros_tcp_endpoint && \
    cp -r /ws/src/ROS-TCP-Endpoint/launch /opt/ros/$ROS_DISTRO/share/ros_tcp_endpoint
    #cd / && rm -rf /ws
