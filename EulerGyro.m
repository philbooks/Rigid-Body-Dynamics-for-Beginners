function [phi theta psi] = EulerGyro(wx, wy, wz, dt)
%
%
persistent firstRun
persistent prevPhi prevTheta prevPsi


if isempty(firstRun)
  prevPhi   = 0;
  prevTheta = 0;
  prevPsi   = 0;
  
  firstRun = 1;
end

sinPhi   = sin(prevPhi);    cosPhi   = cos(prevPhi);
cosTheta = cos(prevTheta);  tanTheta = tan(prevTheta);

phi   = prevPhi   + dt*(wx + wy*sinPhi*tanTheta + wz*cosPhi*tanTheta);
theta = prevTheta + dt*(     wy*cosPhi          - wz*sinPhi);
psi   = prevPsi   + dt*(     wy*sinPhi/cosTheta + wz*cosPhi/cosTheta);

prevPhi   = phi;
prevTheta = theta;
prevPsi   = psi; 