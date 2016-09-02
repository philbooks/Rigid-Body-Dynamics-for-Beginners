clear all

dt = 0.01;
t  = 0:dt:5;

Ns = length(t);
C11Saved = zeros(Ns, 1);
C12Saved = zeros(Ns, 1);
C13Saved = zeros(Ns, 1);
C21Saved = zeros(Ns, 1);
C22Saved = zeros(Ns, 1);
C23Saved = zeros(Ns, 1);
C31Saved = zeros(Ns, 1);
C32Saved = zeros(Ns, 1);
C33Saved = zeros(Ns, 1);

for k = 1:Ns
  [wx wy wz] = GetGyro(t(k)); 
  dcm        = DcmGyro(wx, wy, wz, dt); 
  
  C11Saved(k) = dcm(1,1);
  C12Saved(k) = dcm(1,2);
  C13Saved(k) = dcm(1,3);
  C21Saved(k) = dcm(2,1);
  C22Saved(k) = dcm(2,2);
  C23Saved(k) = dcm(2,3);
  C31Saved(k) = dcm(3,1);
  C32Saved(k) = dcm(3,2);
  C33Saved(k) = dcm(3,3);
end 

figure
hold on
plot(t, C11Saved, 'r'),    plot(t, C12Saved, 'g'),    plot(t, C13Saved, 'b')
plot(t, C21Saved, 'r:'),   plot(t, C22Saved, 'g:'),   plot(t, C23Saved, 'b:')
plot(t, C31Saved, 'r--'),  plot(t, C32Saved, 'g--'),  plot(t, C33Saved, 'b--')

Phi   = atan2(C23Saved, C33Saved) *180/pi;
Theta = -asin(C13Saved) * 180/pi;
Psi   = atan2(C12Saved, C11Saved) * 180/pi;

figure
hold on
plot(t, Phi, 'r'),  plot(t, Theta, 'g'),   plot(t, Psi, 'b')