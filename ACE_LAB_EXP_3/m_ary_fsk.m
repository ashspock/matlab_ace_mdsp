% 4/8/16-ary FSK Digital Modulation Schemes
% Name: Sachin Chauhan
% Roll# 23SP06007
% Course: Advanced Communication Laboratory
% ////////////////////////////////////////////////////
clc;
clear;
close;
% //////////////////////////////////////////////

prompt="Enter the bit sequence length(Even only)";
bit_len=input(prompt);
% bit_len=16;

%Bit Sequence generation
bit_s=zeros(1,bit_len);
for ib=1:bit_len
    if rand<0.5
        bit_s(ib)=0;
    else
        bit_s(ib)=1;
    end
end

% bit_s=[1,0,1,1,0,0,1,1,1,1,0,1,1,0,0,1];

%Enter M
prompt="Enter the value for M(only integer in multiple of 2):";
M=input(prompt);
% M=4;
segment_size=log2(M);
segment_size

bin_arr=[];
str="";
for i=0:M-1
    str=str+dec2bin(i,segment_size);
    bin_arr=[bin_arr str];
    str="";
end
bin_arr 

segment_arr=[];
    str="";
    for i=1:segment_size:bit_len %(bit_len/segment_size)
        for j=i:1:(i+segment_size-1) %bit_len%(i+segment_size-1)
                str=str+num2str(bit_s(j));
        end
        segment_arr=[segment_arr str];
        str="";
    end
    segment_arr

if(mod(bit_len,segment_size)==0)

    fm=100;
    base_sig_comp=[];
    fc=500;
    Ts=0.001;
    f=[10,20,30,40,50];
    t=0:0.00001:(length(segment_arr)*2*Ts);
    band_pass_sig=[];
    carrier=cos(2*pi*fc*t);
    in_phase=cos(2*pi*fm*t);
    quad_phase=sin(2*pi*fm*t);
    carrier=carrier(:,1:length(carrier)-1);%carrier vector resizing
    in_phase=in_phase(:,1:length(in_phase)-1);
    quad_phase=quad_phase(:,1:length(quad_phase)-1);
    base_band_in_phase=[];
    base_band_quad_phase=[];
    
    
    % Frequency Modulation Value Array
    if(mod(bit_len,segment_size)==0)
    freq_arr=[];
    for i=1:M %(bit_len/segment_size)
        if(mod(i,2)==0)
            freq_arr=[freq_arr (((-1).^(i-1)).*(i-1)*fc/8)];
        else
            freq_arr=[freq_arr (((-1).^(i-1)).*(i)*fc/8)];
        end
    end
    freq_arr
    end

    % Logic for modulating carrier signal
    for i=1:(bit_len/segment_size)
        for j=1:(M)
            if segment_arr(i)==bin_arr(j)
                band_pass_sig=[band_pass_sig (cos((2*pi*(fc+freq_arr(j))*t)))];
                base_band_in_phase=[base_band_in_phase (cos(2*pi*freq_arr(j)*t))];
                base_band_quad_phase=[base_band_quad_phase (sin(2*pi*freq_arr(j)*t))];

            end
        end
    end
    
    
    figure(1);
    subplot(4,1,1);
    % Bit sequence plot
    stairs(0:1:bit_len-1, bit_s);
    % stem(bit_s);
    % axis([0 bit_len -2 2]);
    % xlim([0 bit_len-1]);
    xticks(0:1:bit_len);
    ylim([-2 2]);
    xticklabels({'0','Ts','2Ts','3Ts','4Ts','5Ts','6Ts','7Ts','8Ts','9Ts','10Ts','11Ts','12Ts','13Ts','14Ts','15Ts','16Ts'})
    grid on;
    xlabel('Bit duration(Ts)');
    ylabel('Message sequence');
    title('Bit Sequence');

    subplot(4,1,2);
    plot(band_pass_sig);
    xticks(0:length(band_pass_sig)/bit_len:length(band_pass_sig)*(1/Ts));
    xticklabels({'0','Ts','2Ts','3Ts','4Ts','5Ts','6Ts','7Ts','8Ts','9Ts','10Ts','11Ts','12Ts','13Ts','14Ts','15Ts','16Ts'})
    ylim([-2 2]);
    grid on;
    xlabel('Signal duration(Ts)');
    ylabel('Amplitude(Volts)');
    %title(M,'- Array Band-Pass Signal');
    title(sprintf('%d - Ary FSK Band-Pass Signal',M));

    subplot(4,1,3);
    plot(base_band_in_phase);
    xticks([0:length(band_pass_sig)/bit_len:length(band_pass_sig)*(1/Ts)]);
    xticklabels({'0','Ts','2Ts','3Ts','4Ts','5Ts','6Ts','7Ts','8Ts','9Ts','10Ts','11Ts','12Ts','13Ts','14Ts','15Ts','16Ts'})
    ylim([-2 2]);
    grid on;
    xlabel('Signal duration(Ts)');
    ylabel('Amplitude(Volts)');
    %title(M,'- Array Band-Pass Signal');
    title(sprintf('%d - Ary FSK Base-Band Signal In-Phase Component',M));
    
    subplot(4,1,4);
    plot(base_band_quad_phase);
    xticks([0:length(band_pass_sig)/bit_len:length(band_pass_sig)*(1/Ts)]);
    xticklabels({'0','Ts','2Ts','3Ts','4Ts','5Ts','6Ts','7Ts','8Ts','9Ts','10Ts','11Ts','12Ts','13Ts','14Ts','15Ts','16Ts'})
    ylim([-2 2]);
    grid on;
    xlabel('Signal duration(Ts)');
    ylabel('Amplitude(Volts)');
    %title(M,'- Array Band-Pass Signal');
    title(sprintf('%d - Ary FSK Base-Band Signal Quadrature-Phase Component',M));


else
    disp("segements not formed");
end