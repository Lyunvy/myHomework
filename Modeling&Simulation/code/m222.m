% 定义数据
xdata1 = [0.2,0.5,0.6,0.8,1.0,1.1].';
xdata2 = [0.1,0.3,0.4,0.9,1.1,1.4].';
ydata = [0.17,0.26,0.28,0.23,0.27,0.24].';

% 定义模型
ft = fittype('a+b*x1+c*x2','indep', {'x1','x2'});

% 拟合
[fitresult, gof] = fit([xdata1, xdata2], ydata, ft);
sprintf('a0=%f\na1=%f\na2=%f',fitresult.a,fitresult.b,fitresult.c)