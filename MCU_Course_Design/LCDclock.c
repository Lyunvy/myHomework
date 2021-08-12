#include <reg51.h>
#include <intrins.h>

sfr P4 = 0xc0;
#define SIM 1 // 1时为实际操作时

#if (SIM == 1) // 实际操作时将P1.0作为P4.0
sbit BEEP = P4 ^ 0;
#else
sbit BEEP = P1 ^ 0;
#endif

sbit RS = P2 ^ 5;
sbit RW = P2 ^ 6;
sbit E = P2 ^ 7;
sbit D7 = P0 ^ 7;
char count0;
long second0 = 0;
long second1 = 0;

// 设置T初值
void T_init(void)
{

    TMOD = 0x01;
    TH0 = 0x3C;
    TL0 = 0x0B0;
    EA = 1;

    ET0 = 1;
    TR0 = 1;
}
// 延时
void delay(int x)
{

    unsigned int i, j;
    for (i = x; i > 0; i--)
        for (j = 120; j > 0; j--)
            ;
}
// 把1个命令写入LCD
void write_command(char dat)
{

    E = 0;
    RS = 0;
    _nop_();
    RW = 0;
    P0 = dat;
    delay(5);
    E = 1;
}
// 把1个数据写入LCD
void write_char(char dat)
{

    E = 0;
    RS = 1;
    _nop_();
    RW = 0;
    P0 = dat;
    delay(5);
    E = 1;
}
// 初始化LCD
void init(void)
{

    char i = 0;
    write_command(0x38); // 设置16×2显示，5×7点阵，8位数据接口
    i = 0;
    while (D7 == 0 && i < 5) // 检查忙信号，给LCD时间反应
    {

        delay(1);
        i++;
    }

    write_command(0x08); // 关闭显示
    i = 0;
    while (D7 == 0 && i < 5) // 检查忙信号，给LCD时间反应
    {

        delay(1);
        i++;
    }

    write_command(0x01); // 显示清屏
    i = 0;
    while (D7 == 0 && i < 5) // 检查忙信号，给LCD时间反应
    {

        delay(1);
        i++;
    }

    write_command(0x06); // 光标移动设置
    i = 0;
    while (D7 == 0 && i < 5) // 检查忙信号，给LCD时间反应
    {

        delay(1);
        i++;
    }

    write_command(0x0c); // 展开开关及光标设置
    i = 0;
    while (D7 == 0 && i < 5) // 检查忙信号，给LCD时间反应
    {

        delay(1);
        i++;
    }
}
// 在LCD上显示
void display(char add, char c)
{

    write_command(0x80 + add);
    switch (c)
    {

    case (0):
        write_char('0');
        break;
    case (1):
        write_char('1');
        break;
    case (2):
        write_char('2');
        break;
    case (3):
        write_char('3');
        break;
    case (4):
        write_char('4');
        break;
    case (5):
        write_char('5');
        break;
    case (6):
        write_char('6');
        break;
    case (7):
        write_char('7');
        break;
    case (8):
        write_char('8');
        break;
    case (9):
        write_char('9');
        break;
    }
}
// 时钟显示
void time_display(void)
{

    char temp;

    temp = second0 / 36000;
    display(0x04, temp); // 显示“时”的第一位

    temp = (second0 / 3600) % 10;
    display(0x05, temp); // 显示“时”的第二位

    write_command(0x80 + 0x06);
    write_char(':');

    temp = (second0 % 3600) / 600;
    display(0x07, temp); // 显示“分”的第一位

    temp = ((second0 % 3600) / 60) % 10;
    display(0x08, temp); // 显示“分”的第二位

    write_command(0x80 + 0x09);
    write_char(':');

    temp = (second0 % 60) / 10;
    display(0x0a, temp); // 显示“秒”的第一位

    temp = (second0 % 60) % 10;
    display(0x0b, temp); // 显示“秒”的第二位
}
// 闹钟显示
void clock_display(void)
{

    char temp;

    temp = second1 / 36000;
    display(0x44, temp); // 显示“时”的第一位

    temp = (second1 / 3600) % 10;
    display(0x45, temp); // 显示“时”的第二位

    write_command(0x80 + 0x46);
    write_char(':');

    temp = (second1 % 3600) / 600;
    display(0x47, temp); // 显示“分”的第一位

    temp = ((second1 % 3600) / 60) % 10;
    display(0x48, temp); // 显示“分”的第二位

    write_command(0x80 + 0x49);
    write_char(':');

    temp = (second1 % 60) / 10;
    display(0x4a, temp); // 显示“秒”的第一位

    temp = (second1 % 60) % 10;
    display(0x4b, temp); // 显示“秒”的第二位
}
// 确定按下哪个按键
char scan_key(void)
{

    char key = 0, a = 0;
    P3 = 0xf0;
    if (P3 != 0xf0)
    {

        delay(5); // 延时防抖
        if (P3 != 0xf0)
        {

            switch (P3)
            {

            case (0xe0):
                key = 1;
                break; // 此时1键被按下
            case (0xd0):
                key = 2;
                break; // 此时2键被按下
            case (0xb0):
                key = 3;
                break; // 此时3键被按下
            case (0x70):
                key = 4;
                break; // 此时4键被按下
            }
        }
        while ((a < 130) && (P3 != 0xf0))
        {

            delay(1);
            a++;
        }
    }
    return key;
}
// 闹钟响
void alarm(void)
{

    char i;
    for (i = 0; i < 8; i++)
    {

        BEEP = ~BEEP;
        delay(400);
    }
}

void main(void)
{

    char k;
    BEEP = 1;
    init(); // 初始化LCD
flag1:      // 时钟
    T_init();
    while (1)
    {
        k = scan_key();
        if (k != 0 && k == 4)
        {
            goto flag2;
            break; // 按4键转至flag2，闹钟设置
        }
        if (second0 >= 86400) // 如果达到或超过24小时，则重置时间
        {
            second0 = 0;
        }
        if (second0 == second1 && second1 != 0) // 闹钟到，闹钟响
        {
            alarm();
        }
        time_display();
        clock_display();
    }
flag2: // 闹钟设置
    while (1)
    {
        k = scan_key();
        if (k != 0)
        {
            switch (k)
            {
            case (1):
                second1 += 1;
                break; // 按1键加1秒
            case (2):
                second1 += 60;
                break; // 按2键加1分钟
            case (3):
                second1 += 3600;
                break; // 按3键加1小时
            case (4):
                goto flag1;
                break; // 按4键清屏，重置时间，转至flag1
            }
        }
        if (second0 == second1 && second1 != 0) // 闹钟到，闹钟响
        {
            alarm();
        }
        if (second1 >= 86400) // 如果设置值达到或超过24小时，则重置时间
        {
            second1 = 0;
        }
        time_display();
        clock_display();
    }
}
 
// T0中断函数
void Timer0Interrupt(void) interrupt 1
{

    TH0 = 0x3C;
    TL0 = 0x0B0;
    count0++;
    if (count0 >= 20) // 在已设置初值下，计时20次为一秒
    {

        second0++;
        count0 = 0;
        if (second0 >= 86400) // 24小时重置
        {

            second0 = 0;
            count0 = 0;
        }
    }
}
