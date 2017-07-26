//
//  main.c
//  GeShuiJiSuanQi
//
//  Created by 孙 化育 on 15-7-15.
//  Copyright (c) 2015年 孙 化育. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[]) {
    
    while (1) {
        printf("请输入您的工资\n");
        
        int gongzi;
        
        scanf("%d",&gongzi);
        
            //如果工资小于3500，不需要缴税
        if (gongzi<=3500) {
            printf("您的工资太低了，不需要缴税");
        }else{
                //如果工资大于3500，那么先计算应纳税额。
            int yingnashuie = gongzi - 3500;
                //根据应纳税额的数量，选择不同的税率
            
                //float，浮点型，表示小数.
            float shuilv;
            int susuankouchu;
            
            if (yingnashuie<=1500) {
                shuilv = 0.03;
                susuankouchu = 0;
            }else if (yingnashuie<=4500){
                shuilv = 0.1;
                susuankouchu = 105;
            }else if (yingnashuie<=9000){
                shuilv = 0.2;
                susuankouchu = 555;
            }else if (yingnashuie<=35000){
                shuilv = 0.25;
                susuankouchu = 1005;
            }else if (yingnashuie<=55000){
                shuilv = 0.3;
                susuankouchu = 2755;
            }else if (yingnashuie<=80000){
                shuilv = 0.35;
                susuankouchu = 5505;
            }else{
                shuilv = 0.45;
                susuankouchu = 13505;
            }
            
                //整形乘以浮点型，结果也是浮点型。
            float shui = yingnashuie*shuilv-susuankouchu;
            
                //%f是浮点型占位符，%.2f表示小数部分保留几位。
            printf("应纳税%.2f元\n",shui);
        }
    }
    
    
    
    return 0;
}













