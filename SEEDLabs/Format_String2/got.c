/*
* 如果获得环境变量的程序和攻击的程序的文件名长度不一样，环境变量的地址
* 会发生偏移。因此，要么令两个程序的文件名长度相等（推荐），要么考虑偏
* 移来计算环境变量地址。
* gcc -z execstack -o got got.c
*/
#include <stdio.h>
#include <string.h>

int flag = 0x4271;
int main(int argc, char **argv)
{
    char buf[1024];

    strncpy(buf, argv[1], sizeof(buf) - 1);
    printf("\n%p\n", &flag);
    printf(buf);
    if (4271 == flag)
    {
        puts("done");
        exit(0);
    }
}