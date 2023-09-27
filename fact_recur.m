clc;
clear all;
close all;
% 
% f=1;

fact_func(5)

function f=fact_func(n)
    if n~=0
        f=n*fact_func(n-1);
    else
        f=1;
    end
end

