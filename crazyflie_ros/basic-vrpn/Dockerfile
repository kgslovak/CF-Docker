############################
# crazyflie_ros:basic-vrpn #
############################

FROM ros:kinetic-desktop
LABEL maintainer Kyle G Slovak <kgslovak@gatech.edu>
ENV APT_LAST_UPDATED 2017-07-25

# REQUIRED PKGS
RUN apt-get update \
 && apt-get install --no-install-recommends -y \
	libusb-1.0-0-dev \
	ros-kinetic-vrpn-client-ros

# OPTIONAL TOOLS
RUN apt-get install --no-install-recommends -y \
	arp-scan \
	mupdf \
	vim

RUN mkdir -p /CF_WS/src \
 && cd       /CF_WS/src \
 && git clone https://github.com/kgslovak/CF-Teleop.git \
 && git clone https://github.com/ethz-asl/vicon_bridge.git \
 && git clone https://github.com/whoenig/crazyflie_ros.git

RUN /bin/bash -c 'cd /CF_WS && source /opt/ros/kinetic/setup.bash && catkin_make'

# Import entrypoint script, and required files
COPY ./Include-on-Build/entrypoint-script/cfros_entrypoint.sh 	/entrypoint/
COPY ./Include-on-Build/REQD_FILES/protocols 			/etc/

# Setup entrypoint
ENTRYPOINT ["/entrypoint/cfros_entrypoint.sh"]
CMD ["bash"]
