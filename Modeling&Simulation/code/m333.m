% 提供方程组
syms x y;
eq1 = sin(x - y) == 0;
eq2 = cos(x + y) == 0;

% 求解方程组
[x, y] = solve(eq1, eq2, x, y);

% 显示方程的解
x
y