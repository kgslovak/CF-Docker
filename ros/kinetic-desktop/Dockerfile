#######################
# ros:kinetic-desktop #
#######################

FROM ubuntu:16.04
LABEL maintainer Kyle G Slovak <kgslovak@gatech.edu>
ENV APT_LAST_UPDATED 2017-07-25

# Setup keys
RUN apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-keys 421C365BD9FF1F717815A3895523BAEEB01FA116

# Setup sources.list
RUN echo "deb http://packages.ros.org/ros/ubuntu xenial main" > /etc/apt/sources.list.d/ros-latest.list

# Install bootstrap tools
RUN apt-get update \
 && apt-get install --no-install-recommends -y \
	python-rosdep \
	python-rosinstall \
	python-vcstools

# Setup environment
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

# Bootstrap rosdep
RUN rosdep init \
 && rosdep update

# Install ROS
ENV ROS_DISTRO kinetic
RUN apt-get install -y \
	ros-kinetic-desktop \
 && rm -rf /var/lib/apt/lists/*

# Setup folder for bash "alias-scripts"
RUN mkdir      /bin/aliases
ENV PATH=$PATH:/bin/aliases

# Setup folder for saving/loading ROS workspaces
RUN mkdir /ROS_WS

# Import entrypoint script
COPY ./Include-on-Build/entrypoint-script/ros_entrypoint.sh /entrypoint/

# Setup entrypoint
ENTRYPOINT ["/entrypoint/ros_entrypoint.sh"]
CMD ["bash"]
