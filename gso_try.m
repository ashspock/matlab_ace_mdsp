% Grahm-Schmidt Orthogonalization-2
% Name: Sachin Chauhan
% Roll# 23SP06007
% Course: Advanced Communication Laboratory
% ////////////////////////////////////////////////////
clc;
clear global;
close all; 
% //////////////////////////////////////////////

syms x;
t_low=0;
t_high=3;

s1=2*(heaviside(x)-heaviside(x-1));
s2=4*(-heaviside(x)+heaviside(x-2));
s3=3*(heaviside(x)-heaviside(x-3));
% s4=(-1)*s1;
% phi=zeros(1,length(s3));
phi=[];
% s=[s1,s2,s3,s4];
s=[s1,s2,s3];
% f_tilda;

for i=1:length(s)
    f_tilda=s(i);
    if i>1
        for j=1:i-1
            f_tilda=f_tilda-innerProduct(phi(j),f_tilda,t_low,t_high)*phi(j);
        end
    end
    phi=[phi f_tilda/(calc_norm(f_tilda,t_low,t_high))];
end

figure(1);
for i=1:length(s)
    subplot(2,2,i);
    fplot(s(i),'r');
    xlim([-5 5]);
    ylim([-5 5]);
    grid on;
    xlabel('Time');
    ylabel('Amplitude');
    title(sprintf('s%d(t)',i));

end

figure(2);
for i=1:length(phi)
    hold on;
    subplot(2,2,i);
    % fplot(f_tilda_arr(i));
    fplot(phi(i),'r');
    grid on;
    xlim([-5 5]);
    ylim([-5 5]);
    xlabel('Time(sec)');
    ylabel('Amplitude');
    title(sprintf('Phi-%d',i));
end

% Generate constellation symbols (sample points in the complex plane)
symbol_points = zeros(1, length(phi));
for i = 1:length(phi)
    symbol_points(i) = double(subs(phi(i), x, t_high));  % Evaluate at t_high
end

% Plot the constellation diagram
figure(3);
scatter(real(symbol_points), imag(symbol_points), 'o', 'filled');
xlim([-5 5]);
ylim([-5 5]);
grid on;
xlabel('Real Part');
ylabel('Imaginary Part');
title('Constellation Diagram');

% innerProduct(f1,f2,t_low,t_high)
% calc_norm(s3,t_low,t_high);

function norm=calc_norm(s,t_low,t_high)
    norm=sqrt(int(s*s,t_low,t_high));
end

function inner_prod=innerProduct(f1,f2,t_low,t_high)
    inner_prod=int(f1*f2,t_low,t_high);
end
