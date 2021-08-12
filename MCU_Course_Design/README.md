### 一、电子时钟（LCD显示）

设计要求：使用LCD模块显示；显示格式为“时时:分分:秒秒”，按键无操作时显示正常时间，通过按键设置闹钟时间，时间到后通过蜂鸣器提示。

### 二、硬件电路介绍及IO分配
硬件电路介绍：
本次设计的电路是由单片机，LCD液晶显示器，蜂鸣器，按钮，三极管，杜邦线这几部分连接组成。
IO分配：

| IO口     |  外设    |
| ---- | ---- |
| P1.0 | RS |
| P1.1 | RW |
| P1.2 | E |
| P1.3 | 三极管基极 |
| P2.0～P2.7 | D0～D7 |
| P3.0 | KEY1,KEY4 |
| P3.1 | KEY2,KEY5 |
| P3.2 | KEY3 |
| P3.3 | KEY1,KEY2,KEY3 |
| P3.4 | KEY4,KEY5 |
| EA | 高电平 |

### 三、Proteus电路搭建

步骤：

1. 打开电脑上的Proteus软件，新建一个工程；
2. 原理图绘制界面左侧可以选择元器件，把需要的元器件都在原理图上放置好；
3. 根据IO口的分配直接进行连线；

![线路图](https://raw.githubusercontent.com/Lyunvy/picBed/master/picgo/20210812165633.png)
### 四、功能代码设计，每个功能块绘制出流程图
程序包含的功能块：

| 函数                              | 功能             |
| --------------------------------- | ---------------- |
| T_init(void)                      | 设置T初值        |
| delay(int x)                      | 延时             |
| write_command(char dat)           | 把1个命令写入LCD |
| write_char(char dat)              | 把1个数据写入LCD |
| init(void)                        | 初始化LCD        |
| display(char add, char c)         | 在LCD上显示      |
| time_display(void)                | 时钟显示         |
| clock_display(void)               | 闹钟显示         |
| scan_key(void)                    | 确定按下哪个按键 |
| alarm(void)                       | 闹钟响           |
| Timer0Interrupt(void) interrupt 1 | T0中断函数       |

- delay运用for循环空白语句进行延时；
- scan_key通过先设置端口初值，不断扫描端口值有没有变化，继而判断按下哪个按键
- alarm则是for循环对BEEP取反实现闹钟嘀嘀嘀的效果。
- 功能实现中运用到定时器T0中断进行计时，在Timer0Interrupt(void) interrupt 1中断函数中进行使second0每加一实现加一秒的效果。
- 主函数中对不同的按键采取不同的措施，实现设置闹钟的效果。

![流程图](https://raw.githubusercontent.com/Lyunvy/picBed/master/picgo/20210812165830.png)

### 五、运行效果展示
1.仿真：

![仿真1](https://raw.githubusercontent.com/Lyunvy/picBed/master/picgo/%E4%BB%BF%E7%9C%9F1.png)

![仿真2](https://raw.githubusercontent.com/Lyunvy/picBed/master/picgo/%E4%BB%BF%E7%9C%9F2.png)

2.实物：

![实物1](https://raw.githubusercontent.com/Lyunvy/picBed/master/picgo/%E5%AE%9E%E7%89%A91.png)

![实物2](https://raw.githubusercontent.com/Lyunvy/picBed/master/picgo/%E5%AE%9E%E7%89%A92.png)
