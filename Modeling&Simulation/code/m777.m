% ϵͳ״̬ת�ƾ���
A = input('����A����')

% ϵͳ�������
B = input('����B����')

% ϵͳ�۲����
C = input('����C����')

% ������ƾ���
R = ctrb(A, B);

% ����۲����
O = obsv(A, C);

% �ж�ϵͳ�ܿ���
if rank(R) == size(A, 1)
    disp('�ܿ�');
else
    disp('���ܿ�');
end

% �ж�ϵͳ�ܹ���
if rank(O) == size(A, 1)
    disp('�ܹ�');
else
    disp('���ܹ�');
end
