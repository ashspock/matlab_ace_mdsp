%Binary FSK

clc;
clear all;
close all;

%Initialization
Ts=0.001;
fc=500;
fc_h=fc+fc/8;
fc_l=fc-fc/8;
bit_len=8;
M=2;
Am=2;

%Bit Sequence
bit_s=zeros(1,bit_len);
for ib=1:bit_len
    if rand<0.5
        bit_s(ib)=0;
    else
        bit_s(ib)=1;
    end
end

%bit_s

% t=0:0.00001:(bit_len*Ts);
t=0:0.00001:(bit_len*Ts);

%FSK Modulation
baseband_z=Am*cos(2*pi*fc_l*t);
baseband_o=Am*cos(2*pi*fc_h*t);

fsk_wave=[];
nbit_seq=[];
for i=1:bit_len
    %for j=0:Ts:(bit_len*Ts)
        if bit_s(i)==0
            fsk_wave=[fsk_wave baseband_z];
        else
            fsk_wave=[fsk_wave baseband_o];
        end
        %nbit_seq=[nbit_seq bit_s(i)];
        nbit_seq = [nbit_seq bit_s(i)*ones(1, length(baseband_z))];
        %nbit_seq = [nbit_seq bit_s(i)*ones(1,100)];
    %end
end

%t_fskw=0:1/fc:length(fskw)/fc-(1/fc);

subplot(2,1,1)
plot(nbit_seq);
axis([0 (bit_len*(1/Ts)) -1 2]);
% xticks(0:(1/Ts):(bit_len*(1/Ts)));
xticks(0:(length(nbit_seq)/bit_len):(length(nbit_seq)*(1/Ts)));
xticklabels({'0','Ts','2Ts','3Ts','4Ts','5Ts','6Ts','7Ts','8Ts','9Ts','10Ts','11Ts','12Ts','13Ts','14Ts','15Ts','16Ts'})
xlabel('Message duration');
ylabel('bit');
title('Bit Sequence');

subplot(2,1,2)
%plot(t_fskw,fskw);
plot(fsk_wave);
axis([0 (bit_len*(1/Ts)) -1 2]);
xticks(0:(length(fsk_wave)/bit_len):(length(fsk_wave)*(1/Ts)));
xticklabels({'0','Ts','2Ts','3Ts','4Ts','5Ts','6Ts','7Ts','8Ts','9Ts','10Ts','11Ts','12Ts','13Ts','14Ts','15Ts','16Ts'})
xlabel('Time');
ylabel('Am');
title('Bandpass Waveform for 2-FSK');
