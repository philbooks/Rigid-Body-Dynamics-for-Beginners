clear all

dt = 0.01;
t  = 0:dt:5;

Ns = length(t);
EulerSaved = zeros(Ns, 3);

for k = 1:Ns
  [wx wy wz] = GetGyro(t(k)); 
  [phi theta psi] = EulerGyro(wx, wy, wz, dt); 
  
  EulerSaved(k, :) = [ phi theta psi ];
end 

PhiSaved   = EulerSaved(:, 1) * 180/pi;
ThetaSaved = EulerSaved(:, 2) * 180/pi;
PsiSaved   = EulerSaved(:, 3) * 180/pi;

figure
plot(t, PhiSaved)

figure
plot(t, ThetaSaved)

figure
plot(t, PsiSaved)