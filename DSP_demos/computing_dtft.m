% Program demo_1_1
% Computation of Discrete-Time Fourier Transform
% signal {x[n]}

clc;
clear all;
close all;

x = [0.3,0.2,0.1,0.15 ,0.18,0.20,0.5,0.6,0.4,0.3,0.2,0.1,0.15 ]; % Test signal
L = length(x);
N = 256 ;
[X,w] = freqz(x,1,N); % Computation of the signal spectrum
mag = abs(X); % Magnitude spectrum
phase = angle(X); % Phase spectrum
figure(1)
subplot(3,1,1), stem(0:L-1,x),
legend('Signal {x[n]}'), xlabel('Time index n'), ylabel('x[n]')
subplot(3,1,2), plot(w/pi,mag),
legend('Magnitude Spectrum'), xlabel('Normalized frequency \omega/\pi'), ylabel('|X(e^{j\omega})|')
subplot(3,1,3), plot(w/pi,unwrap(phase)),
legend('Phase Spectrum'), xlabel('Normalized frequency \omega/\pi') , ylabel('\phi(\omega)')