% % Parameters
t = 0:0.01:4;
A = 1; %amplitude
Fm = 1;
Fc = 20; %freq
beta = 8; %how much the wave is modulated

signal  = sin(2*pi*t*Fm);
carrier = A * cos(t*Fc);
FM =      A * cos(2*pi*t.*Fc + (beta/Fm*signal)); 
%takes away lower frequencies (use a high pass filter)
demodded = fmdemod(FM,20,100,8);



figure(1)
plot(t,signal, 'r')
title('Info Wave');
xlabel('Time');
ylabel('Voltage');  
xlim([0 t(length(t))]);
ylim([-1.5*A 1.5*A]); 

figure(2)
plot(t,carrier, 'b')
title('Carrier Wave');
xlabel('Time');
ylabel('Voltage');  
xlim([0 t(length(t))]);
ylim([-1.5*A 1.5*A]); 

figure(3)
hold on
plot(t,FM, 'k')
title('Frequency Modulated Wave');
xlabel('Time');
ylabel('Voltage'); 
plot(t,signal, 'r')
hold off
xlim([0 t(length(t))]);
ylim([-1.5*A 1.5*A]); 

figure (4)
plot(t,demodded,'g')
title('Demodulated Info Wave');
xlabel('Time');
ylabel('Voltage');  
xlim([0 t(length(t))]);
ylim([-1.5*A 1.5*A]); 