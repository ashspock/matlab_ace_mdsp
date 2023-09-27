% Loops & Functions

%1.1
K=randi([1,10],100);
%1.2
tic;
arrsum=0;
for i=1:100
    for j=1:100
        arrsum=arrsum+K(i,j);
    end
end
(arrsum);
toc;
%2-3
tic;
array_sum_without_loop=sum(sum(K));
toc;
%sum by looping takes more time
%4
count_greater_than_5=0;
count_less_than_3=0;
%arrsum=0;
for i=1:100
    for j=1:100
        if K(i,j)<3
            count_less_than_3=count_less_than_3+1;
        end
        if K(i,j)>5
            count_greater_than_5=count_greater_than_5+1;
        end
    end
end
count_greater_than_5;
count_less_than_3;

%5
K1=K>5;
count_greater_than_five=sum(sum(K1(:,:)));
K2=K<3;
count_less_than_three=sum(sum(K2(:,:)));

%6
x=1;n=0;
while x<=10
    n=n+x;x=x+2;
end
x;

%7.1
factorial(5);
%7.2
n=5;
fact=1;
while n>0
    fact=fact*n;
    n=n-1;
end
fact;
