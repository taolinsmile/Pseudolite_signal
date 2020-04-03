% design of a general pseudolite pulsing scheme
% 仿真周期性伪随机脉冲序列的功率谱
% 1. P_b(f)
% 2. P(f)
% 没仿出来、、

clear all; close all; clc;
d = 0.1; N = 1/d;
fc = 1.023e6; Tch = 1/fc;
Nc = 1023;
Tc = Nc*Tch;

Ne = 200; %脉冲周期长度
ke = Ne/N;
Te = Ne*Tc;

f = -20e3:0.1:20e3;
len_f = length(f);
tmp = 2*pi*Tc*f;
P1_dirac = (N-1)/N + 1/N*(1-exp(-1j*tmp*Ne))./(1-exp(-1j*tmp*d));
P2_dirac = (N-1)/N + 1/N*exp(1j*pi*Te*(N-1)*f*d).*sin(pi*Te*f)./sin(pi*d*Tc*f);

P1_dirac_abs = abs(P1_dirac);
P2_dirac_abs = abs(P2_dirac);
% figure
% plot(f/1e3,P1_dirac_abs)
% title('P1-dirac')

% figure
% plot(f/1e3,P2_dirac_abs)
% title('P2-dirac')

delta = 1/Ne/Nc/Tch;
f_i = -4e3:1:4e3;
ff = f_i*delta;

len_ff = length(ff);
a0 = d/Tch;
a1 = d*(1-d)/Ne/Tch;
tmp1 = sin(f_i*pi*d/Ne)./d/Nc./sin(pi*f_i/Ne/Nc);
tmp2 = tmp1.^2;
P_f = a1*tmp2;
idx = find(ff==0);
P_f(idx) = P_f(idx) + a0;
Pf_log = 10*log10(P_f/max(P_f));
figure
plot(ff/1e3,P_f)
title('P-f')
figure
plot(ff/1e3,Pf_log)
title('Pf-log')