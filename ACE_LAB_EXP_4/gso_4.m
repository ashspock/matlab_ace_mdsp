% Grahm-Schmidt Orthogonalization-4
% Name: Sachin Chauhan
% Roll# 23SP06007
% Course: Advanced Communication Laboratory
%---------------------------------------------------
clc;
clear global;
close all; 
%---------------------------------------------------

u1=[3,-2,-1]%inital basis vectors  
u2=[-2,-1,3]%inital basis vectors 
u=[u1;u2];   
phi=[];%new basis vectors
phi(1,:)=u1/calc_norm(u1,u1); 
f_tilda=u2-(innerProduct(phi(1,:),u2).*phi(1,:));
phi(2,:)=f_tilda/calc_norm(f_tilda,f_tilda);

w1=phi(1,:)%basis vector 1
w2=phi(2,:)%basis vector 2

%user defined function for calculating norm
function norm=calc_norm(s1,s2)
    % v=s1.*s2
    norm=sqrt(innerProduct(s1,s2)); 
end
%user defined function for calculating innerproduct of two signals
function inner_prod=innerProduct(v,u)
    inner_prod=2*((v(1)*u(1))+(v(2)*u(2))+(v(3)*u(3))) + (v(1)*u(2))+(v(2)*u(1))+(v(2)*u(3)) + (v(3)*u(2))+(v(3)*u(1))+(v(1)*u(3));
    % inner_prod
end
