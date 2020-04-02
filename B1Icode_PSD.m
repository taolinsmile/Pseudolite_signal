% 参照 <北斗伪卫星信号远近效应干扰消除技术研究-吴迪>
% P25,B1I测距码功率谱密度
% 结果：根据式2-25不能画出图2-8，而且分析公式得，频谱间隔不是1kHz！
clear all; close all; clc;
n = 11;
N = 2^n - 2;
m = [-100000:-1,1:100000];
len1 = length(m);
fc = 2.046e6; Tc = 1/fc;
ww = -10e3:1:10e3;
len2 = length(ww);

sw = zeros(1,len2);
for i=1:len2
    w = ww(i);
    d1 = dirac(w);
    idx1 = d1 == Inf; % find Inf
    d1(idx1) = 1;
    d2 = dirac(w+2*m*pi/N/Tc);
    idx2 = d2 == Inf; % find Inf
    d2(idx2) = 1;
    sw(i) = d1 + sum( (N+1)*(sinc(m*pi/N)).^2.*d2 );
end
figure
stem(ww,sw,'.')