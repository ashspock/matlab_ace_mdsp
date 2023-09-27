clc;
clear all;

R1=rand(1,32);
for i=1:32
    if(R1(i)<0.5)
        R1(i)=0;
    else
        R1(i)=1;
    end;
end;
R1


%
R2=rand(1,32);
for i=1:32
    if(R2(i)<0.7)
        R2(i)=0;
    else
        R2(i)=1;
    end;
end;
R2;

   

