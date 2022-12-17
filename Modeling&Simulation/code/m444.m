% 提供初始猜测值
x0 = [1 0];

% 求解极小值
x1= fminsearch('m444_f', x0);

% 计算极小值
ymin = m444_f(x1);ymin