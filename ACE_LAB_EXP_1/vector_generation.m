%vector_generation

clc;
clear all;
close all;

%1
v1=[1,2,3,4,10];
v2=-v1;

%2
v3=[v1,v2];

%3.1
v4=zeros(20,1);
%3.2
v5=ones(20,1);
%3.3
size(v4);
size(v5);

%4
v6=5*ones(20,1);

%5
v7=v1+v2;

%6
v7+5;

%7
%disp(1:2:10)
v8=[1:10];
v9=[25:-5:-20];

%8
%disp(v1(3))

%9
v10=[v1(1:2) v1(4:end)];

%10
v11=v1(1:2:5);

%11
v1t=transpose(v1);

%12
v1*v1t;
v1t*v1;

%13
v1.*v1;
v1.^2;
v1./v2;

%14
s=sum(v1);

%15
s/length(v1);

%16
v1==3;

%17
%disp(v9>=15);

%18.1
a=[v9(v9>15)];
%disp(a)
%disp(sum(a))

%18.2
%disp(sum(v9(v9>15)))




