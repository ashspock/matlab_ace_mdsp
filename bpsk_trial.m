% Binary PSK

clc;
clear all;
close all;

%Initialization
Ts=0.001;
fc=5000;
% theta_0=0;
% theta_1=pi;
bit_len=12;
M=2;
Am=2;
fc_high=(9*fc)/8;
fc_low=(7*fc)/8;

%Bit Sequence
bit_s=zeros(1,bit_len);
for ib=1:bit_len
    if rand<0.5
        bit_s(ib)=0;
    else
        bit_s(ib)=1;
    end
end

t=0:0.00001:(bit_len)*Ts;
bp_high=Am*cos(2*pi*(fc_high)*t);
bp_low=Am*cos(2*pi*(fc_low)*t);
bit_sequence=[];
band_pass_fsk=[];

for j=1:(bit_len)
    bit_sequence=[bit_sequence bit_s(j)*ones(1,(1/(Ts*10)))];
    if bit_s(j)==1
        band_pass_fsk=[band_pass_fsk bp_high];
    else
        band_pass_fsk=[band_pass_fsk bp_low];
    end
end
bit_sequence=[bit_sequence 0];

subplot(2,1,1);
plot(t*10,bit_sequence);
axis([0 (bit_len*Ts) -0.5 1.5]);


subplot(2,1,2);
plot(band_pass_fsk);
% axis([0 (bit_len*Ts) -0.5 1.5]);
axis([0 (length(bit_sequence)) -0.5 1.5]);

