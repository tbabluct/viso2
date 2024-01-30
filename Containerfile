FROM osrf/ros:noetic-desktop-full

ENV TZ=Africa/Johannesburg
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Install Foxy
RUN apt-get update && apt-get install -y software-properties-common
RUN add-apt-repository universe

RUN apt-get update && apt-get install curl -y
RUN curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg
RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y ros-foxy-ros-base python3-argcomplete ros-dev-tools

RUN apt-get install -y tmux git
RUN apt-get install -y ros-noetic-image-proc ros-noetic-stereo-image-proc

WORKDIR /bridge_ws/src/
# https://github.com/ros2/ros1_bridge/issues/385
RUN git clone https://github.com/ros2/ros1_bridge.git ros1_bridge -b foxy
WORKDIR /bridge_ws/
RUN . /opt/ros/noetic/setup.sh && . /opt/ros/foxy/local_setup.sh && colcon build --packages-select ros1_bridge --cmake-force-configure

WORKDIR /viso_ws/src/viso2
COPY ./ ./

WORKDIR /viso_ws/
RUN . /opt/ros/noetic/setup.sh && catkin_make

