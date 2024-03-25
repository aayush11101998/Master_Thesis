from setuptools import setup

package_name = 'swimming_robot'

data_files = []
data_files.append(('share/' + package_name + '/launch', ['launch/display_launch.py']))
data_files.append(('share/' + package_name + '/launch', ['launch/gazebo_launch.py']))
#data_files.append(('share/' + package_name + '/launch', ['launch/rviz_launch.py']))
#data_files.append(('share/' + package_name + '/launch', ['launch/tb3_launch.py']))
#data_files.append(('share/' + package_name + '/launch', ['launch/localization_launch.py']))
#data_files.append(('share/' + package_name + '/launch', ['launch/navigation_launch.py']))
#data_files.append(('share/' + package_name + '/launch', ['launch/slam_launch.py']))
#data_files.append(('share/' + package_name + '/launch', ['launch/bringup_launch.py']))
#data_files.append(('share/' + package_name + '/launch', ['launch/nav_comm_robot_handler_launch.py']))

data_files.append(('share/' + package_name + '/resources', [
#     'resources/nav2_default_view.rviz',
     'resources/joint_names_Final_assembly_for gazebo.yaml',
#    'resources/trial.yaml',
#     'resources/nav2_namespaced_view.rviz',
#     'resources/nav2_params.yaml',
#     'resources/turtlebot3_waffle.urdf',
#     'resources/turtlebot3_world.yaml',
#     'resources/turtlebot3_world.pgm',
]))

data_files.append(('share/' + package_name, ['package.xml']))
data_files.append(('share/' + package_name + '/world', ['world/urdf/Final_assembly_for_gazebo.urdf']))
data_files.append(('share/' + package_name + '/world', ['world/urdf/Pipeline.sdf']))
data_files.append(('share/' + package_name + '/world', ['world/urdf/robot.sdf']))
data_files.append(('share/' + package_name + '/world', ['world/urdf/robot_new.sdf']))
#data_files.append(('share/' + package_name + '/world', ['world/urdf/swimming robot_assembly_SLDPRT.urdf']))
data_files.append(('share/' + package_name + '/world', ['world/urdf/model.config']))
data_files.append(('share/' + package_name + '/world', ['world/world1.sdf']))
setup(
    name=package_name,
    version='0.0.0',
    packages=[package_name],
    data_files=data_files,
    install_requires=['setuptools', 'launch'],
    zip_safe=True,
    maintainer='aayush1110',
    maintainer_email='you@example.com',
    description='TODO: Package description',
    license='TODO: License declaration',
    keywords=['ROS2', 'Gazebo ignition', 'swimming_Robot', 'Simulation'],
    tests_require=['pytest'],
    entry_points={
        'launch.frontend.launch_extension': ['launch_ros = launch_ros'],
        'console_scripts': [
            'pipeline_spawner_node = swimming_robot.pipeline_spawner:main',
        ],
    },
)
