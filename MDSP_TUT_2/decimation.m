% MDSP Tutorial #2
% Implementation of Decimation
% Name: Sachin Chauhan
% Roll# 23SP06007
%/////////////////////////////////////////////////////////////////////

%   1.  Create a signal of length 1024, with triangular spectrum sinc(t)^2
%   2.  Perform downsampling bya factor of 2, Plot x,y
%   3.  For D=2, design a low pass filter and perform decimation without aliasing
%   4.  Plot all the above three signals in frequency domain
%   5.  Vary the Low pass filter cut-off frequency to observe the aliasing effect

% Creating the input signal in time domain
N=1024; % Segment Length
%t=-N/2:0.1:N/2;
t=linspace(-10,10,N);
filter_order=30;
D=2;%   Decimation Factor

inp_sig=sinc(t).^2;%    Input function with Triangular spectrum
%   Plotting of Input signal
figure(1);
subplot(3,1,1);
stem(t,inp_sig);
grid on;
title('Input Signal x(n)');

% Taking Fourier Transform of Input Signal
n=-N/(2*D):1:(N/(2*D))-1;%  modifying n
Xw=(fft(inp_sig,N)); %Triangular Spectrum
Xw_mod=fftshift(Xw);%   Shifting center frequency to zero frequency in spectrum

% Calculate the sampling frequency from the time vector
Fs_original = 1 / (t(2) - t(1));

% Calculate the frequency vector
f = (-N/2:N/2-1) * (Fs_original / N);
%Plotting frequency spectrum
subplot(3,1,2);
plot(f, abs(Xw_mod));
grid on;
% xlabel('Frequency');
% ylabel('Magnitude');
title('Triangular Spectrum X(w)');

%2 Perform downsampling by factor of 2, plot x,v,y

y_decimation=decimate(inp_sig,D,filter_order,"fir");
grid on;
subplot(3,1,3);
plot(n,y_decimation);
title('Downsampling by 2 - y(n)');
xlim([-N/2 N/2]);

fs=1000;
fc=pi/D;
lpf_order=100;
fc_normalized=fc/(fs*2);
low_pass_filter=fir1(lpf_order,fc_normalized,"low");
t_filter=linspace(-(pi/D),(pi/D),length(low_pass_filter));

figure(2);
grid on;
subplot(4,1,1);
plot(t_filter,low_pass_filter);
title('H(w)');
v=filter(low_pass_filter,1,abs(y_decimation));
subplot(4,1,2);
plot(abs(v));
title('V(w)');

%   Plotting filter output
grid on;
subplot(4,1,3);
stem(abs(ifftshift(ifft(v,N))));
title('v(n)');

y2_decimated=decimate(v,D);
grid on;
subplot(4,1,4);
stem(y2_decimated);
title('y(n)');
axis([-length(y2_decimated)/2 length(y2_decimated)/2 0 max(y2_decimated)]);

