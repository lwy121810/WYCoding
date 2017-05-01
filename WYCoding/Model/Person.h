//
//  Person.h
//  WYArchiver
//
//  Created by 李卫友 on 2017/4/21.
//  Copyright © 2017年 李卫友. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"
#import <UIKit/UIKit.h>
@interface Person : NSObject
@property (nonatomic , copy) NSString *name;
@property (nonatomic , assign) NSInteger age;
@property (nonatomic , assign) long longValue;
@property (nonatomic , assign) double doub;
@property (nonatomic , assign) NSUInteger uint;
@property (nonatomic , strong) NSArray *titles;
@property (nonatomic , strong) Student *stu;
@property (nonatomic , copy) NSDictionary *data;
@property (nonatomic , assign) CGFloat floatNumber;

@end
