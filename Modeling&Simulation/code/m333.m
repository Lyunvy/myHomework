% �ṩ������
syms x y;
eq1 = sin(x - y) == 0;
eq2 = cos(x + y) == 0;

% ��ⷽ����
[x, y] = solve(eq1, eq2, x, y);

% ��ʾ���̵Ľ�
x
y