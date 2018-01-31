//
//  ViewController.m
//  KVC Demo
//
//  Created by admin on 2018/1/30.
//  Copyright © 2018年 gcg. All rights reserved.
//

#import "ViewController.h"
#import "XPerson.h"
#import "XAnimal.h"

@interface ViewController ()

/** <##> */
@property (nonatomic, strong) XPerson *person;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //KVC简称KeyValueCoding，是一个基于NSKeyValueCoding非正式协议的机制，就是直接通过key值对对象的属性进行存取操作，而不是通过明确的存取方法setter/getter，简而言之也就是一系列规则和方法进行的存取操作
    /*
     利用KVC可以修改类的私有变量，可以修改IOS隐藏一些属性，如UITextField的placeHolderText默认style在需求中达不到要求，我们可以直接通过KVC快速定义自己的style,代码如下：
     [textField setValue:[UIColor redColor] forKeyPath:@"placeholderLabel.textColor"];
     */
    
    
    //取值操作
    XPerson *person = [[XPerson alloc] init];
    NSLog(@"%@",[person valueForKey:@"age"]);//如果有该属性，则会调用-(CGFloat)age;方法获取
    NSLog(@"%@",[person valueForKey:@"name"]);//如果没有该属性，则会调用一系列相关方法，最后调用valueForUndefinedKey
    //[person.acount setValue:@"666" forKey:@"balance"];
    XAcount *acount = [[XAcount alloc] init];
    acount.balance = 100;
    person.acount = acount;
    [person.acount addObserver:self forKeyPath:@"balance" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
    _person = person;
    
    
    
    
    //赋值操作
    /*
     调用setValue：forkey：代码时，底层的执行机制：程序会去找setName：属性值方法，如果没有找到setName：方法，KVC机制会检查（BOOL）accessInstanceVariablesDirectly方法有没有返回YES，系统默认是返回YES的，但我们可以重写该方法，返回NO，如果是返回NO，没找到setName方法，那么系统就会执行setValue：ForUndefineKey：方法，系统抛出异常，程序Crash。返回YES，继续搜索类里面成员变量，搜索顺序依次是_name、_isName、name、isName，如果找了相应变量，就停止寻找，对该变量进行修改。
     */
    XAnimal *animal = [[XAnimal alloc] init];
    [animal setValue:@"tiger" forKey:@"name"];
    [animal printName];
    
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    NSLog(@"变化了--%@",change);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    self.person.acount.balance = 666;
}

- (void)dealloc{
    [self.person.acount removeObserver:self forKeyPath:@"balance"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
