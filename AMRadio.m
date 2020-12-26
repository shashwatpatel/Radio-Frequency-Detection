%% Transmitter

% Parameters
t = 0:0.01:96;
A = 2;
F = 50;

% Waves
signal  = sin(t/F * pi);
carrier = cos(t * pi); 
envelope = (A + signal) .* carrier;


% Waves Plotted
figure(1)
plot(t,signal, 'r')
title('Info Wave');
xlabel('Time');
ylabel('Voltage');  



figure(2)
plot(t,envelope, 'b')
title('Amplitude Modulated Wave');
xlabel('Time');
ylabel('Voltage');  
xlim([0 t(length(t))]);
ylim([-1.5*A 1.5*A]); 

% Overlap of Signals
figure(3)
hold on
plot(t,signal,'r')

plot(t,envelope,'b')
title('Signals Overlapped Wave');
xlabel('Time');
ylabel('Voltage');  
xlim([0 t(length(t))]);
ylim([-1.5*A 1.5*A]); 
hold off


% Separate Wave
p_envelope = diode(envelope);


% Run Through Capacitor
cap_slope = -0.003;
cap_p_envelope = capacitor(t,cap_slope,p_envelope);


% Plot Outputs
figure(4)
plot(t, p_envelope, 'b') % Diode
title('Diode + Envelope');
xlabel('Time');
ylabel('Voltage');  

figure(5)
hold on
plot(t, cap_p_envelope, 'g') % Cap
title('Capacitor + Diode + Envelope w/ Orig');
xlabel('Time');
ylabel('Voltage');  

plot(t,signal, 'r')
hold off

r=77;