n=1024;
d=2;
ts=0.01;
fs=1/ts;
t=-((n/2)*ts):ts:(n/2-1)*ts;
%decimation
x=sinc(t).^2; %massage signal
%plot x
figure(1);
subplot(2,1,1);
plot(t,x);
title('MASSEGE SIGNAL');
xlabel('Time(s)');
ylabel('x(t)');
xlim([-10 10]);
%downsampling
y=downsamp(x,2);
%plot y
t1=-((n/(2*d))*ts):ts:((n-1)/(2*d))*ts;
subplot(2,1,2);
plot(t1,y);
title('DOWNSAMPLING WITHOUT LPF');
xlabel('Time(s)');
ylabel('y(t1)');
xlim([-10 10]); 

%spectrum of x
f=-fs:2*fs/n:fs-2*fs/n;
x_f= fftshift(fft(x));
%filtering by LPF
v= filter_lpf(n,ts,x_f);
v_t= ifft(v);
%downsampling
y1=downsamp(v,2);
f1=-fs:d*2*fs/n:fs-2*d*fs/n;
y_f=fftshift(fft(y));
figure(2);
subplot(3,1,1);
plot(f,abs(x_f)); %plot x spectrum
title('x(t) in frequency domain');
xlabel('frequency(f)');
ylabel('X(f)');
xlim([-10,10]);
subplot(3,1,2)
plot(f,abs(v)); %plot v spectrum
title('signal after passing through LPF');
xlabel('frequency(f)');
ylabel('V(f)');
xlim([-10,10]);
subplot(3,1,3)
plot(f1,abs(y1)); %plot y spectrum
title('AFTER DECIMATION BY FACTOR OF 2');
xlabel('frequency(f)');
ylabel('Y(f)');

%Varying LPF cut-off frequency
ts=[0.0025,0.005,0.01,0.02,0.04];
v1= filter_lpf(n,ts(1,1),x_f);
v2= filter_lpf(n,ts(1,2),x_f);
v3= filter_lpf(n,ts(1,3),x_f);
v4= filter_lpf(n,ts(1,4),x_f);
v5= filter_lpf(n,ts(1,5),x_f);
%decimation
y_1= downsamp(v1,2);
y_2= downsamp(v2,2);
y_3= downsamp(v3,2);
y_4= downsamp(v4,2);
y_5= downsamp(v5,2);
figure(3);
subplot(3,1,1);
plot(f,abs(x_f)); %plot x spectrum
title('x(t) in frequency domain');
xlabel('frequency(f)');
ylabel('X(f)');
xlim([-10,10]);
subplot(3,1,2);
plot(f,abs(v1),f,abs(v2),f,abs(v3),f,abs(v4),f,abs(v5)); %plot v spectrum
title('signal after passing through LPF of different cutoff frequency');
xlabel('frequency(f)');
ylabel('V(f)');
legend('freq=12.5Hz','freq=25Hz','freq=50Hz','freq=100Hz','freq=200Hz');
xlim([-10,10]);
subplot(3,1,3);

%Varying LPF cut-off frequency
ts=[0.0025,0.005,0.01,0.02,0.04];
v1= filter_lpf(n,ts(1,1),x_f);
v2= filter_lpf(n,ts(1,2),x_f);
v3= filter_lpf(n,ts(1,3),x_f);
v4= filter_lpf(n,ts(1,4),x_f);
v5= filter_lpf(n,ts(1,5),x_f);
%decimation
y_1= downsamp(v1,2);
y_2= downsamp(v2,2);
y_3= downsamp(v3,2);
y_4= downsamp(v4,2);
y_5= downsamp(v5,2);
figure(3);
subplot(3,1,1);
plot(f,abs(x_f)); %plot x spectrum
title('x(t) in frequency domain');
xlabel('frequency(f)');
ylabel('X(f)');
xlim([-10,10]);
subplot(3,1,2);
plot(f,abs(v1),f,abs(v2),f,abs(v3),f,abs(v4),f,abs(v5)); %plot v spectrum
title('signal after passing through LPF of different cutoff frequency');
xlabel('frequency(f)');
ylabel('V(f)');
legend('freq=12.5Hz','freq=25Hz','freq=50Hz','freq=100Hz','freq=200Hz');
xlim([-10,10]);
subplot(3,1,3);
%Varying LPF cut-off frequency
ts=[0.0025,0.005,0.01,0.02,0.04];
v1= filter_lpf(n,ts(1,1),x_f);
v2= filter_lpf(n,ts(1,2),x_f);
v3= filter_lpf(n,ts(1,3),x_f);
v4= filter_lpf(n,ts(1,4),x_f);
v5= filter_lpf(n,ts(1,5),x_f);
%decimation
y_1= downsamp(v1,2);
y_2= downsamp(v2,2);
y_3= downsamp(v3,2);
y_4= downsamp(v4,2);
y_5= downsamp(v5,2);
figure(3);
subplot(3,1,1);
plot(f,abs(x_f)); %plot x spectrum
title('x(t) in frequency domain');
xlabel('frequency(f)');
ylabel('X(f)');
xlim([-10,10]);
subplot(3,1,2);
plot(f,abs(v1),f,abs(v2),f,abs(v3),f,abs(v4),f,abs(v5)); %plot v spectrum
title('signal after passing through LPF of different cutoff frequency');
xlabel('frequency(f)');
ylabel('V(f)');
legend('freq=12.5Hz','freq=25Hz','freq=50Hz','freq=100Hz','freq=200Hz');
xlim([-10,10]);
subplot(3,1,3);
plot(f1,abs(y_1),f1,abs(y_2),f1,abs(y_3),f1,abs(y_4),f1,abs(y_5)); %plot v
spectrum
xlabel('frequency(f)');
ylabel('Y(f)');
legend('freq=12.5Hz','freq=25Hz','freq=50Hz','freq=100Hz','freq=200Hz');
xlim([-10,10]);
function v_lpf= filter_lpf(n,t_n,x_f)
%lpf
ts=t_n;
b= fir1 (n-1,ts/2);
f_lpf=fftshift(fft(b));
%filtering
v_lpf=x_f.*f_lpf;
end
function y_new= downsamp(x,d)
y_new=[];
for i=1:d:length(x)
y_new=[y_new x(i)];
end
end