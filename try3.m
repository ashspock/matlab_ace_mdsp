 clc;
clear all;
close all;

% x=[1,2,3,4,5,6,7,8];
%upsample(x,2)
I=5;
D=3;
N=512;

t=-pi:(2*pi)/N:pi;
sig=sinc(t).^2;
figure(1);
plot(t,sig);

figure(2);
fft_sig=fastFourierTransformFunc(sig,N);
plot(abs(fft_sig));
% axis([-10 10 0 max(fft_sig)]);

x=sig;
% upSampleFunc(x,I);
% downSampleFunc(x,D);
figure(3);
plot(abs(fastFourierTransformFunc(upSampleFunc(x,I),N)));

function [y]=upSampleFunc(x,I)
    y=[];
    for i=1:length(x)
        y=[y x(i)];
        for j=1:I-1
            y=[y 0];
        end
    end
end

function [z]=downSampleFunc(x,D)
    z=[];
    for i=1:D:length(x)
        z=[z x(i)];
    end
end

function [Xw]=fastFourierTransformFunc(sig,N)
    Xw=((fft(sig,N)));
    % Xw=sig(1:N)*dftmtx(N);
end


