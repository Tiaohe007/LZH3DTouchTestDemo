//
//  LZHModel.h
//  3DTouch
//
//  Created by 刘志恒 on 16/10/27.
//  Copyright © 2016年 Jack. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LZHModel : NSObject

@property(nonatomic,copy)NSString *name;

@property(nonatomic,copy)NSString *url;

-(instancetype)initWithDict:(NSDictionary *)dict;

+(instancetype)modelWithDict:(NSDictionary *)dict;

@end
