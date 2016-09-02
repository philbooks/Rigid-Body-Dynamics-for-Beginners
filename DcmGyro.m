function dcm = DcmGyro(wx, wy, wz, dt)
%
%
persistent firstRun
persistent prevDcm

dcm = zeros(3, 3);

if isempty(firstRun)
  prevDcm = eye(3);

  firstRun = 1;
end

dcm(1,1) = prevDcm(1,1) + dt*(wz*prevDcm(2,1) - wy*prevDcm(3,1));
dcm(1,2) = prevDcm(1,2) + dt*(wz*prevDcm(2,2) - wy*prevDcm(3,2));
dcm(1,3) = prevDcm(1,3) + dt*(wz*prevDcm(2,3) - wy*prevDcm(3,3));

dcm(2,1) = prevDcm(2,1) + dt*(wx*prevDcm(3,1) - wz*prevDcm(1,1));
dcm(2,2) = prevDcm(2,2) + dt*(wx*prevDcm(3,2) - wz*prevDcm(1,2));
dcm(2,3) = prevDcm(2,3) + dt*(wx*prevDcm(3,3) - wz*prevDcm(1,3));

dcm(3,1) = prevDcm(3,1) + dt*(wy*prevDcm(1,1) - wx*prevDcm(2,1));
dcm(3,2) = prevDcm(3,2) + dt*(wy*prevDcm(1,2) - wx*prevDcm(2,2));
dcm(3,3) = prevDcm(3,3) + dt*(wy*prevDcm(1,3) - wx*prevDcm(2,3));

prevDcm = dcm;