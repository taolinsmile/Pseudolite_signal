% 线性同余法仿真例子：运用混合同于法生成1000个[0,1]内的均匀分布随机数
% ————————————————
% 版权声明：本文为CSDN博主「Fying2016」的原创文章，遵循 CC 4.0 BY-SA 版权协议，转载请附上原文出处链接及本声明。
% 原文链接：https://blog.csdn.net/fengying2016/java/article/details/80573287
% ————————————————
% a称为乘数，c称为增量，m称为模数

function A=xianxingtongyu1(a,c,m,x, len_A)
A=zeros(1000,1);
n=1;
while n<=len_A
    n=n+1;
    x=rem((a*x+c),m);  %%rem(x,y):求整除x/y的余数
%     y=x/m; %若去掉这一句便是整数
    y = x;
    A(n-1,1)=y;
end 
