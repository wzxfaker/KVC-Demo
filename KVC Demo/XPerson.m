//
//  XPerson.m
//  KVC Demo
//
//  Created by admin on 2018/1/30.
//  Copyright © 2018年 gcg. All rights reserved.
//

#import "XPerson.h"

@implementation XPerson

- (instancetype)init{
    if (self = [super init]) {
        self.acount.balance = 100;
    }
    return self;
}

//当对象调用valueForKey:@""方法时，如果有此属性就直接调用getter方法；如果没有的话就按照下边的顺序去调用方法，知道最后调用valueForUndefiendKey:@""方法
/*
- (NSString *)getName{
    NSLog(@"%s",__func__);
    return @"X_Zed";
}

- (NSString *)name{
    NSLog(@"%s",__func__);
    return @"X_Zed";
}

- (NSString *)isName{
    NSLog(@"%s",__func__);
    return @"X_Zed";
}


//数组搜索的两个方法，因为系统也不清楚返回的到底是什么类型的数据
- (NSUInteger)countOfName{
    NSLog(@"%s",__func__);
    return 1;
}

- (id)objectInNameAtIndex:(NSUInteger)index{
    NSLog(@"%s",__func__);
    return @"X_Zed";
}
*/
- (id)valueForUndefinedKey:(NSString *)key{
    NSLog(@"%s",__func__);
    return @"X_zed";
}

- (void)setAcount:(XAcount *)acount{
    _acount = acount;
}

@end
