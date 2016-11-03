//
//  LZHMyView.m
//  3DTouch
//
//  Created by 刘志恒 on 16/10/27.
//  Copyright © 2016年 Jack. All rights reserved.
//

#import "LZHMyView.h"

@interface LZHMyView()

@property(nonatomic,strong)UIBezierPath *path;

@end

@implementation LZHMyView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {

    [[UIColor orangeColor] set];
    
    [self.path fill];
    


}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    
    //获取触摸对象
    UITouch *t = touches.anyObject;
#pragma mark 在iOS9之后 添加了force属性 t.force
//    NSLog(@"%f",t.force);
    //创建路径 根据不同的压力  压力*系数 = 半径 手指的位置为圆心画圆
    
    //创建路径
    
    UIBezierPath *path = [[UIBezierPath alloc]init];
    
    [path addArcWithCenter:[t locationInView:self] radius:t.force*20 startAngle:0 endAngle:2*M_PI clockwise:YES];
    
    self.path = path;
    //重绘
    [self setNeedsDisplay];
}

@end
