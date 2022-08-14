%% gain data

load fino1_ws_wi3.mat %gemesse Windgeschwindigkeiten alle 10 min
load windspeed_hourly.mat

%reference: Siemens Gamesa 10 MW Wind Turbine with 192 m rotor blades


time = windspeed_hourly.time;
speed = windspeed_hourly.ws_hourly;

%Siemens Gamesa 10 MW Wind Turbine with 192 m rotor blades

rho = 1.2041;
r = 100; % rotor blade in m
A = r^2*pi; % in m²
pi = pi;
cpmax = 0.5926;
eff = 0.45;

speed3 = speed.^3;

%% turbine power calculations

Pwind = 100*0.5*A*rho*(speed3)/1000000; % 100 *  WKA
Pnutz = cpmax * Pwind; % theoretischer Wirkungsgrad
Pturbine = eff * Pwind; % WKA Wirkungsgrad 
Pnenn = 10*100; % 100 * 10 MW WKA

Pturbine(Pturbine > Pnenn) = Pnenn;

%% turbine power plotting 

% plot(time,speed)
% hold on
% plot(time,Pwind, '-g')
% title('Windleistung')

hold on
plot(time,Pturbine, 'red','LineWidth',0.01)

% plot(time,Pwind,'blue','LineWidth',0.3)

% axis([0 8760 0 350]) % eins & zwei: x-Achse, drei & vier: y-Achse

xlabel('time [h]')
ylabel('power [MW]')
title('maximum possible power')
legend('max turbine power','wind power')


%% EEX calculations

%eex2021 = xlsread('EEXDaten.xlsx', '2021');
% 
income = Pturbine .* eex2021; %Stündlicher Einkommen in € aus Pturbine (MWh) * eex (€/MWh) 
% load income.mat

hold on
plot(time,income, 'blue')
%plot(time,Pturbine)
hold off

xlabel('time [h]')
ylabel('income [€]')
title('hourly income in a year')
%legend('income')

%% totaled income 

totalincome = sum(income); 
cumtotalincome = cumsum(income);


bar(time,cumtotalincome, 0.4, 'blue')

xlabel('time [h]')
ylabel('income [€]')
title('cumulated income in a year')
%legend('income')









