clc;
close all;
clear all;
x=ones(1,1000);
% plot(x);
for i=length(x)/2:length(x)
    x(i)=0;
end
plot(x);
