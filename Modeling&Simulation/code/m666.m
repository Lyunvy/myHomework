% 系统状态转移矩阵
A = [0 1; -2 -3];

% 系统输入矩阵
B = [0; 1];

% 系统输出矩阵
C = [1 0];

% 求解传递函数
[num, den] = ss2tf(A, B, C, 0);

% 显示传递函数,绘制图形
printsys(num,den);
subplot(2,2,1);rlocus(num,den);
subplot(2,2,2);bode(num,den);
subplot(2,2,3);step(num,den);
