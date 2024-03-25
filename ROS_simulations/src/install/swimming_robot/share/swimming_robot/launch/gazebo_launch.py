import os
import launch
from launch_ros.actions import Node
from launch.actions import DeclareLaunchArgument
from launch.substitutions import LaunchConfiguration
from ament_index_python.packages import get_package_share_directory
from launch.actions import (DeclareLaunchArgument, ExecuteProcess, GroupAction,
                            IncludeLaunchDescription, LogInfo)
from launch import LaunchDescription
from launch.actions import (DeclareLaunchArgument, GroupAction,
                            IncludeLaunchDescription, SetEnvironmentVariable)
from launch.conditions import IfCondition
from launch.launch_description_sources import PythonLaunchDescriptionSource
from launch.substitutions import LaunchConfiguration, PythonExpression
from launch_ros.actions import PushRosNamespace
def generate_launch_description():
    # Get the launch directory
    
    package_dir = get_package_share_directory('swimming_robot')
    launch_dir = os.path.join(package_dir, 'launch')  
    world = LaunchConfiguration('world')
    simulator = LaunchConfiguration('simulator')
    robot_sdf = os.path.join(get_package_share_directory('swimming_robot'), 'world', 'robot_new.sdf')
    
    
    declare_world_cmd = DeclareLaunchArgument(
        'world',
        default_value=os.path.join(package_dir, 'world', 'world1.sdf'),
        description='Full path to world file to load')
    declare_simulator_cmd = DeclareLaunchArgument(
        'simulator',
        default_value='gazebo',
        description='The simulator to use (gazebo or gzserver)'
        )
    
    start_gazebo_cmd = ExecuteProcess(
        cmd=[simulator, '--verbose', '-s', 'libgazebo_ros_init.so',
                                     '-s', 'libgazebo_ros_factory.so', world],
        output='screen')
    
    Footprint = Node(
        name="tf2_footprint_base",
        package="tf2_ros",
        executable="static_transform_publisher",
        output="screen",
        arguments=["0", "0", "0.25", "0", "0", "0", "0", "base_link_pipe", "base_link_robot"]
    )
    
    Spawn_robot = Node(
        name='spawn_node',
        package='gazebo_ros',
        executable='spawn_entity.py',
        arguments=['-entity', 'part1', '-x', '0', '-y', '0', '-z', '0.25', '-x', '0', '-y', '0', '-z', '0','-file', robot_sdf])

    Joint = ExecuteProcess(
            cmd=["ros2", "topic", "pub", "/calibrated", "std_msgs/msg/Bool", '{"data":=true}'],
            name="fake_joint_calibration",
            output="screen"
        )
    
    return launch.LaunchDescription([  
    # Declare the launch options
        declare_simulator_cmd,
        declare_world_cmd,
    # Add the actions to start gazebo, robots and simulations
        start_gazebo_cmd,
        Spawn_robot,
        Footprint,
        Joint
    ])
