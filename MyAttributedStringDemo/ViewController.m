//
//  ViewController.m
//  MyAttributedStringDemo
//
//  Created by apple on 15/6/23.
//  Copyright (c) 2015年 youngsoft. All rights reserved.
//

#import "ViewController.h"
#import "MyAttributedStringBuilder.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 12;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 7)
        return 100;
    return 44;
}


// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell1" forIndexPath:indexPath];
    
    MyAttributedStringBuilder *builder = nil;
    
    switch (indexPath.row) {
        case 0:
        {
            builder = [[MyAttributedStringBuilder alloc] initWithString:@"字体设置"];
            builder.firstRange.font = [UIFont systemFontOfSize:40];
            builder.lastRange.font = [UIFont systemFontOfSize:20];
        }
            break;
        case 1:
        {
            builder = [[MyAttributedStringBuilder alloc] initWithString:@"蓝色的背景红色的文字"];
            builder.allRange.backgroundColor = [UIColor blueColor];
            builder.allRange.textColor = [UIColor redColor];
        }
            break;
        case 2:
        {
            builder = [[MyAttributedStringBuilder alloc] initWithString:@"中间的文字中空"];
            [builder range:NSMakeRange(3, 2)].strokeColor = [UIColor greenColor];
            [builder range:NSMakeRange(3, 2)].strokeWidth = 2;

        }
            break;
        case 3:
        {
            builder = [[MyAttributedStringBuilder alloc] initWithString:@"删除线  和 下划线"];
            [builder includeString:@"删除线" all:NO].strikethroughStyle = 1;
            [builder includeString:@"删除线" all:NO].strikethroughColor = [UIColor redColor];
            

            [builder includeString:@"下划线" all:NO].underlineStyle = NSUnderlineStyleSingle;
            [builder includeString:@"下划线" all:NO].underlineColor = [UIColor redColor];

            
        }
            break;
        case 4:
        {
            builder = [[MyAttributedStringBuilder alloc] initWithString:@"我有阴影"];
            
            NSShadow *shadow = [[NSShadow alloc] init];
            shadow.shadowOffset = CGSizeMake(2, 2);
            shadow.shadowColor = [UIColor redColor];
            shadow.shadowBlurRadius = 2;
            
            builder.allRange.shadow = shadow;

        }
            break;
        case 5:
        {
            builder = [[MyAttributedStringBuilder alloc] initWithString:@"我是胖子 和 我是廋子  和  我歪了"];
            [builder includeString:@"我是胖子" all:NO].expansion = 1.1;
            [builder includeString:@"我是廋子" all:NO].expansion = -1.2;
            [builder includeString:@"我歪了" all:NO].obliqueness = 2;

        }
            break;
        case 6:
        {
            builder = [[MyAttributedStringBuilder alloc] initWithString:@"看我的字间距越来越宽"];
            [builder range:NSMakeRange(0, 2)].kern = -5;
            [builder range:NSMakeRange(2, 4)].kern = 7;
            [builder range:NSMakeRange(6, 3)].kern = 15;
            

        }
            break;
        case 7:
        {
            cell.textLabel.numberOfLines = 0;
            builder = [[MyAttributedStringBuilder alloc] initWithString:@"第一行\n第二行\n第三行\n"];
            builder.allRange.lineSpacing = 20;

            
        }
            break;
        case 8:
        {
            NSTextAttachment *attach = [[NSTextAttachment alloc] initWithData:nil ofType:nil];
            attach.image = [UIImage imageNamed:@"test"];
            builder = [[MyAttributedStringBuilder alloc] initWithString:@"文字\uFFFC混合排列"];
            builder.allRange.attachment = attach;
        }
            break;
        case 9:
        {
            builder = [[MyAttributedStringBuilder alloc] initWithString:@"基线偏移的文字效果"];
            [builder includeString:@"基线偏移" all:NO].baselineOffset = 3;
            [builder includeString:@"效果" all:NO].baselineOffset = -3;
            
        }
            break;
        case 10:
        {
            builder = [[MyAttributedStringBuilder alloc] initWithString:@"数字123是高亮的，456也是高亮的"];
            [builder characterSet:[NSCharacterSet  decimalDigitCharacterSet]].textColor = [UIColor greenColor];
        }
            break;
        case 11:
        {
            
            builder = [[MyAttributedStringBuilder alloc] initWithString:@"两只老虎，两只老虎 跑得快，跑得快"];
            [builder includeString:@"老虎" all:YES].textColor = [UIColor greenColor];

        }
            break;
        default:
            break;
    }
    
    cell.textLabel.attributedText = builder.commit;
    
    return cell;
}


@end
