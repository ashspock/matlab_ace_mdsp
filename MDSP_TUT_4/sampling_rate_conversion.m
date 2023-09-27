% MDSP Tutorial #4
% Sampling Rate Conversion
% Name: Sachin Chauhan
% Roll# 23SP06007
%/////////////////////////////////////////////////////////////////////

% 1.  Create a signal similar to last time.
% 2.  Perform I/D sampling rate conversion with 5/3 and 3/5.
% 3.  Plot all the signals in time and frequency domain.
% 4.  Comment on the results and compare with theory.

% ////////////////////////////////////////////////////////////////////

% % Creating the input signal in time domain
% N=1024; % Segment Length
% %t=-N/2:0.1:N/2;
% % t=linspace(-pi,pi,N);
% t=-pi:(2*pi)/N:pi;
% filter_order=30;
% D=2;%   Decimation Factor
% 
% inp_sig=sinc(t).^2;%    Input function with Triangular spectrum
% %   Plotting of Input signal
% figure(1);
% subplot(3,1,1);
% plot(t,inp_sig);
% grid on;
% title('Input Signal x(n)');
% 
% %given up/down sampling rates
% up_sample_factor=5;
% down_sample_factor=3;


% Sampling rate conversion by L/M = 3/2
clc;
close all, 
clear all;
Fx = 50; Tx=1/Fx; % Original sampling frequency in Hz
tx = 0:Tx:1; % Time vector tx
x = 0.9*sin(2*pi*tx); % Input sequence
y = resample(x,3,2); % Re-sampling
ty = (0:(length(y)-1))*2*Tx/3; % New time vector ty
figure (1)
subplot(2,1,1), stem(tx,x,'*')
hold on
stem(ty,y,'-')
legend('original','resampled'),xlabel('Time'), ylabel('amplitude'), axis([0,1,-1,1])

