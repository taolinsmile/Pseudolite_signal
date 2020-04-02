%% collision probability analyze
% <北斗伪卫星远近效应干扰消除技术-吴迪>
% P53 碰撞概率分析

clear all; close all; clc;

count2 = 0; count3 = 0; count4 = 0;
for i = 1:1000
    a(1,:) = randperm(16);
    a(2,:) = randperm(16);
    a(3,:) = randperm(16);
    a(4,:) = randperm(16);
    % 两个信号发生碰撞概率
    t2 = [ (a(1,:)==a(2,:)), (a(1,:)==a(3,:)), (a(1,:)==a(4,:)) ];
    t2 = [t2, (a(2,:)==a(3,:)), (a(2,:)==a(4,:)) ];
    t2 = [t2, (a(3,:)==a(4,:))];
    count2 = count2 + sum(t2);
    % 三个信号发生碰撞概率
    t31 = a(1,:)==a(2,:);
    t31 = t31.*(a(1,:)==a(3,:));
    t32 = a(1,:)==a(2,:);
    t32 = t32.*(a(1,:)==a(4,:));    
    t33 = a(2,:)==a(3,:);
    t33 = t33.*(a(2,:)==a(4,:)); 
    count3 = count3 + sum(t31+t32+t33); 
    % 四个信号发生碰撞概率    
    t4 = a(1,:)==a(2,:);
    t4 = t4.*(a(1,:)==a(3,:));
    t4 = t4.*(a(1,:)==a(4,:));
    count4 = count4 + sum(t4);
end
    