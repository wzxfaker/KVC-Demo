//
//  XAnimal.m
//  KVC Demo
//
//  Created by admin on 2018/1/30.
//  Copyright © 2018年 gcg. All rights reserved.
//

#import "XAnimal.h"

@interface XAnimal (){
    NSString *_name;
    NSString *_isName;
    NSString *name;
    NSString *isName;
}

@end

@implementation XAnimal

- (void)printName{
    NSLog(@"_name:%@",_name);
    NSLog(@"_isName:%@",_isName);
    NSLog(@"name:%@",name);
    NSLog(@"isName:%@",isName);
}

//默认返回YES，如果重写此方法返回NO，则会执行setValue：forUndefinedKey:方法
+ (BOOL)accessInstanceVariablesDirectly{
    return YES;
//    return NO;//执行setValue：forUndefinedKey:方法
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    NSLog(@"%s",__func__);
}

@end
