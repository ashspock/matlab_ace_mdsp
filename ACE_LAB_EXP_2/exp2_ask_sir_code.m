clc;
clear all;

%Initialization
Ts=0.001;
fc=5000;
bitl=12;
M=4;

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
t=0:0.0001:bitl;
lt=length(t);
s_bp=zeros(1,bitl*lt);
for ib=1:bitl-1
    if(M==2)
        if bit_s(ib)==0
            A=-1;
        else
            A=1;
        end
    else if(M==4)
            if bit_s(ib)==0 && bit_s(ib+1)==0
                A=-3;
            elseif bit_s(ib)==0 && bit_s(ib+1)==1
                A=-1;
            elseif bit_s(ib)==1 && bit_s(ib+1)==0
                A=1;
            elseif bit_s(ib)==1 && bit_s(ib+1)==1
                A=3;
                ib=ib+1;
            end
    end
    end
    for it=1:lt
        x(it)=A*cos(2*pi*fc*t(it));
        s_br(it)=1;
        s_bi(it)=0;
    end
    s_bp(1,(ib-1)*lt+1:ib*lt)=x(:);
    s_br(1,(ib-1)*lt+1:ib*lt)=x(:);
end
plot(s_br);
figure
plot(s_bp);


%PSK 
