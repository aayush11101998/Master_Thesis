colcon build --symlink-install
source install/local_setup.bash
SDF_MODELS=$(pwd)"/src/swimming_robot/world/meshes"
ROBOT_MODELS=$(pwd)"/src/swimming_robot/world/meshes"
export GAZEBO_MODEL_PATH=$GAZEBO_MODEL_PATH:$SDF_MODELS:$ROBOT_MODELS
ros2 launch swimming_robot gazebo_launch.py

