% 对线性同余法生成生成的随机数进行一般
% 的统计量进行计算，计算出生成随机数的
% 均值和方差以及标准差
% 调用函数 A=xianxingtongyu1(a,c,m,x);

% ————————————————
% 版权声明：本文为CSDN博主「Fying2016」的原创文章，遵循 CC 4.0 BY-SA 版权协议，转载请附上原文出处链接及本声明。
% 原文链接：https://blog.csdn.net/fengying2016/java/article/details/80573287
% ————————————————
% 结论：
% 1.生成的 均匀分布随机数 是均值为0.5，标准差在0.3左右。m越大均值越接近1/2，方差越接近1/12。
% 2.伪随机数周期必然 ≤ M

clear all; close all; clc;
len_AA = 2000;
AA=xianxingtongyu1(97,3,1000,71,len_AA);

A = AA(1:1000);
B = AA(1001:end);
isequal(A,B)

sum=0;
for n=1:1000
    sum=sum+A(n,1);
end
Avg=sum/1000 %计算其均值
s=0;
for n=1:1000
    s=s+(A(n,1)-Avg)^2;
end
S=s/(1000-1)   %计算其方差
Stdv=S^0.5     %计算其标准差
% 可以看出，生成的 均匀分布随机数 是均值为0.5，标准差在0.3左右。m越大均值越接近1/2，方差越接近1/12。

