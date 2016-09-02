function [wx wy wz] = GetGyro(t)
%
%
if t < 1
  wx = 0;
  wy = 0;
  wz = 20 * pi/180.0;        % 20 deg/sec
elseif (1 <= t) && (t < 2)
  wx = 0;
  wy = 20 * pi/180.0;        % 20 deg/sec
  wz = 0;
elseif (2 <= t) && (t < 3)
  wx = 20 * pi/180.0;        % 20 deg/sec
  wy = 0;
  wz = 0;
else
  wx = 0;
  wy = 0;
  wz = 0;
end
