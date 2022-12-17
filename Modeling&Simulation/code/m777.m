% 系统状态转移矩阵
A = input('输入A矩阵：')

% 系统输入矩阵
B = input('输入B矩阵：')

% 系统观测矩阵
C = input('输入C矩阵：')

% 计算控制矩阵
R = ctrb(A, B);

% 计算观测矩阵
O = obsv(A, C);

% 判断系统能控性
if rank(R) == size(A, 1)
    disp('能控');
else
    disp('不能控');
end

% 判断系统能观性
if rank(O) == size(A, 1)
    disp('能观');
else
    disp('不能观');
end
