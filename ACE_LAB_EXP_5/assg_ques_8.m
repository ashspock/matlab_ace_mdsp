%   EXP:Assign.# 8
%   MONTE CARLO SIMULATION
%   s=-3A,-A,A,3A, Non-Equiprobable, Real Gaussian Noise
%-------------------------------------------------------------

clc;clear all;
close all;

%-------------------------------------------------------------
%   Intialisation
N_exp=10^6; % # of times experiment is performed
A=1;% assumed
snr_av_db=-10:1:10;%    SNR range
nsnr=length(snr_av_db);%

p1=0.1;% P(-3A)=0.2
p2=0.2;% P(-A)
p3=0.3;% P(A)
p4=1-(p1+p2+p3);% P(3A)
%q=1-p;
Pe_comp=zeros(1,nsnr);% for storing Pe by maths formulation
Pe_sim=zeros(1,nsnr);%  for storing Pe by simulation
Pe_union_bound=zeros(1,nsnr);

% Pe by computation
for i_snr=1:nsnr
    snr=10^(0.1*snr_av_db(i_snr));
    Pe_comp(i_snr)=p1*qfunc(sqrt(snr))+2*p2*qfunc(sqrt(snr))+2*p3*qfunc(sqrt(snr))+p4*qfunc(sqrt(snr));
end

% Union Bound of Pe by computation
for i_snr=1:nsnr
    snr=10^(0.1*snr_av_db(i_snr));
    Pe_union_bound(i_snr)=(qfunc(sqrt(snr))*(p1+2*p2+2*p3+p4))...
                            +(qfunc(2*sqrt(snr))*(p1+p2+p3+p4))...
                        +(qfunc(3*sqrt(snr))*(p1+p4));
end

% Pe by simulation
for i_snr=1:nsnr
    snr=10^(0.1*snr_av_db(i_snr));
    for i_exp=1:N_exp
        if rand>0 && rand<=p1
            s=-3*A;
        elseif rand>p1 && rand<=p2
            s=-A;
        elseif rand>p2 && rand<=p3
            s=A;
        elseif rand>p3 && rand<1
            s=3*A;
        end

        n=(sqrt(1/snr))*randn(1);
        r=s+n;

        %   Optimal Rxr Structure
        if r<(-2*A)
            s_hat=-3*A;
        elseif r>(-2*A) && (r<0)
            s_hat=-A;
        elseif r>0 && r<(2*A)
            s_hat=A;
        elseif r>(2*A)
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
semilogy(snr_av_db,Pe_union_bound,'--r*');hold on;
semilogy(snr_av_db,Pe_comp,'b');hold on;
semilogy(snr_av_db,Pe_sim,'--b*');
grid on;
ylabel('P_e');xlabel('SNR_a_v_g(dB)');
legend ('Pe_U_n_i_o_n_ _B_o_u_n_d','P_ecomputed','P_esimulated');
% legend('P_ecomputed','P_esimulated');

