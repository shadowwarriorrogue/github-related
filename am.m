%*************** AM Modulation *****************
clc;
close all;
clear all;
%*********** Define Modulation Factor*********
 m=0.5     % for 50% Modulation
%************modulating signal generation********* 
 Am=1;       % Amplitude of modulating signal
 fa=.4;        % Frequency of modulating signal
 Ta=1/fa;   % Time period of modulating signal
fs=160;      % Sampling frequency 
t=0:1/fs:10; % Total time for simulation
ym=Am*m*cos(2*pi*fa*t); % Equation of modulating signal
figure(1)
subplot(4,1,1); 
plot(t,ym), grid on;% Graphical representation of Modulating signal
title ( '  Modulating Signal   ');
xlabel ( ' time(sec) '); ylabel (' Amplitude(volt)   ');
%***********carrier signal generation************* 
 Ac=Am;       % Amplitude of carrier signal 
 fc=20;          % Frequency of carrier signal
 Tc=1/fc;       % Time period of carrier signal
 yc=Ac*cos(2*pi*fc*t);   % Equation of carrier signal
 subplot(4,1,2);
 plot(t,yc), grid on;        % Graphical representation of carrier signal
 title ( '  Carrier Signal   ');
xlabel ( ' time(sec) '); ylabel (' Amplitude(volt)   ');
%*********** AM Modulation******** 
 y=Ac*(1+m*cos(2*pi*fa*t)).*cos(2*pi*fc*t); %modulated signal
subplot(4,1,3);
plot(t,y);% Graphical representation of AM signal
title ( '  Amplitude Modulated signal  ');
xlabel ( ' time(sec) ');
ylabel (' Amplitude(volt)   ');
grid on;
%**************** Demodulation*************** 
Vc(1) = 0;                              % initial capacitor voltage
for i = 2:length(y)
    if y(i) > Vc(i-1)                   % diode on (charging)
        Vc(i) = y(i);
    else                                % diode off (discharging)
        Vc(i) = Vc(i-1) - 0.023*Vc(i-1);
    end
end
%*************** Low Pass RC Filter********
h = fir1(100, 0.0125, 'low');            % 1 kHz cut-off frequency
foutputc = filter(h,1,Vc);
subplot(4,1,4);
plot(t, foutputc);
title ( '  Amplitude Modulated signal  ');
xlabel ( ' time(sec) ');
ylabel (' Amplitude(volt)   ');
grid on;
%*****************end of program***************** 
