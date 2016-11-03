//
//  LZHModel.m
//  3DTouch
//
//  Created by 刘志恒 on 16/10/27.
//  Copyright © 2016年 Jack. All rights reserved.
//

#import "LZHModel.h"

@implementation LZHModel

-(instancetype)initWithDict:(NSDictionary *)dict{
    
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+(instancetype)modelWithDict:(NSDictionary *)dict{

    return  [[self alloc]initWithDict:dict];
}

@end
