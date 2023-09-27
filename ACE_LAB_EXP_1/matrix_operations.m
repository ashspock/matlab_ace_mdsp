% matrix_operations

clc;
close all;
clear all;

%1
A=[1 2 3 4; 5 6 7 8; 9 10 11 12];
%2
%disp(A(2,:))
%disp(A(:,2))
%3
%disp(A(:,1:2:3))
%4
B=repmat(A,4,3);
%5
reshape(A,2,6);
%6
C=zeros(3,4);
D=ones(3,4);
%7
horzcat(A, C);
vertcat(A, D);
%8
eye(5);
%9
diag(B);
%10
tril(B);
triu(B);
%11
sum(A(:));
%12
A*D';
A.*D;