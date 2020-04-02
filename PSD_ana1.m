% PSD analyze
% <北斗伪卫星远近效应干扰消除技术-吴迪>
% P26 频谱分析

clear all; close all; clc;

N = 2046; 
Tc = 1e-3;
m = [-10000:-1,1:10000];
len_m = length(m);
step = pi/N/Tc;
ww = [-10e3:1:10e3]*step;
len_w = length(ww);
sw = zeros(len_w,1);
for i=1:len_w   
    w = ww(i);
    
    d1 = dirac(w);
    idx1 = d1 == Inf; 
    d1(idx1) = 1; 
    d2 = dirac(w+2*m*pi/N/Tc);
    idx2 = d2 == Inf; 
    d2(idx2) = 1; 

    sw(i) = d1 + sum((N+1)*((sinc(m*pi/N)).^2).*d2);
end

figure
% stem(ww,sw)
plot(ww,sw)
