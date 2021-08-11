#include <iostream>
#include <fstream>
#include <list>
#include <sstream>		//字符串转换

using namespace std;

//信息管理系统类
class stuSys
        {
        private:
            //学生全局结构
            struct Student
                    {//虽然学生属性都是字符串类型，但是后面对数据进行处理时，
                //也会将部分字符串数据转换为数字类型进行操作
                string name;		//姓名
                string age;			//年龄
                string num;			//学号
                string ChineseScore;	//语文成绩
                string MathScore;   //数学成绩
                string EnglishScore;    //英语成绩
                    };

            list<Student> studlist;	//存储所有学生信息的容器

            string path;			//文件路径
            //将容器中所有信息写入到文件中
            void ofsallMess()
            {
                ofstream ofst;
                //以清空源文件内容方式打开文件
                ofst.open(path, ios::trunc);

                //判断文件是否打开成功
                if (!ofst.is_open())
                {
                    cout << "文件打开失败" << endl;
                    return;
                }

                //将容器中的所有信息写入到文件中，这里的endl必须在开头写，末尾不能写，否则会出现一系列问题
                for (list<Student>::const_iterator it = studlist.begin(); it != studlist.end(); it++)
                    ofst << endl << it->num << endl << it->name << endl << it->age << endl << it->ChineseScore << endl << it->MathScore<< endl << it->EnglishScore;

                //关闭文件
                ofst.close();
            }

        public:
            stuSys();    //构造函数用于将文件中的内容按格式读取到list<Student>中
            static void Hint();    //输出提示信息成员函数
            bool AddMess();    //添加学生信息
            void PrintMess();    //查看所有学生信息
            void FindMess();    //查找（姓名||学号）

        private:
            class Studentrule_1_1       //按照学号升序排序
                    {
                    public:
                        bool operator()(Student& p1, Student& p2)            //将属性字符转换为数字，然后根据数字排序
                        {
                            int temp_1;  stringstream ss_1; ss_1 << p1.num; ss_1 >> temp_1;
                            int temp_2; stringstream ss_2; ss_2 << p2.num; ss_2 >> temp_2;
                            return temp_1 < temp_2;
                        }
                    };
            class Studentrule_1_2       //按照学号降序排序
                    {
                    public:
                        bool operator()(Student& p1, Student& p2)            //将属性字符转换为数字，然后根据数字排序
                        {
                            int temp_1;  stringstream ss_1; ss_1 << p1.num; ss_1 >> temp_1;
                            int temp_2; stringstream ss_2; ss_2 << p2.num; ss_2 >> temp_2;
                            return temp_1 > temp_2;
                        }
                    };
            class Studentrule_2_1       //按照语文成绩升序排序
                    {
                    public:
                        bool operator()(Student& p1, Student& p2)            //将属性字符转换为数字，然后根据数字排序
                        {
                            int temp_1;  stringstream ss_1; ss_1 << p1.ChineseScore; ss_1 >> temp_1;
                            int temp_2; stringstream ss_2; ss_2 << p2.ChineseScore; ss_2 >> temp_2;
                            return temp_1 < temp_2;
                        }
                    };
            class Studentrule_2_2       //按照语文成绩降序排序
                    {
                    public:
                        bool operator()(Student& p1, Student& p2)            //将属性字符转换为数字，然后根据数字排序
                        {
                            int temp_1;  stringstream ss_1; ss_1 << p1.ChineseScore; ss_1 >> temp_1;
                            int temp_2; stringstream ss_2; ss_2 << p2.ChineseScore; ss_2 >> temp_2;
                            return temp_1 < temp_2;
                        }
                    };
            class Studentrule_3_1       //按照数学升序排序
                    {
                    public:
                        bool operator()(Student& p1, Student& p2)            //将属性字符转换为数字，然后根据数字排序
                        {
                            int temp_1;  stringstream ss_1; ss_1 << p1.MathScore; ss_1 >> temp_1;
                            int temp_2; stringstream ss_2; ss_2 << p2.MathScore; ss_2 >> temp_2;
                            return temp_1 < temp_2;
                        }
                    };
            class Studentrule_3_2       //按照数学降序排序
                    {
                    public:
                        bool operator()(Student& p1, Student& p2)            //将属性字符转换为数字，然后根据数字排序
                        {
                            int temp_1;  stringstream ss_1; ss_1 << p1.MathScore; ss_1 >> temp_1;
                            int temp_2; stringstream ss_2; ss_2 << p2.MathScore; ss_2 >> temp_2;
                            return temp_1 < temp_2;
                        }
                    };
            class Studentrule_4_1       //按照英语升序排序
                    {
                    public:
                        bool operator()(Student& p1, Student& p2)            //将属性字符转换为数字，然后根据数字排序
                        {
                            int temp_1;  stringstream ss_1; ss_1 << p1.EnglishScore; ss_1 >> temp_1;
                            int temp_2; stringstream ss_2; ss_2 << p2.EnglishScore; ss_2 >> temp_2;
                            return temp_1 < temp_2;
                        }
                    };
            class Studentrule_4_2       //按照英语降序排序
                    {
                    public:
                        bool operator()(Student& p1, Student& p2)            //将属性字符转换为数字，然后根据数字排序
                        {
                            int temp_1;  stringstream ss_1; ss_1 << p1.EnglishScore; ss_1 >> temp_1;
                            int temp_2; stringstream ss_2; ss_2 << p2.EnglishScore; ss_2 >> temp_2;
                            return temp_1 < temp_2;
                        }
                    };

        public:
            void  SortMess();    //排序
            void InsertMess();    //向中间插入学生数据
            void DeteleMess();    //删除学生的数据
            void ModifyMess();    //修改学生的信息
            void StatMess();    //统计学生数据
        };


