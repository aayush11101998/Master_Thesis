
TQ = T_and_Q_coeff();
FVG = force_velocity_graph();
%extracting maximum thrust values 
Max_Thrust = 2*max(TQ.T); %thrust at max RPM

%Max_Drag = max([Max_drag_100 Max_drag_200 Max_drag_500]);

% finding velocity
vel.Solution_500 = roots([FVG.Coefficient1*0.5*(30493.66/1000000), FVG.Coefficient2*0.5*(30493.66/1000000), - Max_Thrust]);
vel.Solution_200 = roots([FVG.Coefficient3*0.5*(30493.66/1000000), FVG.Coefficient4*0.5*(30493.66/1000000), - Max_Thrust]);
vel.Solution_100 = roots([FVG.Coefficient5*0.5*(30493.66/1000000), FVG.Coefficient6*0.5*(30493.66/1000000), - Max_Thrust]);
disp(vel)
u = -10.0:0.1:10.0;
F1 = FVG.Coefficient1*0.5*(30493.66/1000000)*abs(u).*u + FVG.Coefficient2*0.5*(30493.66/1000000)*u;
F2 = FVG.Coefficient3*0.5*(30493.66/1000000)*abs(u).*u + FVG.Coefficient4*0.5*(30493.66/1000000)*u;
F3 = FVG.Coefficient5*0.5*(30493.66/1000000)*abs(u).*u + FVG.Coefficient6*0.5*(30493.66/1000000)*u;
%% rotational part

d = 0.023; %distance from COM
Tau = 2*max(TQ.T)*d; %torque 

Omega_ver.w_ver500 = roots([FVG.Coefficient_t1*0.5*(30493.66/1000000), FVG.Coefficient_t2*0.5*(30493.66/1000000), - Tau]);
Omega_ver.w_ver200 = roots([FVG.Coefficient_t3*0.5*(30493.66/1000000), FVG.Coefficient_t4*0.5*(30493.66/1000000), - Tau]);
Omega_ver.w_ver100 = roots([FVG.Coefficient_t5*0.5*(30493.66/1000000), FVG.Coefficient_t6*0.5*(30493.66/1000000), - Tau]);
Omega_ver.w_ver100_1 = roots([FVG.Coefficient_t7*0.5*(30493.66/1000000), FVG.Coefficient_t8*0.5*(30493.66/1000000), - Tau]);

disp(Omega_ver)
w = -10:0.01:10;
T1 = FVG.Coefficient_t1*0.5*(30493.66/1000000)*abs(w).*w + FVG.Coefficient_t2*0.5*(30493.66/1000000)*w;
T2 = FVG.Coefficient_t3*0.5*(30493.66/1000000)*abs(w).*w + FVG.Coefficient_t4*0.5*(30493.66/1000000)*w;
T3 = FVG.Coefficient_t5*0.5*(30493.66/1000000)*abs(w).*w + FVG.Coefficient_t6*0.5*(30493.66/1000000)*w;
T4 = FVG.Coefficient_t5*0.5*(30493.66/1000000)*abs(w).*w + FVG.Coefficient_t6*0.5*(30493.66/1000000)*w;
disp(max(TQ.Q))

%% graph plots
figure(1); plot(u, F1, 'o-'); xlabel("velocity (m/sec)");ylabel("force (N)");grid on;
figure(2); plot(u, F2, 'o-'); xlabel("velocity (m/sec)");ylabel("force (N)");grid on;
figure(3); plot(u, F3, 'o-'); xlabel("velocity (m/sec)");ylabel("force (N)");grid on;
figure(4); plot(w, T1, 'o-'); xlabel("angular\_velocity (rad/sec)");ylabel("torque (Nm)");grid on;
figure(5); plot(w, T2, 'o-'); xlabel("angular\_velocity (rad/sec)");ylabel("torque (Nm)");grid on;
figure(6); plot(w, T3, 'o-'); xlabel("angular\_velocity (rad/sec)");ylabel("torque (Nm)");grid on;
figure(7); plot(w, T4, 'o-'); xlabel("angular\_velocity (rad/sec)");ylabel("torque (Nm)");grid on;
%figure(1); plot(Solution_500, '*'); xlabel('velocity for 500 at max RPM'); title('velocity at Max\_Thrust'); grid on;
%figure(2); plot(Solution_200, '*'); xlabel('velocity for 200 at max RPM'); title('velocity at Max\_Thrust'); grid on;
%figure(3); plot(Solution_100, '*'); xlabel('velocity for 100 at max RPM'); title('velocity at Max\_Thrust'); grid on;
%figure(4); plot(Solution_R, 'o'); xlabel('req\_velocity for 500 at max. velocity'); title('Req.\_velocity vs Max\_req\_Thrust'); grid on;
%figure(5); plot(Solution_R1, 'o'); xlabel('req\_velocity for 200 at max velocity'); title('Req.\_velocity vs Max\_req\_Thrust'); grid on;
%figure(6); plot(Solution_R2, 'o'); xlabel('req\_velocity for 100 at max velocity'); title('Req.\_velocity vs Max\_req\_Thrust'); grid on;

