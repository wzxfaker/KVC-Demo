//
//  XPerson.h
//  KVC Demo
//
//  Created by admin on 2018/1/30.
//  Copyright © 2018年 gcg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "XAcount.h"

@interface XPerson : NSObject

/** <##> */
@property (nonatomic, assign) CGFloat age;
/** <##> */
@property (nonatomic, strong) XAcount *acount;


@end
