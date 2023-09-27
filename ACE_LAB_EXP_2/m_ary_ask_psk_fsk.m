clc;
clear all;

%Initialization
Ts=0.001;
fc=5000;
t=0:Ts/1000:32*Ts;

%Am=[1,-1;3,-3;5,-5;7,-7]
Am=[1,-1];

%Bit sequence
R1=rand(1,32);
for i=1:32
    if(R1(i)<0.5)
        R1(i)=0;
    else
        R1(i)=1;
    end;
end;
R1;

for i=1:32
    if R1(i)==0
        R1(i)=-1;
    else
        continue;
    end
end 
R1;
%plot(t,cos(2*pi*fc*t));
%plot(t,y)

plot(t,cos(2*pi*fc*t))





