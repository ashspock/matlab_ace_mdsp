% Binary ASK

clc;
clear global;
close all;

%Initialization
Ts=0.001;
fc=5000;
bitl=8;
M=2;
Am=2;
%Bit Sequence
bit_s=zeros(1,bitl);
for ib=1:bitl
    if rand<0.5
        bit_s(ib)=0;
    else
        bit_s(ib)=1;
    end
end

%ASK modulation
bit_len=length(bit_s);
%t=0:0.00001:(((bit_len)*Ts));

t=0:0.00001:(bit_len*Ts);

carrier_sig=Am*cos(2*pi*t*fc);
carrier_sig=carrier_sig(:,1:length(carrier_sig)-1);%carrier vector resizing

bit_mat=[];
one_mat=ones(length(carrier_sig));
for i=1:bit_len
    for j=1:(length(carrier_sig)/bit_len)
        bit_mat=[bit_mat bit_s(i)];
    end
end
x=bit_mat.*carrier_sig;

base_band_in_phase=[];
%base_band_quadrature=[];
for i=1:length(bit_mat)
    if(bit_mat(i)==0)
        base_band_in_phase=[base_band_in_phase (-1)*Am];
    else
        base_band_in_phase=[base_band_in_phase Am];
    end
end

%Plotting

subplot(3,1,1);
plot(bit_mat);
%axis([0 (bit_len*Ts) -1 3]);
axis([0 length(bit_mat) -1 3]);
xlabel('Message duration');
ylabel('bit');
title('Bit Sequence');
xticks(0:(length(bit_mat)/bit_len):(length(bit_mat)*(1/Ts)));
xticklabels({'0','Ts','2Ts','3Ts','4Ts','5Ts','6Ts','7Ts','8Ts','9Ts','10Ts','11Ts','12Ts','13Ts','14Ts','15Ts','16Ts'})

subplot(3,1,2);
plot(x);
axis([0 length(x) -4 4]);
xlabel('Time');
ylabel('Am');
title('Bandpass Waveform for 2-ASK');
xticks(0:(length(x)/bit_len):(length(x)*(1/Ts)));
xticklabels({'0','Ts','2Ts','3Ts','4Ts','5Ts','6Ts','7Ts','8Ts','9Ts','10Ts','11Ts','12Ts','13Ts','14Ts','15Ts','16Ts'})

subplot(3,1,3);
plot(base_band_in_phase);
axis([0 length(base_band_in_phase) -4 4]);
xlabel('Time');
ylabel('Am');
title('Base Band In-Phase component');
xticks(0:(length(base_band_in_phase)/bit_len):(length(base_band_in_phase)*(1/Ts)));
xticklabels({'0','Ts','2Ts','3Ts','4Ts','5Ts','6Ts','7Ts','8Ts','9Ts','10Ts','11Ts','12Ts','13Ts','14Ts','15Ts','16Ts'})