//构造函数用于将文件中的内容按格式读取到list<Student>中
stuSys::stuSys()
{
    cout << "输入你的文件路径，加后缀名，一般为txt文件（没有则创建该文件）：" << endl;
    cin >> path;

    ifstream ifstr;
    ifstr.open(path, ios::in);		//打开文件路径中的文件，如果打开失败则创建该文件
    if (!ifstr.is_open())
    {
        ofstream temp(path);		//创建文件
        temp.open(path,ios::out);
        if (!temp.is_open())		//检测是否创建成功
            {
            cout << "创建文件失败，退出程序" << endl;
            exit(-1);
            }
        //文件成功创建则关闭文件
        temp.close();
    }

    system("cls");

    //将文件中所有内容读取到list容器中
    ifstream ifst;
    ifst.open(path, ios::in);

    char line[14];		//这里必须是字符数组
    Student temp;

    //空读取一行因为新文件第一行不保存内容
    ifst.getline(line, sizeof(line));

    //成行读取文件中的内容
    //循环读取五行信息，每五行将信息插入到容器中
    while (!ifst.eof())
    {
        //保存到临时学生temp中
        ifst.getline(line, sizeof(line));
        temp.num = line;		//学号
        ifst.getline(line, sizeof(line));
        temp.name = line;		//姓名
        ifst.getline(line, sizeof(line));
        temp.age = line;		//年龄
        ifst.getline(line, sizeof(line));
        temp.ChineseScore = line;	//语文成绩
        ifst.getline(line, sizeof(line));
        temp.MathScore = line;	//数学成绩
        ifst.getline(line, sizeof(line));
        temp.EnglishScore = line;	//英语成绩
        //将temp插入到学生容器中
        studlist.push_back(temp);
    }
    Hint();		//显示提示信息
}

//输出提示信息成员函数
void stuSys::Hint()
{
    cout << "--------学生信息管理系统--------" << endl << endl;
    cout << "1 添加学生信息（尾部添加）" << endl;
    cout << "2 查看所有学生信息" << endl;
    cout << "3 查找学生信息（学号、姓名）" << endl;
    cout << "4 排序学生信息（学号、成绩、升序、降序）" << endl;
    cout << "5 插入学生信息（在输入学号信息前插入）" << endl;
    cout << "6 删除学生数据（学号、姓名）" << endl;
    cout << "7 修改学生数据（学号）" << endl;
    cout << "8 输出统计数据（总和、平均值等）" << endl;
    cout << "9 退出程序" << endl << endl;
    cout << "所有功能在执行完毕后，都会自动将当前信息保存进文件" << endl << endl;
}

