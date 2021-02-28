clc;clear;
load record.mat 
load record2.mat 
load record3.mat 
n = 1:1:30;
plot(n,record,'or',n,record2,'*y',n,record3,'+b');
legend('F=0.5,Cr=0.7','F=0.2,Cr=0.3','F=0.8,Cr=0.7')
