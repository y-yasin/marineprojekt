load fino1_ws_wi3.mat
time = fino1_ws_wi3.time;
speed = fino1_ws_wi3.Value;
rho = 1.2041;
r = 192; % in m
A = r^2*pi; % in m²
pi = pi;
speed3 = speed.^3;
cpmax = 0.5926;
Pwind = 0.5*A*rho*(speed3);
Pnutz = cpmax * Pwind;