//添加学生信息
bool stuSys::AddMess()
{
    //创建一个学生结构
    Student student;

    L1:
    //输出提示信息，并输入学生信息，输入-1结束输入
    cout << "学号：		"; cin >> student.num;
    if (student.num == "-1") return false;

    //读入学号时，遍历所有的学生学号信息，如果学号相同则输出提示并重新输入
    for (list<Student>::const_iterator it = studlist.begin(); it != studlist.end(); it++)
        if (it->num == student.num)
        {
            cout << endl << "学号信息重复，请重新输入：" << endl << endl;
            goto L1;	//返回到输入的地方
        }

    //返回false则停止添加学生信息
    cout << "姓名：		"; cin >> student.name;
    if (student.name == "-1") return false;
    cout << "年龄：		"; cin >> student.age;
    if (student.age == "-1") return false;
    cout << "语文成绩：	"; cin >> student.ChineseScore;
    if (student.ChineseScore == "-1") return false;
    cout << "数学成绩：	"; cin >> student.MathScore;
    if (student.MathScore == "-1") return false;
    cout << "英语成绩：	"; cin >> student.EnglishScore;
    if (student.EnglishScore == "-1") return false;

    cout << endl;

    studlist.push_back(student);	//将新添加的学生信息尾插到容器中

    //只将新添加的学生信息追加到文件中
    //创建写入流对象
    ofstream ofst;
    //在文件路径中以追加方式打开文件
    ofst.open(path, ios::app);

    //将学生信息按顺序写入到文件中，这里的endl，只能按照这个格式写
    ofst << endl << student.num << endl << student.name << endl << student.age << endl << student.ChineseScore << endl << student.MathScore << endl << student.EnglishScore;

    //关闭文件
    ofst.close();

    //返回true继续录入学生信息
    return true;
}

//查看所有学生信息
void stuSys::PrintMess()
{
    cout << endl;
    for (list<Student>::const_iterator it = studlist.begin(); it != studlist.end(); it++)
    {
        cout << "学号：		" << it->num << endl;
        cout << "姓名：		" << it->name << endl;
        cout << "年龄：		" << it->age << endl;
        cout << "语文成绩：	" << it->ChineseScore << endl;
        cout << "数学成绩：	" << it->MathScore << endl;
        cout << "英语成绩：	" << it->EnglishScore << endl << endl;
    }
}

//查找（姓名||学号）
void stuSys::FindMess()
{
    char key;
    cout << "输入1代表按学号查找，其他代表按姓名查找" << endl;
    cin >> key ;

    //按学号查找
    if (key == '1')
    {
        string findnum;
        cout << "请输入需要查找的学生序号：";
        cin >> findnum;

        for (list<Student>::const_iterator it = studlist.begin(); it != studlist.end(); it++)
            if (it->num == findnum)
            {
                cout << "学号：		" << it->num << endl;
                cout << "姓名：		" << it->name << endl;
                cout << "年龄：		" << it->age << endl;
                cout << "语文成绩：	" << it->ChineseScore << endl;
                cout << "数学成绩：	" << it->MathScore << endl;
                cout << "英语成绩：	" << it->EnglishScore << endl << endl;
                return;		//因为学号具有唯一性，所以找到后输出完信息直接返回
            }

        //函数没有结束执行到这里说明没有找到学号，输出提示信息
        cout << "没有找到学号为“ " << findnum << " ”的学生" << endl;
    }
    //按姓名查找
    else
    {
        string findname;
        cout << "请输入需要查找的学生姓名：";
        cin >> findname;
        bool sign = false;	//标记是否找到学生

        //输出所有名为findname的学生信息
        for (list<Student>::const_iterator it = studlist.begin(); it != studlist.end(); it++)
            if (it->name == findname)
            {
                cout << "学号：		" << it->num << endl;
                cout << "姓名：		" << it->name << endl;
                cout << "年龄：		" << it->age << endl;
                cout << "语文成绩：	" << it->ChineseScore << endl;
                cout << "数学成绩：	" << it->MathScore << endl;
                cout << "英语成绩：	" << it->EnglishScore << endl << endl;
                sign = true;
            }

        //如果没有找到则输出提示信息
        if (!sign)
            cout << "没有找到名为“" << findname << "”的学生" << endl;
    }
}

//排序
void stuSys::SortMess()
{
    char key_1 = '0';
    cout << "输入1代表按学号排序，输入2代表按语文成绩排序，输入3代表按数学成绩排序，其他代表按英语成绩排序" << endl;
    cin >> key_1;		//接收键值执行不同的排序规则
    cout << "输入1代表升序排序，其他代表降序排序" << endl;
    char key_2 = '0';
    cin >> key_2;
    switch (key_1)
    {
        case '1': key_2 == '1' ? studlist.sort(Studentrule_1_1()) : studlist.sort(Studentrule_1_2()); break;
        case '2': key_2 == '1' ? studlist.sort(Studentrule_2_1()) : studlist.sort(Studentrule_2_2()); break;
        case '3': key_2 == '1' ? studlist.sort(Studentrule_3_1()) : studlist.sort(Studentrule_3_2()); break;
        default:  key_2 == '1' ? studlist.sort(Studentrule_4_1()) : studlist.sort(Studentrule_4_2());
    }

    //将容器中内容写入文件中
    ofsallMess();

    cout << "已排序" << endl;
}

