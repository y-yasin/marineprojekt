load fino1_ws_wi3.mat

time = fino1_ws_wi3.time
speed = fino1_ws_wi3.Value

plot(time,speed)

%Siemens Gamesa 10 MW Wind Turbine with 192 m rotor blades

r = 192 % in m
A = r^2*pi % in m²
pi = pi
speed3 = speed.^3

cpmax = 0.5926

Pwind = 0.5*A*rho*(speed3)

Pnutz = cpmax * Pwind 

plot(time,speed)
title('Leistung aus Wind')

hold on

plot(time,Pwind)
plot(time,Pnutz)










