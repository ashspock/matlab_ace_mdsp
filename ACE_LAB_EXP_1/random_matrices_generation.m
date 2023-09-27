% Random Matrices Generation

clc;
clear all;
close all;

%1
R1=rand(3,4);
%2
R2=5+(10-5).*rand(3,4);
%3
R3=randi([-5 5],3,4);
%4
R4=randn(1,4);
%5
R5=2*randn(1,4)+10;
%6.1
r1=raylrnd(10,2) ;
%6.2
r2=exprnd(10,2);