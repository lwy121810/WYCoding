//
//  ViewController.m
//  WYCoding
//
//  Created by lwy1218 on 2017/5/1.
//  Copyright © 2017年 lwy1218. All rights reserved.
//

#import "ViewController.h"
#import "WYFileManager.h"
#import "Person.h"
#import "Teacher.h"

@interface ViewController ()
{
    UIButton *_currentModelButton;
    NSString *_currentKey;
}
- (IBAction)unarchPerson:(id)sender;
- (IBAction)archPerson:(id)sender;
- (IBAction)archTeacher:(id)sender;
- (IBAction)unarchTeacher:(id)sender;
- (IBAction)archStudent:(id)sender;
- (IBAction)unarchStudent:(id)sender;

- (IBAction)fileSizeString:(id)sender;
- (IBAction)fileSizeNumber:(id)sender;

- (IBAction)clearCache:(id)sender;



@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}



- (IBAction)archPerson:(id)sender {
    Person *person = [[Person alloc] init];
    person.name = @"personName";
    person.age = 100;
    person.titles = @[@"jack",@"mattt"];
    person.data = @{@"list":@[@{@"id":@"187",
                                @"time":@"2017.4.21"}],
                    @"success":@"ture"};
    person.longValue = 69;
    person.doub = 666.66;
    person.uint =  90;
    person.floatNumber = 10.55;
    
    Student *stu = [[Student alloc] init];
    stu.name = @"person的学生";
    stu.age = 99;
    
    person.stu = stu;
    
    NSString *filePath = [[WYFileManager getDocumentFilePath] stringByAppendingPathComponent:@"person"];
    //保存
    [WYFileManager setCustomObject:person forKey:@"person" filePath:filePath];
    
    
    _currentKey = @"person";
    _currentModelButton = sender;
}

- (IBAction)unarchPerson:(id)sender {
    
    Person *person = [WYFileManager getCustomObjectWithKey:@"person"];
    
    
    NSLog(@"person --- name: %@  age: %ld longValue: %ld doub: %ld uint: %lu floatNumber: %.2f   student`s properties name: %@ age: %ld    ", person.name , (long)person.age, person.longValue, (long)person.doub , (unsigned long)person.uint,person.floatNumber, person.stu.name, person.stu.age);
    
    
    NSDictionary *data = person.data;
    
    NSLog(@"字典  ---  %@", data);
    
    for (NSString *title in person.titles) {
        
        NSLog(@"数组· %@",title);
    }
}
- (IBAction)archTeacher:(id)sender {
    Teacher *tea = [[Teacher alloc] init];
    tea.name = @"teacherName";
    tea.age = 28;
    tea.titles = @[@"Tom",@"Jerry"];
    tea.data = @{@"list":@[@{@"id":@"110",
                                 @"time":@"2017.5.21"}],
                     @"success":@"false"};
    
    Student *stu = [[Student alloc] init];
    stu.name = @"学生";
    stu.age = 18;
    
    tea.stu = stu;
    
    tea.book = @"语文";
    
    
    [WYFileManager setCustomObject:tea forKey:@"teacher"];
    
    _currentKey = @"teacher";
    _currentModelButton = sender;
}

- (IBAction)unarchTeacher:(id)sender {
    Teacher *teacher = [WYFileManager getCustomObjectWithKey:@"teacher"];
    
    
    NSLog(@"teacher --- name: %@ book : %@ age: %ld longValue: %ld doub: %ld uint: %lu   student`s properties name: %@ age: %ld", teacher.name , teacher.book , (long)teacher.age, teacher.longValue, (long)teacher.doub , (unsigned long)teacher.uint, teacher.stu.name, teacher.stu.age);
    
    
    NSDictionary *data = teacher.data;
    
    NSLog(@"字典  ---  %@", data);
    
    for (NSString *title in teacher.titles) {
        
        NSLog(@"数组· %@",title);
    }
}

- (IBAction)archStudent:(id)sender {
    Student *stu = [[Student alloc] init];
    stu.name = @"student";
    stu.age = 100;
    
    [WYFileManager setCustomObject:stu forKey:@"student"];
    
    
    _currentKey = @"student";
    _currentModelButton = sender;
}

- (IBAction)unarchStudent:(id)sender {
    Student *student = [WYFileManager getCustomObjectWithKey:@"student"];
    
    
    NSLog(@"student --- name: %@  age: %ld", student.name , (long)student.age);
    

}

- (IBAction)fileSizeString:(id)sender {
    NSString *file = [WYFileManager getCustomObjectFilePathWithKey:_currentKey];
    [WYFileManager fileSizeWithFilePath:file fileSize:^(NSString *size) {
        
        self.label.text = [NSString stringWithFormat:@"%@的大小     %@",_currentKey, size];
        NSLog(@"字符串大小 --------  %@", size);
    }];
}

- (IBAction)fileSizeNumber:(id)sender {
    NSString *file = [WYFileManager getCustomObjectFilePathWithKey:_currentKey];
    [WYFileManager calculateFileSizeWithFilePath:file fileSize:^(unsigned long long size) {
        
        self.label.text = [NSString stringWithFormat:@"%@的大小     %llu",_currentKey, size];
        NSLog(@"数字大小 --------   %llu", size);
    }];
}

- (IBAction)clearCache:(id)sender {
    [WYFileManager clearCacheWithFilePath:[WYFileManager getDocumentFilePath] completion:^(BOOL result, NSError *error) {
        if (result) {
            NSLog(@"清除成功！");
        }
        else {
            NSLog(@"------------%@", error.localizedDescription);
        }
    }];
}
@end
