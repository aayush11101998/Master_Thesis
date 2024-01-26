function [equation] = equation(var, velocity)
   equation = var(1)*0.5*(30493.66/1000000)*(abs(velocity).*velocity)+var(2)*0.5*(30493.66/1000000)*(velocity);
end   