#include <stdio.h>
#include <stdlib.h>
#include "libzplay.h"
// ����lib,���򱨴� LNK2019 �޷��������ⲿ����
#pragma comment(lib,"libzplay.dll")


void prompt(int statevalue)
{
	printf("��ǰ����״̬��");
	switch (statevalue)
	{
	case 1:
		printf("����");
		break;
	case 2:
		printf("��ͣ");
		break;
	case 3:
		printf("ֹͣ");
		break;
	default:
		break;
	}
	printf("\n������������ţ�\n���ţ�1����ͣ��2��ֹͣ��3:");
}

int main()
{
	ZPLAY_HANDLE player = zplay_CreateZPlay(); // ����ʵ����libzplay���������Դ
	zplay_OpenFile(player, "homeland.mp3", sfAutodetect); //�������ļ�
	zplay_Play(player); // ���������ļ�

	int statevalue = 1; //�������ֲ���״̬����ʼʱ����
	prompt(1);
	while (scanf_s("%d",&statevalue))
	{
		switch (statevalue)
		{
		case 1:
			zplay_Play(player);
			prompt(1);
			break;
		case 2:
			zplay_Pause(player); // ��ͣ���ֲ���
			prompt(2);
			break;
		case 3:
			zplay_Stop(player); // ֹͣ���ֲ���
			goto outexit; // ����ֹͣ����������ر��ļ�����Դ����
			prompt(3);
			break;
		default:
			break;
		}
	}
	outexit:
	zplay_Close(player); //�رղ��ٲ��ŵ������ļ�
	zplay_DestroyZPlay(player);//����libzplay����ĸ�����Դ

	system("pause");
	return 0;
}