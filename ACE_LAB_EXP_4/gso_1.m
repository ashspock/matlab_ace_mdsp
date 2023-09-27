% Grahm-Schmidt Orthogonalization-1
% Name: Sachin Chauhan
% Roll# 23SP06007
% Course: Advanced Communication Laboratory
% ////////////////////////////////////////////////////
clc;
clear all;
close all; 
% //////////////////////////////////////////////

syms x;
%defining time limits
t_low=0;
t_high=3;
%defining signals
s1=heaviside(x)-heaviside(x-2);
s2=heaviside(x)-2*heaviside(x-1)+heaviside(x-2);
s3=(-1)*s2;
s4=(-1)*s1;
phi=[];%basis fucntion array
%calculating basis function
s=[s1,s2,s3,s4];
syms f_tilda;
for i=1:length(s)
    f_tilda=s(i);
    if i>1
        for j=1:i-1%calculating f_tilda
            f_tilda=f_tilda-innerProduct(phi(j),f_tilda,t_low,t_high)*phi(j);        
        end
    end
    % if(isnan(f_tilda)==1)
        phi=[phi f_tilda/(calc_norm(f_tilda,t_low,t_high))];
    % end
end
%storing coefficients in an array for plotting the constellation diagram
for i=1:length(s)
    for j=1:length(phi)
        if(isnan(phi(j))==0)
            points(i,j)=innerProduct(phi(j),s(i),t_low,t_high); 
        end
    end
end
% points
%plotting signals
figure(1);
for i=1:length(s)
    subplot(2,2,i);
    fplot(s(i),'r',LineWidth=3);
    xlim([-3 3]);
    ylim([-2 2]);
    grid on;
    xlabel('Time');
    ylabel('Amplitude');
    title(sprintf('s%d(t)',i));

end
%plotting the basis functions
figure(2);
for i=1:length(phi)
    hold on;
    if(isnan(phi(i))==0)
        subplot(2,2,i);
        fplot(phi(i),'r',LineWidth=3);
        grid on;
        xlim([-3 3]);
        ylim([-2 2]);
        xlabel('Time');
        ylabel('Amplitude');
        title(sprintf('Phi-%d',i));
    end
end
%plotting the constellation diagram
[row col]=size(points);
x=points(:,1);
y=points(:,2);
figure(3);
scatter(x,y,'r','filled');
xlabel('Phi1');
ylabel('Phi2');
title('Constellation Plot');
grid on;

%user defined function for calculating norm
function norm=calc_norm(s,t_low,t_high)
    norm=sqrt(int(s*s,t_low,t_high));
end
%user defined function for calculating innerproduct of two signals
function inner_prod=innerProduct(f1,f2,t_low,t_high)
    inner_prod=int(f1*f2,t_low,t_high);
end
