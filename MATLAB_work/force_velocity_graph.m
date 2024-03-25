function [FVG] = force_velocity_graph(FVG)

    file = load('drag_velocity.mat');
    FVG.velocity = file.velocity_500; %input xdata
    FVG.velocity1 = file.velocity_200; %input
    FVG.velocity2 = file.velocity_100; %input
<<<<<<< HEAD
    FVG.velocity3 = file.rotational_velocity;
    
%velocity = table2array(velocity);
%velocity1 = table2array(velocity1);
%velocity2 = table2array(velocity2);
=======

>>>>>>> bfdb4f1aa99411051da6a9108a01bafc6f59177e

    FVG.force = file.force_500; %output ydata
    FVG.force1 = file.force_200; %output
    FVG.force2 = file.force_100; %output

<<<<<<< HEAD
    FVG.torque = file.torque_500;
    FVG.torque1 = file.torque_200;
    FVG.torque2 = file.torque_100_10;
    FVG.torque3 = file.torque_100_11;

%drag_coefficient = file.dragforcesandstaticthrust1(1:6,4);
%drag_coefficient1 = file.dragforcesandstaticthrust1(8:13, 4);
%drag_coefficient2 = file.dragforcesandstaticthrust1(15:20,4);
%force = table2array(force);
%force1 = table2array(force1);
%force2 = table2array(force2);
=======
>>>>>>> bfdb4f1aa99411051da6a9108a01bafc6f59177e
    
    FVG.lim = [0,15];
    FVG.lim1 = [0,15];
    FVG.lim2 = [0,15];
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
%% for rotational drag
 
 FVG.limt = [-5, 5];
        fun1 = @equation_t;
        [cof] = lsqcurvefit(fun1,FVG.limt,FVG.velocity3,FVG.torque);  
        [cof1] = lsqcurvefit(fun1,FVG.limt,FVG.velocity3,FVG.torque1);
        [cof2] = lsqcurvefit(fun1,FVG.limt,FVG.velocity3,FVG.torque2);
        [cof3] = lsqcurvefit(fun1,FVG.limt,FVG.velocity3,FVG.torque3);
    
    FVG.Coefficient_t1 = cof(1);
    FVG.Coefficient_t2 = cof(2);

<<<<<<< HEAD
    FVG.Coefficient_t3 = cof1(1);
    FVG.Coefficient_t4 = cof1(2);

    FVG.Coefficient_t5 = cof2(1);
    FVG.Coefficient_t6 = cof2(2);

    FVG.Coefficient_t7 = cof3(1);
    FVG.Coefficient_t8 = cof3(2);

   
figure(1); plot(FVG.velocity, FVG.force, 'o-', FVG.velocity, fun(var,FVG.velocity), 'rd-'); legend('original data','fitted data');xlabel('velocity (m/sec)'); ylabel('force (N)'); title('force vs velocity(500mm)'); grid on;
figure(2); plot(FVG.velocity1, FVG.force1, 'o-', FVG.velocity1, fun(var1,FVG.velocity1), 'rd-'); legend('original data','fitted data'); xlabel('velocity (m/sec)'); ylabel('force (N)'); title('force vs velocity(200mm)'); grid on;
figure(3); plot(FVG.velocity2, FVG.force2, 'o-', FVG.velocity2, fun(var2,FVG.velocity2), 'rd-'); legend('original data','fitted data'); xlabel('velocity (m/sec'); ylabel('force (N)'); title('force vs velocity(100mm)'); grid on;
figure(4); plot(FVG.velocity3, FVG.torque, 'o-', FVG.velocity3, fun1(cof,FVG.velocity3), 'rd-'); legend('original data','fitted data'); xlabel('rot\_velocity (rad/sec)'); ylabel('torque (Nm)'); title('torque vs rot\_velocity(500mm)'); grid on;
figure(5); plot(FVG.velocity3, FVG.torque1, 'o-', FVG.velocity3, fun1(cof1,FVG.velocity3), 'rd-'); legend('original data','fitted data'); xlabel('rot\_velocity (rad/sec)'); ylabel('torque (Nm)'); title('torque vs rot\_velocity(200mm)'); grid on;
figure(6); plot(FVG.velocity3, FVG.torque2, 'o-', FVG.velocity3, fun1(cof2,FVG.velocity3), 'rd-'); legend('original data','fitted data'); xlabel('rot\_velocity (rad/sec)'); ylabel('torque (Nm)'); title('torque vs rot\_velocity(100mm)'); grid on;
figure(7); plot(FVG.velocity3, FVG.torque3, 'o-', FVG.velocity3, fun1(cof3,FVG.velocity3), 'rd-'); legend('original data','fitted data'); xlabel('rot\_velocity (rad/sec)'); ylabel('torque (Nm)'); title('torque vs rot\_velocity(100mm)'); grid on;
%figure(4); plot(FVG.velocity3, FVG.torque3,'o-'); grid on;
=======
>>>>>>> bfdb4f1aa99411051da6a9108a01bafc6f59177e

