tf = 200;
x0 = [0;0;0.0000001];
[t,x] = ode45('m555_f',[0,tf],x0);

figure(1);plot(t,x) % 时域响应
figure(2);plot3(x(:,1),x(:,2),x(:,3));grid on  % 相平面