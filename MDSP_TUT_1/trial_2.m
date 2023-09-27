clc;
clear all;
close all;

[y,Fs]=audioread('MDSP_TUT_1\Another Brick In The Wall Pt.mp3');

%N=[123,256,512,1024,2048,4096,16384];
%N=128;
y1=y(:,1);
%x=zeros(128,128);
%tic;
i=1;
time_dft_fft=zeros(6,3);
x=zeros(7,1);
for j=7:1:12
    N=2^j
    %x=zeros(j,2^j);
%    tic;
%     for i=1:j
%     for n=1:(2^j)
%         for k=1:(2^j)
%             x(i,1)=x(i,1)+y1(n,1)*exp(-i*2*pi*(k-1)*(n-1)/N);
%         end
%     end
% end
    tic;
    x_dft=y(1:N)*dftmtx(N);
    toc;
    time_dft=toc;
    
    %y2=y(2^j,2);
    tic;
    %x_fft=y(1:N)*fft(N);
    x_fft=fft(y(1:N));
    toc;
    time_fft=toc;

    time_dft_fft(i,1)=N;
    time_dft_fft(i,2)=time_dft;
    time_dft_fft(i,3)=time_fft;
    i=i+1;

    %time_dft_fft
end
%time_dft=toc;

%y2=y(128,2);
%tic;
%fft(y2);
%time_fft=toc;

%dft_fft=xlsread('MDSP_TUT_1\dft_fft_reading.xlsx');
%plot(dft_fft(:,1));
time_dft_fft;

subplot(3,1,1);
plot(time_dft_fft(:,1),time_dft_fft(:,2));
xlabel("Segment Length");
ylabel("DFT Computation Time");

subplot(3,1,2);
plot(time_dft_fft(:,1),time_dft_fft(:,3));
xlabel("Segment Length");
ylabel("FFT Computation Time");

subplot(3,1,3);
plot(time_dft_fft(:,1),time_dft_fft(:,2)-time_dft_fft(:,3));
xlabel("Segment Length");
ylabel("DFT-FFT Computation Time Comparison");
