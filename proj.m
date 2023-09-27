clc;
clear all;
close all;

syms f1;
syms f2;
low_lim=0;
up_lim=1;


projection_func(f1,f2,low_lim,up_lim)

function c=projection_func(f1,f2,low_lim,up_lim)
    c=int(f1.*f2);%,low_lim,up_lim);
end

function phi=calc_phi_func()
    
end

