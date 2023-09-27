%   EXP:5.
%   MONTE CARLO SIMULATION
%   Equiprobable symbol, Real Gaussian Noise
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

% Pe by computation
for i_snr=1:nsnr
    snr=10^(0.1*snr_av_db(i_snr));
    Pe_comp(i_snr)=qfunc(sqrt(snr));
end


% Pe by simulation
for i_snr=1:nsnr
    snr=10^(0.1*snr_av_db(i_snr));
    for i_exp=1:N_exp
        if rand>0.5
            s=A;
        else
            s=-A;
        end

        n=(sqrt(1/snr))*randn(1);
        r=s+n;
        %   Optimal Rxr Structure
        if r>0
            s_hat=A;
        else
            s_hat=-A;
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
semilogy(snr_av_db,Pe_comp);hold on;
semilogy(snr_av_db,Pe_sim,'--b*');
grid on;
ylabel('P_e');xlabel('SNR_a_v_g(dB)');
legend ('P_ecomputed','P_esimulated');
