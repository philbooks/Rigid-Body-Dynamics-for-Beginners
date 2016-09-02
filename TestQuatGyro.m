clear all

dt = 0.01;
t  = 0:dt:5;

Ns = length(t);
QuatSaved = zeros(Ns,4);

for k = 1:Ns
  [wx wy wz] = GetGyro(t(k)); 
  %[q1 q2 q3 q4] = QuatGyro(wx, wy, wz, dt); 
  [q1 q2 q3 q4] = QuatNormGyro(wx, wy, wz, dt); 
  
  QuatSaved(k, :) = [q1 q2 q3 q4];
end 

figure
plot(t, QuatSaved(:, 1))

figure
plot(t, QuatSaved(:, 2))

figure
plot(t, QuatSaved(:, 3))

figure
plot(t, QuatSaved(:, 4))