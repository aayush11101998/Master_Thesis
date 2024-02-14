TQ = T_and_Q_coeff();
FVG = force_velocity_graph();
%extracting maximum force values
Max_Thrust = 2*max(TQ.T);
Max_drag_500 = max(FVG.force);
Max_drag_200 = max(FVG.force1);
Max_drag_100 = max(FVG.force2);

Max_Drag = max([Max_drag_100 Max_drag_200 Max_drag_500]);

%interchanging variables to the equations of drag force and thrust
%Maximum req. RPM for different pipelines
Solution_R = roots([TQ.rho*TQ.D^4*TQ.KT_0, 0, -Max_drag_500]);

Solution_R1 = roots([TQ.rho*TQ.D^4*TQ.KT_0, 0, -Max_drag_200]);

Solution_R2 = roots([TQ.rho*TQ.D^4*TQ.KT_0, 0, -Max_drag_100]);

%Maximum required velocity
Solution_500 = roots([FVG.Coefficient1*0.5*(30493.66/1000000), FVG.Coefficient2*0.5*(30493.66/1000000), - Max_Thrust]);

Solution_200 = roots([FVG.Coefficient3*0.5*(30493.66/1000000), FVG.Coefficient4*0.5*(30493.66/1000000), - Max_Thrust]);

Solution_100 = roots([FVG.Coefficient5*0.5*(30493.66/1000000), FVG.Coefficient6*0.5*(30493.66/1000000), - Max_Thrust]);
disp(Solution_100)
figure(1); plot(Solution_500, Solution_R, 'o-'); xlabel('req\_velocity for 100'); ylabel('Max-thrust'); title('Req.\_velocity vs Max\_req\_Thrust'); grid on;
figure(2); plot(Solution_200, Solution_R1, 'o-'); xlabel('req\_velocity for 200'); ylabel('Max-thrust'); title('Req.\_velocity vs Max\_req\_Thrust'); grid on;
figure(3); plot(Solution_100, Solution_R2, 'o-'); xlabel('req\_velocity for 500'); ylabel('Max-thrust'); title('Req.\_velocity vs Max\_req\_Thrust'); grid on;


