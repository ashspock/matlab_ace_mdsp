% Polyphase implementation of Decimator and Interpolator
% Name: Sachin Chauhan
% Roll# 23SP06007
% Course: Modern Digital Signal Processing

% 1. Perform polyphase implementation of decimator and interpolator for factor of 2 and 3.
% 2. Choose a low pass filter of length 30.

% ////////////////////////////////////////////////////
clc;
clear;
close;
% ///////////////////////////////////////////////////

% STEP ?
% Lowpass FIR filter design
h = firpm(59,[0,2*400/10000,1000/5000,1],[1,1,0,0]); % Computation of filter coefficients
[H,F1] = freqz(h,1,1024,10000); % Computation of filter frequency response
figure (1)
subplot(4,1,1), plot(F1,20*log10(abs(H))), legend(4Filter magnitude response,), ylabel(1Gain, dB,)
axis([0,1 000,-80,?])