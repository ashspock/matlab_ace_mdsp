%   EXP:5.4
%   MONTE CARLO SIMULATION
%   s=+A,-A,+3A,-3A, p1=p2=p3=p4=0.25, Real Gaussian Noise
%-------------------------------------------------------------

clc;clear all;
close all;

%-------------------------------------------------------------

%   Intialisation
N_exp=10^6; % # of times experiment is performed
A=1;% assumed
snr_av_db=-10:1:10;%    SNR range
nsnr=length(snr_av_db);%    
Pe_comp=zeros(1,nsnr);% for storing Pe by maths formulation
Pe_sim=zeros(1,nsnr);%  for storing Pe by simulation
Pe_comp_upper_bound=zeros(1,nsnr);

% Pe by computation
for i_snr=1:nsnr
    snr=10^(0.1*snr_av_db(i_snr));
    Pe_comp(i_snr)=(3/2)*qfunc(sqrt(snr));
end

% Upper Bound of Pe by computation
for i_snr=1:nsnr
    snr=10^(0.1*snr_av_db(i_snr));
    Pe_comp_upper_bound(i_snr)=(1/2)*(3*qfunc(sqrt(snr))+2*qfunc(2*sqrt(snr))+qfunc(3*sqrt(snr)));
end


% Pe by simulation
for i_snr=1:nsnr
    snr=10^(0.1*snr_av_db(i_snr));
    for i_exp=1:N_exp
        if (rand<0.25)
            s=-3*A;
        elseif (0.25<rand)&&(rand<0.50) 
            s=-A;
        elseif (0.50<rand)&&(rand<0.75)
            s=A;
        elseif (0.75<rand)
            s=3*A;
        end

        n=(sqrt(1/snr))*randn(1);
        r=s+n;
        %   Optimal Rxr Structure
        if (r+(3*A))^2<(r+A)^2 && (r+(3*A))^2<(r-A)^2 && (r+(3*A))^2<(r-(3*A))^2
            s_hat=-3*A;
        elseif (r+(A))^2<(r+(3*A))^2 && (r+(A))^2<(r-A)^2 && (r+(A))^2<(r-(3*A))^2
            s_hat=-A;
        elseif (r-A)^2<(r+(3*A))^2 && (r-A)^2<(r+A)^2 && (r-A)^2<(r-(3*A))^2
            s_hat=A;
        elseif (r-(3*A))^2<(r+(3*A))^2 && (r-(3*A))^2<(r+A)^2 && (r-(3*A))^2<(r-A)^2  
            s_hat=3*A;
        end
        % Compute Pe_sim
        if s_hat==s
            Pe_sim(i_snr)=Pe_sim(i_snr)+0;
        else
            Pe_sim(i_snr)=Pe_sim(i_snr)+1;
        end
    end
    Pe_sim(i_snr)=Pe_sim(i_snr)/N_exp;
end

% Plotting
semilogy(snr_av_db,Pe_comp_upper_bound,'--r*');hold on;
semilogy(snr_av_db,Pe_comp,'b');hold on;
semilogy(snr_av_db,Pe_sim,'--b*');
grid on;
ylabel('P_e');xlabel('SNR_a_v_g(dB)');
legend ('Pe_U_p_p_e_r_ _B_o_u_n_d','P_ecomputed','P_esimulated');
% legend('P_ecomputed','P_esimulated');
