% ϵͳ״̬ת�ƾ���
A = [0 1; -2 -3];

% ϵͳ�������
B = [0; 1];

% ϵͳ�������
C = [1 0];

% ��⴫�ݺ���
[num, den] = ss2tf(A, B, C, 0);

% ��ʾ���ݺ���,����ͼ��
printsys(num,den);
subplot(2,2,1);rlocus(num,den);
subplot(2,2,2);bode(num,den);
subplot(2,2,3);step(num,den);
