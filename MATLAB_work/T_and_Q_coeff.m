% density of water in (kg/m^3)
rho = 1000;
%propeller diameter
D = 0.019;
%pitch angle in (m) 
pitch = 0.010;
%P/D ratio
P_D_ratio = pitch/D;
%blade area ratio
b_area = 80/1000000;
disk_area = (pi*(9.5^2)/1000000);
BAR = b_area/disk_area;
%number of blades
n= 6;

% computing KT and KQ for advanced velocities u_a
u_a = 0.1:0.1:6.2; 
for  i = 1:length(u_a)
    [KT(i),KQ(i)] = wageningen(u_a(i), P_D_ratio, BAR, n);
end

%Bollard pull
[KT_0,KQ_0] = wageningen(0, P_D_ratio, BAR, n);

%Thrust_Forces
RPM = 100:100:6200;
RPS = RPM/60;

T = rho* D^4* KT_0* RPS.*abs(RPS);

%Torque
Q = rho*D^5*KQ_0*RPS.*abs(RPS);

%computing open-water coefficient
J_a = u_a/(RPS*D);

eta_O = (J_a*KT)/(2*pi*KQ);
power  = 2*pi*KQ;
%KT/KQ graph and computing thruster open-water efficiency
Jdata = 0:0.01:J_a;

for  j = 1:length(Jdata)
    [KTdata(j),KQdata(j)] = wageningen(Jdata(j), P_D_ratio, BAR, n);
end

figure(1),plot(Jdata, KTdata, 'rd-', Jdata, KQdata, 'ko-'); xlabel('advanced\_velocity'); title('KT, KQ vs advanced velocities'); grid on;
alpha = polyfit(Jdata,KTdata,1)
beta = polyfit(Jdata,KTdata,1)
%T/RPM graph
figure(2); plot(RPM, T, 'ro-');xlabel("RPM");ylabel("Thrust");title("Thrust vs RPM");grid on; 
figure(3); plot(power, T, 'G+-');xlabel("Power");ylabel("Thrust");title("Thrust vs Power");grid on;
%figure(4); plot(u_a,T,'ko-');xlabel("speed");ylabel("thrust");title("thrust vs speed");grid on;