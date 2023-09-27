N=2;
w=zeros(2^N,2^N);
columns=(2^N);
rows=(2^N);
for r=1:rows
    for c=1:columns
        
            w(r,c)=exp(-i*2*pi*r-1*c-1/N);
        
    end
end

x=[0 1 2 3]';
X=zeros(4,1);

X=w'*x;