//向中间插入学生数据
void stuSys::InsertMess()
{
    string instudnum = "0";
    L1:
    cout << "请输入需要插入在学生前面的该学生的学号：" << endl;
    cin >> instudnum;
    list<Student>::const_iterator it;
    for (it = studlist.begin(); it != studlist.end(); it++)
        if (instudnum == it->num) break;

        //如果it==容器末尾迭代器了，则说明没有找到该学号
        if (it == studlist.end())
        {
            cout << "没有找到该学号" << endl;
            goto L1;
        }

        //创建一个学生结点，将该结点信息，插入到容器中
        Student student;

        L2:
    //输出提示信息，并输入学生信息
    cout << "学号：		"; cin >> student.num;

    //读入学号时，遍历所有的学生学号信息，如果学号相同则输出提示并重新输入
    for (list<Student>::const_iterator it = studlist.begin(); it != studlist.end(); it++)
        if (it->num == student.num)
        {
            cout << "学号信息重复，请重新输入：" << endl;
            goto L2;	//返回到输入的地方
        }

    //输入这个学生的信息
    cout << "姓名：		"; cin >> student.name;
    cout << "年龄：		"; cin >> student.age;
    cout << "语文成绩：	"; cin >> student.ChineseScore;
    cout << "数学成绩：	"; cin >> student.MathScore;
    cout << "英语成绩：	"; cin >> student.EnglishScore;

    //将该结点插入到容器中
    studlist.insert(it, student);

    //将容器中内容写入文件中
    ofsallMess();
    cout << "已插入" << endl;
}

//删除学生的数据
void stuSys::DeteleMess()
{
    char key = '0';
    cout << "输入1代表按学号删除单个学生数据，其他代表按姓名删除所有学生数据" << endl;
    cin >> key;

    if (key == '1')        //从容器中查找和需要删除和学生的学号一样的学号，找到则删除，并刷新文件内容
        {
        string detestunum;
        cout << "请输入需要删除的学生的学号：" << endl;
        cin >> detestunum;
        for (list<Student>::const_iterator it = studlist.begin(); it != studlist.end(); it++)
            if (it->num == detestunum)
            {
                studlist.erase(it);
                ofsallMess();
                cout << "已删除" << endl;
                return;
            }
        cout << "没有找到该学号的学生" << endl;
        }
    else
    {
        string detestuname;
        cout << "请输入需要删除的学生的姓名：" << endl;
        cin >> detestuname;
        bool sign = false;

        //遍历容器寻找与需要删除姓名的学生相同名的学生，找到了则删除
        for (list<Student>::const_iterator it = studlist.begin(); it != studlist.end(); it++)
            if (it->name == detestuname)
            {
                it = studlist.erase(it);
                if (it->name == detestuname) it = studlist.erase(it);
                if (it->name == detestuname) it = studlist.erase(it);
                if (it->name == detestuname) it = studlist.erase(it);
                if (it->name == detestuname) it = studlist.erase(it);
                ofsallMess();	//刷新文件
                sign = true;
            }
        //输出提示信息
        if(!sign)
            cout << "没有找到该姓名的学生" << endl;
        else
            cout << "已删除" << endl;
    }
}

//修改学生的信息
void stuSys::ModifyMess()
{
    string Modstudentnum;
    L1:
    cout << "请输入需要修改的学生的学号：" << endl;
    cin >> Modstudentnum;

    //接收学号后，先遍历一遍容器查看是否有该学号，如果没有则重新输入
    list<Student>::const_iterator it;
    for (it = studlist.begin(); it != studlist.end(); it++)
        if (it->num == Modstudentnum) break;
        if (it == studlist.end())
        {
            cout << "没有找到该学号";
            goto L1;
        }

        //修改迭代器指向结点的值
        for (list<Student>::iterator it = studlist.begin(); it != studlist.end(); it++)
            if (it->num == Modstudentnum)
            {
                //先输出原信息
                cout << endl << "该学生原信息：" << endl << endl;
                cout << "学号：		" << it->num << endl;
                cout << "姓名：		" << it->name << endl;
                cout << "年龄：		" << it->age << endl;
                cout << "语文成绩：	" << it->ChineseScore << endl;
                cout << "数学成绩：	" << it->MathScore << endl;
                cout << "英语成绩：	" << it->EnglishScore << endl << endl;
                //再修改
                cout << "需要修改信息：" << endl << endl;
                cout << "学号：		"; cin >> it->num;
                cout << "姓名：		"; cin >> it->name;
                cout << "年龄：		"; cin >> it->age;
                cout << "语文成绩：	"; cin >> it->ChineseScore;
                cout << "数学成绩：	" << it->MathScore << endl;
                cout << "英语成绩：	" << it->EnglishScore << endl << endl;
                break;
            }

        //刷新文件中的信息
        ofsallMess();
            cout << endl << "已修改" << endl;
}

