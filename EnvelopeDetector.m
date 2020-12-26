%% Envelope Detector sort of an AM Reciever

% Normal Wave
% x = 0:0.01:30;
% A = 2;
% yt = A * sin(x);


x = 0:1e-4:0.04; 
yt =(1+cos(2*pi*50*x)).*cos(2*pi*1000*x); % Given my Matworks Envelope Extraction Example Code




% Plot of Original Wave
figure(1)
plot(x,yt,'b')
title('Original Wave');
xlabel('Time');
ylabel('Voltage');  
xlim([0 x(length(x))]);
ylim([-1.5*A 1.5*A]); 

% Clamper Circuit
% yt = clamper(yt);

% Diode Supplied to Wave

yt_w_diode = diode(yt); 
figure(2)
plot(x,yt_w_diode,'r')
title('Diode + Wave');
xlabel('Time');
ylabel('Voltage');  
xlim([0 x(length(x))]);
ylim([0 1.5 * A]); 
% ylim([0 2.5 * A]); 

% Capacitor Added to Circuit
% cap_slope = -0.0003; % For Normal Wave
cap_slope = -0.03; % For Weird Wave

% In real life: "Tao = Resistance * Capacitance" and that gives discharge rate

yt_w_cap = capacitor(x,cap_slope,yt_w_diode); 
figure(3)
plot(x, yt_w_cap,'k');
title('Cap + Diode + Wave');
xlabel('Time');
ylabel('Voltage');  
xlim([0 x(length(x))]);
ylim([0 1.5 * A]); 


% Comparison of Waves Added Together
figure(4)
hold on
plot(x,yt,'b','LineWidth',2)
plot(x,yt_w_diode,'r','LineWidth',1)
plot(x, yt_w_cap,'k');
title('All Waves');
xlabel('Time');
ylabel('Voltage');  
xlim([0 x(length(x))]);
ylim([-1.5*A 1.5*A]); 
hold off