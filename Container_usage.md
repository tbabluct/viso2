In a ROS 1 shell:  
`roscore`

In a ROS 1 + ROS 2 shell:
`source /bridge_ws/install/local_setup.bash`  
`ros2 run ros1_bridge dynamic_bridge --bridge-all-topics`

In a ROS 2 shell:  
`ros2 bag play xyz`

In a ROS 1 shell:
`rosrun viso2_ros stereo_odometer /stereo/left/image:=/zed2i/zed_node/left/image_rect_color /stereo/right/image:=/zed2i/zed_node/right/image_rect_color /stereo/left/camera_info:=/zed2i/zed_node/left/camera_info /stereo/right/camera_info:=/zed2i/zed_node/right/camera_info`

Husky ZED:
`rosrun viso2_ros stereo_odometer /stereo/left/image:=/zed2i/zed_node/left/image_rect_color /stereo/right/image:=/zed2i/zed_node/right/image_rect_color /stereo/left/camera_info:=/zed2i/zed_node/left/camera_info /stereo/right/camera_info:=/zed2i/zed_node/right/camera_info`
Husky Bumblebee:


`rosbag record /stereo_odometer/info /stereo_odometer/odometry /stereo_odometer/point_cloud /stereo_odometer/pose`

