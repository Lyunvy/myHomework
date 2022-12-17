% 定义数据
X = 1:10;
Y = [2651 1943 1494 1087 765 538 484 290 226 204];

% 拟合
p = polyfit(X, log(Y), 1);
sprintf('alpha=%f\nbeta=%f',exp(p(2)),p(1))
