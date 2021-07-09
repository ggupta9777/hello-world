FROM ros:noetic-ros-base
LABEL maintainer="gaurav@electricsheep.company"
SHELL ["/bin/bash", "-c"]
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
RUN mkdir -p home/catkin_ws/src/mowing
RUN source /opt/ros/noetic/setup.bash
ADD mowing/ home/catkin_ws/src/mowing/ 
RUN apt-get update #&& apt-get install vim -y
RUN source /opt/ros/noetic/setup.bash && \
	cd home/catkin_ws/ && \
	rosdep install --from-paths src --ignore-src --rosdistro noetic -y && \
	catkin_make
	