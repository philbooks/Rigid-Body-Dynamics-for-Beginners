function [q1 q2 q3 q4] = QuatNormGyro(wx, wy, wz, dt)
%
%
persistent firstRun
persistent prevQ1 prevQ2 prevQ3 prevQ4


if isempty(firstRun)
  prevQ1 = 0;
  prevQ2 = 0;
  prevQ3 = 0;
  prevQ4 = 1;
  
  firstRun = 1;
end

q1 = prevQ1 + dt*0.5*( prevQ4*wx - prevQ3*wy + prevQ2*wz);
q2 = prevQ2 + dt*0.5*( prevQ3*wx + prevQ4*wy - prevQ1*wz);
q3 = prevQ3 + dt*0.5*(-prevQ2*wx + prevQ1*wy + prevQ4*wz);
q4 = prevQ4 + dt*0.5*(-prevQ1*wx - prevQ2*wy - prevQ3*wz);

Nq = q1^2 + q2^2 + q3^2 + q4^2;

q1 = q1 / sqrt(Nq);
q2 = q2 / sqrt(Nq);
q3 = q3 / sqrt(Nq);
q4 = q4 / sqrt(Nq);

prevQ1 = q1;
prevQ2 = q2;
prevQ3 = q3;
prevQ4 = q4;