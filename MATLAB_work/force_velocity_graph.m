file = load('dragdata.mat');
velocity = file.dragforcesandstaticthrust1(1:6,2); %input xdata
velocity1 = file.dragforcesandstaticthrust1(8:13,2); %input
velocity2 = file.dragforcesandstaticthrust1(15:20,2); %input
velocity = table2array(velocity);
velocity1 = table2array(velocity1);
velocity2 = table2array(velocity2);

force = file.dragforcesandstaticthrust1(1:6,3); %output ydata
force1 = file.dragforcesandstaticthrust1(8:13,3); %output
force2 = file.dragforcesandstaticthrust1(15:20,3); %output
%drag_coefficient = file.dragforcesandstaticthrust1(1:6,4);
%drag_coefficient1 = file.dragforcesandstaticthrust1(8:13, 4);
%drag_coefficient2 = file.dragforcesandstaticthrust1(15:20,4);
force = table2array(force);
force1 = table2array(force1);
force2 = table2array(force2);
%lb = [112.630334014058,274.196611438318];
%ub = [112.630334014058,274.196611438318];
%lb1 = [101.689967867273,161.447330363098];
%ub1 = [101.689967867273,161.447330363098];
%lb2 = [57.5461222980313,92.8810030580485];
%ub2 = [57.5461222980313,92.8810030580485];
lim = [0,35];
lim1 = [0,35];
lim2 = [0,35];
fun = @equation;
var = lsqcurvefit(fun,lim,velocity,force);
var1 = lsqcurvefit(fun,lim1,velocity1,force1);
var2 = lsqcurvefit(fun,lim2,velocity2,force2);

Coefficient1 = var(1)
Coefficient2 = var(2)

Coefficient3 = var1(1)
Coefficient4 = var1(2)

Coefficient5 = var2(1)
Coefficient6 = var2(2)

%drag_coefficient = table2array(drag_coefficient);
%drag_coefficient1 = table2array(drag_coefficient1);
%drag_coefficient2 = table2array(drag_coefficient2);

figure(1); plot(velocity, force, 'o-', velocity, fun(var,velocity), 'rd-'); xlabel('velocity'); ylabel('force'); title('force vs velocity(500mm)'); grid on;
figure(2); plot(velocity1, force1, 'o-', velocity1, fun(var1,velocity1), 'rd-'); xlabel('velocity'); ylabel('force'); title('force vs velocity(200mm)'); grid on;
figure(3); plot(velocity2, force2, 'o-', velocity2, fun(var2,velocity2), 'rd-'); xlabel('velocity'); ylabel('force'); title('force vs velocity(100mm)'); grid on;
%figure(4); plot(force, drag_coefficient, 'o-'); xlabel('force'); ylabel('drag-coefficient'); title('force vs Cd(500mm)'); grid on;
%figure(5); plot(force1, drag_coefficient1, 'o-'); xlabel('force'); ylabel('drag-coefficient'); title('force vs Cd(200mm)'); grid on;
%figure(6); plot(force2, drag_coefficient2, 'o-'); xlabel('force'); ylabel('drag-coefficient'); title('force vs Cd(100mm)'); grid on;
