#include<iostream> //coutͷ�ļ�
#include "windows.h" //syetenͷ�ļ�
using namespace std;
VOID displasy(bool bhello)
{
	if (bhello)
		cout<<"Hello World!\n";
	else
		cout<<"Reverse Me!\n";
}
int main(int argc, char* argv[])
{
	bool bFlag=true ;
	displasy(bFlag);
	system("pause"); //ϵͳ����pause,����Ļ���press any key
	return 0;
}
