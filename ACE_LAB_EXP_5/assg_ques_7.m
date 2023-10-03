%   EXP:Assign.#7 
%   MONTE CARLO SIMULATION
%   s=-3A,-A,A,3A, Equiprobable, Complex Gaussian Noise
%-------------------------------------------------------------

clc;clear all;
close all;

%-------------------------------------------------------------
%   Intialisation
N_exp=10^6; % # of times experiment is performed
A=1;% assumed
snr_av_db=-10:1:10;%    SNR range
nsnr=length(snr_av_db);%

p1=0.25;
p2=p1;
p3=p1;
p4=p1;
Pe_comp=zeros(1,nsnr);% for storing Pe by maths formulation
Pe_sim=zeros(1,nsnr);%  for storing Pe by simulation
Pe_union_bound=zeros(1,nsnr);

% Pe by Computation
for i_snr=1:nsnr
    snr=10^(0.1*snr_av_db(i_snr));
    Pe_comp(i_snr)=1.5*qfunc(sqrt(2*snr));
end

% Union Bound of Pe by computation
for i_snr=1:nsnr
    snr=10^(0.1*snr_av_db(i_snr));
    Pe_union_bound(i_snr)=(qfunc(sqrt(2*snr))*(p1+2*p2+2*p3+p4))...
                            +(qfunc(2*sqrt(2*snr))*(p1+p2+p3+p4))...
                        +(qfunc(3*sqrt(2*snr))*(p1+p4));
end

% Pe by Simulation
for i_snr=1:nsnr
      snr=10^(0.1*snr_av_db(i_snr));
    for iexp=1:N_exp
        if rand>0 && rand <= 0.25
            s = -3*A;
        elseif rand>0.25 && rand<= 0.5
            s = -A;
        elseif rand>0.5 && rand<= 0.75
            s = A;
        elseif rand>0.75 && rand<1
            s = 3*A;
        end
          n=sqrt(1/(2*snr))*randn(1)+1i*sqrt(1/(2*snr))*randn(1);
          r=s+n;        
          %optiml reciver structure
            if real(r)<-2*A
                shat=-3*A;
            elseif real(r)>(-2*A) && real(r)<0
                shat=-A;
            elseif real(r)>0 && real(r)<2*A
                shat=A;
            elseif real(r)>(2*A)
                shat=3*A;
            end
          %compute Pesimul

        if shat==s
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
