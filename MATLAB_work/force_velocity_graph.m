function [FVG] = force_velocity_graph(FVG)

    file = load('drag_velocity.mat');
    FVG.velocity = file.velocity_500; %input xdata
    FVG.velocity1 = file.velocity_200; %input
    FVG.velocity2 = file.velocity_100; %input


    FVG.force = file.force_500; %output ydata
    FVG.force1 = file.force_200; %output
    FVG.force2 = file.force_100; %output

    
    FVG.lim = [0,35];
    FVG.lim1 = [0,35];
    FVG.lim2 = [0,35];
    fun = @equation;
    var = lsqcurvefit(fun,FVG.lim,FVG.velocity,FVG.force);
    var1 = lsqcurvefit(fun,FVG.lim1,FVG.velocity1,FVG.force1);
    var2 = lsqcurvefit(fun,FVG.lim2,FVG.velocity2,FVG.force2);

    FVG.Coefficient1 = var(1);
    FVG.Coefficient2 = var(2);

    FVG.Coefficient3 = var1(1);
    FVG.Coefficient4 = var1(2);

    FVG.Coefficient5 = var2(1);
    FVG.Coefficient6 = var2(2);


figure(1); plot(FVG.velocity, FVG.force, 'o-', FVG.velocity, fun(var,FVG.velocity), 'rd-'); xlabel('velocity'); ylabel('force'); title('force vs velocity(500mm)'); grid on;
figure(2); plot(FVG.velocity1, FVG.force1, 'o-', FVG.velocity1, fun(var1,FVG.velocity1), 'rd-'); xlabel('velocity'); ylabel('force'); title('force vs velocity(200mm)'); grid on;
figure(3); plot(FVG.velocity2, FVG.force2, 'o-', FVG.velocity2, fun(var2,FVG.velocity2), 'rd-'); xlabel('velocity'); ylabel('force'); title('force vs velocity(100mm)'); grid on;
%figure(4); plot(force, drag_coefficient, 'o-'); xlabel('force'); ylabel('drag-coefficient'); title('force vs Cd(500mm)'); grid on;
%figure(5); plot(force1, drag_coefficient1, 'o-'); xlabel('force'); ylabel('drag-coefficient'); title('force vs Cd(200mm)'); grid on;
%figure(6); plot(force2, drag_coefficient2, 'o-'); xlabel('force'); ylabel('drag-coefficient'); title('force vs Cd(100mm)'); grid on;
