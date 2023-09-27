% % Name: Sachin Chauhan
% Roll# 23SP06007
% Course: Advanced Communication Laboratory

% Q3-Generate a sequence of 4 bits randomly(equiprobable). Use
% BPSK,QPSK,BFSK to map these bits to signal; using GSO, plot the
% constellation diagram for the bit sequence.

% -----------------------------------------------------------------
clc;
clear all;
close all;
%------------------------------------------------------------------
syms t;
x=[];y=[];
fc=5000;%   carrier frequency
Ts=0.001;%      
A=1;%   carrier amplitude
M1=2;
M2=4;

% Random 4-bit sequence generation
bit_seq=[];
for i=1:4
    if rand < 0.5
         bit_seq=[bit_seq 0];  
    else
         bit_seq=[bit_seq 1];
    end
end

%BPSK
for i=1:M1
    x=[x ((A*sqrt(Ts/2)*cos(2*pi*(i-1)/M1)))];
    y=[y ((A*sqrt(Ts/2))*round(sin(2*pi*(i-1)/M1)))];
end
x=[];y=[];
%QPSK
for i=1:M2
    x=[x ((A*sqrt(Ts/2)*(cos(2*pi*(i-1)/M2))))];
    y=[y ((A*sqrt(Ts/2))*round(sin(2*pi*(i-1)/M2)))];
end
x=[];y=[];
%BFSK
f_high=fc+(1/(2*Ts));
f_low=fc-(1/(2*Ts));

s1=cos(2*pi*f_high*t);
s2=cos(2*pi*f_low*t);

x= zeros(1:2);
y=zeros(1:2);

x(1)=calc_norm(s1,0,Ts);
y(2)=calc_norm(s1,0,Ts);

%Plotting Constellation Diagram
figure(1);
scatter(x,y,'r','filled');
xlabel('Phi1');
ylabel('Phi2');
title('Constellation Plot-BPSK');
grid on;

figure(2);
scatter(x,y,'r','filled');
xlabel('Phi1');
ylabel('Phi2');
title('Constellation Plot-QPSK');
grid on;

figure(3);
scatter(x,y,'r','filled');
xlabel('Phi1');
ylabel('Phi2');
title('Constellation Plot-BFSK');
grid on;

%user defined function for calculating norm
function norm=calc_norm(s,t_low,t_high)
    norm=sqrt(int(s*s,t_low,t_high));
end


