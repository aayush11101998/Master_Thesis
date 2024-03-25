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
    return LaunchDescription([
        # Specify the 'model' argument if needed
        # Declare the 'robot_description' parameter
        DeclareLaunchArgument(
            'model',
            default_value='$(find swimming_robot)/world/urdf/Final_assembly_for_gazebo.urdf',
            description='Specify the model'
        ),
        DeclareLaunchArgument(
            'robot_description',
            description='Path to the URDF file',
            value='$(find swimming_robot)/world/urdf/Final_assembly_for_gazebo.urdf'
        ),
        # Launch the joint_state_publisher_gui node
        Node(
            package='joint_state_publisher_gui',
            executable='joint_state_publisher_gui',
            name='joint_state_publisher_gui'
        ),
        # Launch the robot_state_publisher node
        Node(
            package='robot_state_publisher',
            executable='robot_state_publisher',
            name='robot_state_publisher',
            parameters=[{'robot_description': 'robot_description'}]
        ),])
