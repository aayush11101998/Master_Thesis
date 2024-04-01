# Modelling of an "In-Pipe Micro Autonomous Swimming Robot"

### Abstract: 
The average fresh water lost in pipelines due to leakages in Italy between 2018-2020 is 42% with this percentage increasing up-to 80% in some areas, such significant amount of water loss being a concern demands pipe repairing strategies, in order to save water. With data available at ITSTAT in 2018 8.4 billion cubic meters water was pumped to the citizens and only 4.7 billion cubic meters reached the users, this loss cost the government approximately 1750 M euros. To cope with pipe leakages development of an In-Pipe micro-AUV robot navigating inside the pipeline and finding pipeline leakages is being discussed here. Controlling of the robot inside the pipelines map (prototype) and simulation experimentation is presented. This work tries to address the short comings faced by a free swimming micro-AUV while moving inside water-pipelines of diameters up-to 4 inches(100 mm) i.e. in-pipe navigation

### Repository Structure:
1.) [parts](https://github.com/aayush11101998/Master_Thesis/tree/master/parts): This folder contains several CAD files necessary to build the CAD model of the *Swimming Robot* that is used during the course of the work. 
It also contains parts of the *Pipe Network*, which is a replication from a real pipeline network. Using SolidWorks Computational Fluid Dynamics (CFD) add-in, I have first calculated all the drag forces (linear and rotational) acting on the robot inside a pipeline.

*If you want to calculate your own data keep in kind some important points (Software: SolidWorks)*:
- Keep the **[robot](https://github.com/aayush11101998/Master_Thesis/blob/master/swimming%20robot.SLDPRT)** fixed and almost at the center of the pipeline while calculating the linear drag forces.
- The pipes need to closed with the lids. These lids should then be fixed.
- The input velocity and other basic parameters of the water has to vary according to the velcotiy data you get for water pipe networks. **[Final Assembly](https://github.com/aayush11101998/Master_Thesis/blob/master/Final_assembly.SLDASM)**.
- Observation should be the Normal Force (z-axis) acting on the surface of the **[robot](https://github.com/aayush11101998/Master_Thesis/blob/master/swimming%20robot.SLDPRT)**.
- The nature of water flow should be Laminar and Turbulant, with the energy and power dissipation of turbulance as 1 J/Kg and 1W/kg, respectively.
- Since the pipes are water pipes I have considered the roughness of surface as 260 micrometers.


2.) [MATLAB_work](https://github.com/aayush11101998/Master_Thesis/tree/master/MATLAB_work): It contains MATLAB files where I have first got the *Drag Coefficients* for the robot. Then, there is another file providing the Thrust and Torque data for propellers. Finally, another file tells us about the maximum *linear and angular velocity* the robot can possess inside the designed pipe network environment. 

3.)[ROS_simulations](https://github.com/aayush11101998/Master_Thesis/tree/master/ROS_simulations): **Work Under Progress**. Find a seperate readme for the ROS_simulations once the work is over [here](https://github.com/aayush11101998/Master_Thesis/tree/master/ROS_simulations) I have used [Humble](https://docs.ros.org/en/humble/index.html) and [Gazebo](https://gazebosim.org/home) for the simulation of the robot inside the pipeline. [World](https://github.com/aayush11101998/Master_Thesis/tree/master/ROS_simulations/src/swimming_robot/world) contains the environment and the robot sdf files. While just in order to run the current simulation use the command in linux terminal: **./run.sh**. *"P.S. double check the file permissions."*