//统计学生数据
void stuSys::StatMess()
{
    //功能：返回学生的总个数
    //所有学生各成绩的总分、平均分
    //年龄和、平均年龄

    int ChineseScoresum = 0, mathscoresum = 0, Englishscoresum = 0;	//成绩和
    int ChineseScoreave, mathscoreave, Englishscoreave;	//成绩平均值
    int agesum = 0, ageave, num = 0;	//年龄和、年龄平均值、学生数
    for (list<Student>::iterator it = studlist.begin(); it != studlist.end(); it++)
    {
        //将语文成绩转换为数字
        int Chinesetemp;
        stringstream ss_1;
        ss_1 << it->ChineseScore;
        ss_1 >> Chinesetemp;

        ChineseScoresum += Chinesetemp;		//统计语文成绩和

        //将数学成绩转换为数字
        int Mathtemp;
        stringstream ss_2;
        ss_2 << it->MathScore;
        ss_2 >> Mathtemp;

        mathscoresum += Mathtemp;	//统计数学成绩和

        //将英语成绩转换为数字
        int Englishtemp;
        stringstream ss_3;
        ss_3 << it->EnglishScore;
        ss_3 >> Englishtemp;

        Englishscoresum += Englishtemp;	//统计英语成绩和

        //将年龄转换为数字
        int Agetemp;
        stringstream ss_4;
        ss_4 << it->age;
        ss_4 >> Agetemp;

        agesum += Agetemp;			//统计年龄和

        num++;
    }

    //语文平均成绩
    ChineseScoreave = ChineseScoresum / num;

    //数学平均成绩
    mathscoreave = mathscoresum / num;

    //英语平均成绩
    Englishscoreave = Englishscoresum / num;

    //平均年龄
    ageave = agesum / num;

    cout << "总学生数：" << num << endl << endl;
    cout << "语文平均成绩：" << ChineseScoreave << "  语文总成绩：" << ChineseScoresum << endl << endl;
    cout << "数学平均成绩：" << mathscoreave << "  数学总成绩：" << mathscoresum << endl << endl;
    cout << "英语平均成绩：" << Englishscoreave << "  英语总成绩：" << Englishscoresum << endl << endl;
    cout << "平均年龄：" << ageave << endl << endl;
}

//主函数
int main()
{
    //设置控制台标题
    system("title C++ 学生信息管理系统");

    //创建管理系统对象
    stuSys stuSys;

    //key接收一个值，根据key的值执行不同的功能
    char key = '0';
    cout << endl << "请输入需要执行的功能：" << endl;
    cin >> key;
    cout << endl;

    while (true)
    {
        switch (key)
        {
            case '1':		//添加学生信息
            cout << "自动循环添加数据，结束添加请输入-1" << endl << endl;
            while (stuSys.AddMess());
            cout << endl << "已添加" << endl << endl;
            break;
            case '2':		//输出所有信息
            stuSys.PrintMess();
            break;
            case '3':		//查找 姓名||学号
            stuSys.FindMess();
            break;
            case '4':		//排序 学号、语文成绩、数学成绩、升序、降序
            stuSys.SortMess();
            break;
            case '5':		//在中间插入学生数据
            stuSys.InsertMess();
            break;
            case '6':		//删除学生的数据
            stuSys.DeteleMess();
            break;
            case '7':		//修改学生的数据
            stuSys.ModifyMess();
            break;
            case '8':		//修改学生的数据
            stuSys.StatMess();
            break;
            case '9':		//退出程序
            return 0;
        }

        system("pause");

        system("cls");			//每次功能执行完，清屏，输出提示信息
        stuSys.Hint();

        //功能执行完毕，key再接收一个值
        cout << endl << "请输入需要执行的功能：" << endl;
        cin >> key;
        cout << endl;
    }

}