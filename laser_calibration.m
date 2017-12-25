function DK = laser_calibration(M,b,Dz,D0)

% M = 640;
% f = 3.5;
% Dz = 49.53;
% D0 = 11.43;
% b = 4.26;
% 
% M = 640;
% f = 3.5;
% Dz = 49.53;
% D0 = 11.43;
% b = 4.26;

% M = 640;
% b = 22.86;
% Dz = 12;
% D0 = 10;
% f = 3.5;

% M = 512;
% f = 3;
% Dz = 49.53;
% D0 = 11.43;
% b = 40;

for k = 1:M
    DK(k) = ( (Dz^2 + b^2)*M*D0 + 2*k*(Dz - D0)*(b^2) ) / ((Dz^2 + b^2)*M - 2*k*(Dz - D0)*Dz);
end

end
 %%@dassg