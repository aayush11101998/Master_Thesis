function [TQ] = T_and_Q_coeff(TQ)
% density of water in (kg/m^3)
TQ.rho = 1000;
%propeller diameter
TQ.D = 0.019;
%pitch angle in (m) 
TQ.pitch = 0.008;
%P/D ratio
TQ.P_D_ratio = TQ.pitch/TQ.D;
%blade area ratio
TQ.b_area = 194/1000000;
TQ.disk_area = (pi*(9.5^2)/1000000);
TQ.BAR = TQ.b_area/TQ.disk_area;
%number of blades
TQ.n= 4;

% computing KT and KQ for advanced velocities u_a
TQ.u_a = 0.1:0.1:6.2; 
for  i = 1:length(TQ.u_a)
    [TQ.KT(i),TQ.KQ(i)] = wageningen(TQ.u_a(i), TQ.P_D_ratio, TQ.BAR, TQ.n);
end

%Bollard pull
[TQ.KT_0,TQ.KQ_0] = wageningen(0, TQ.P_D_ratio, TQ.BAR, TQ.n);

%Thrust_Forces
TQ.RPM = 100:100:6200;
TQ.RPS = TQ.RPM/60;

%thrust vs rpm equation
TQ.T = TQ.rho* TQ.D^4* TQ.KT_0* TQ.RPS.*abs(TQ.RPS);

%Torque
TQ.Q = TQ.rho*TQ.D^5*TQ.KQ_0*TQ.RPS.*abs(TQ.RPS);

%computing open-water coefficient
TQ.J_a = TQ.u_a/(TQ.RPS*TQ.D);

TQ.eta_O = (TQ.J_a*TQ.KT)/(2*pi*TQ.KQ);
TQ.power  = 2*pi*TQ.KQ;
%KT/KQ graph and computing thruster open-water efficiency
TQ.Jdata = 0:0.01:TQ.J_a;

for  j = 1:length(TQ.Jdata)
    [TQ.KTdata(j),TQ.KQdata(j)] = wageningen(TQ.Jdata(j), TQ.P_D_ratio, TQ.BAR, TQ.n);
end

figure(1),plot(TQ.Jdata, TQ.KTdata, 'rd-', TQ.Jdata, TQ.KQdata, 'ko-'); xlabel('advanced\_velocity'); title('KT, KQ vs advanced velocities'); grid on;
TQ.alpha = polyfit(TQ.Jdata,TQ.KTdata,1);
TQ.beta = polyfit(TQ.Jdata,TQ.KTdata,1);
%T/RPM graph
figure(2); plot(TQ.RPM, TQ.T, 'ro-');xlabel("RPM");ylabel("Thrust");title("Thrust vs RPM");grid on; 
figure(3); plot(TQ.power, TQ.T, 'G+-');xlabel("Power");ylabel("Thrust");title("Thrust vs Power");grid on;
%figure(4); plot(u_a,T,'ko-');xlabel("speed");ylabel("thrust");title("thrust vs speed");grid on;