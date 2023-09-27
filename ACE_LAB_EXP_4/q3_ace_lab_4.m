% Q3

% ////////////////////////////////////////////////////
clc;
clear all;
close all;
% ///////////////////////////////////////////////////

% Random 4-bit sequence generation
bit_seq=[];
for i=1:4
    if rand < 0.5
         bit_seq=[bit_seq 0];
    else
         bit_seq=[bit_seq 1];
    end
end

% bit_seq

fc=1000000;
Ts=0.001;

