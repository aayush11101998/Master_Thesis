function [equation_t] = equation_t(cof, rot_velocity)
   equation_t = cof(1)*0.5*(30493.66/1000000)*1000*(0.0425^2)*(abs(rot_velocity).*rot_velocity)+cof(2)*0.5*1000*(0.0425^2)*(30493.66/1000000)*(rot_velocity);
 %  equation_t = cof(2)*0.5*(30493.66/1000000)*(rot_velocity);
end  