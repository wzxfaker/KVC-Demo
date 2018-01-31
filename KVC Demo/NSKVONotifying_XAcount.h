//
//  NSKVONotifying_XAcount.h
//  KVC Demo
//
//  Created by admin on 2018/1/31.
//  Copyright © 2018年 gcg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "XAcount.h"

//build phase中去掉此类，没有让其进行编译，否则会崩溃；通过创建此类验证KVO的底层机制
@interface NSKVONotifying_XAcount : XAcount


@end
