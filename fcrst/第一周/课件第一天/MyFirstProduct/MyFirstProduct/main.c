//
//  main.c
//  MyFirstProduct
//
//  Created by 孙 化育 on 15-7-14.
//  Copyright (c) 2015年 孙 化育. All rights reserved.
//  At KFC,we do chicken right.
//  烹鸡专家，尽在肯德基

    //  双斜杠开头的代码表示注释，注释不参与程序的编译，仅仅是对代码的解释和标记。
    //  command+/  注释多行代码。

    //多行注释   /*开头   */结尾
/*asldkj oasdj oij oif
 sdfk jsdifjsodifj osidf 
 sdf isjdf ilsdjf 
 */




    //#include表示导入头文件，表示在本文件中需要使用这个头文件。
#include <stdio.h>
#include <stdlib.h>

    //int main 表示程序的主函数，也是程序的入口.
int main(int argc, const char * argv[]) {
//        //printf输出一段文本。
//    printf("Hello, World!\n");
//    
//        // \n表示换行符
//    printf("你好\n");
//    
//        //int，整形， 表示一个整数。
//        //定义了一个int型的变量。
//    int a;
//        //scanf输入一段内容,%d,整形的占位符。
//        //输入一段内容，并把它存入变量a
//    printf("请输入两个数字\n");
//    
//    scanf("%d",&a);
//    
//    int b;
//    scanf("%d",&b);
//        //++使一个变量自增1
//        //a++;
//    
//        //= 在计算机语言中不表示相等，而是赋值，作用是把等号右边的值交给等号左边的变量。
//        //a = a+5;
//        //a+=5;//就相当于a = a+5;
//    
//        //*表示乘法
//        //  /表示除法取商
//        //  %表示除法取余
//    int c = a+b;
//    printf("两个数字和是%d\n",c);
    
//    printf("请输入女士的年龄\n");
//    
//    int age;
//    
//    scanf("%d",&age);
//    
//        //if 判断语句，如果判断条件为真，那么执行if括号中的代码，如果为假，则执行else括号中的代码
//    if (age<3) {
//        printf("婴幼儿\n");
//    }else if (age<12){
//        printf("小萝莉\n");
//    }else if (age<20){
//        printf("少女\n");
//    }else if (age<30){
//        printf("少妇\n");
//    }else if (age<40){
//        printf("阿姨\n");
//    }else{
//        printf("妇女\n");
//    }
    
    
    
        //arc4random()生成一个随机整数，如果要生成一个小于n的整数，那么对n+1取余即可。
    int number = arc4random()%101;
    
        //printf("%d\n",number);
    
    printf("请输入您猜测的数字，范围0-100\n");
    
    int inputNumber;
    
        //for循环，循环执行语句。
        //int i = 0 循环控制变量
        //i<3   循环执行条件(满足条件时执行循环代码)
        //i++   单次循环结束后，循环控制变量的改变代码
    for (int i = 0; i<5;i++) {
        printf("您还有%d次机会\n",5-i);
        scanf("%d",&inputNumber);
            //在c语言中，==表示相等判断。
        if (inputNumber == number) {
            
            printf("恭喜您答对了\n");
                //break退出循环
            break;
        }else{
            if (inputNumber>number) {
                printf("猜大了");
            }else{
                printf("猜小了");
            }
        }
    }

    
   //    scanf("%d",&inputNumber);
//    
//        //while循环，当判断语句为真时执行循环语句，循环结束后再次判断，为真时再次执行，直到判断语句为假时退出循环。
//    while (inputNumber != number) {
//        if (inputNumber>number) {
//            printf("猜大了\n");
//        }else{
//            printf("猜小了\n");
//        }
//        
//        scanf("%d",&inputNumber);
//    }
//    
//    printf("恭喜你猜对了");
    
    
    return 0;
}









