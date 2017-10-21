//
//  ViewController.m
//  NSStringCategory
//
//  Created by 马金丽 on 17/10/21.
//  Copyright © 2017年 majinli. All rights reserved.
//

#import "ViewController.h"
#import "NSString+Category.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)NSMutableArray *titleArray;
@property(nonatomic,copy)NSString *contentStr;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    [self.titleArray addObject:@"字符串判空"];
    [self.titleArray addObject:@"截取索引之后的字符串"];
    [self.titleArray addObject:@"截取索引之前的字符串"];
    [self.titleArray addObject:@"截取某区间的字符串"];
    [self.titleArray addObject:@"拼接字符串"];
    [self.titleArray addObject:@"MD5加密"];
    [self.titleArray addObject:@"判断电话号码是否合理"];
    [self.titleArray addObject:@"判断是否是真实姓名"];
    [self.titleArray addObject:@"判断是否是只有中文"];
    [self.titleArray addObject:@"判断是否是合理的银行卡号"];
    [self.titleArray addObject:@"判断是否是有效的邮箱"];
    [self.titleArray addObject:@"判断是否是有效的身份证"];
    [self.titleArray addObject:@"限制只能输入数字"];

    _mainTableView.delegate = self;
    _mainTableView.dataSource = self;
    
    [_mainTableView reloadData];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _titleArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = [_titleArray objectAtIndex:indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSString *resultStr = nil;
    if (indexPath.row == 0) {
        
        _contentStr = nil;
        BOOL isBlank = [NSString isBlankString:_contentStr];
        if (isBlank) {
            NSLog(@"空");
        }else{
            NSLog(@"非空");
        }
    }else if (indexPath.row == 1){
        _contentStr = @"今天星期六,天气很好";
        resultStr = [NSString string:_contentStr safeSubstringFormIndex:5];
    }else if (indexPath.row == 2){
        _contentStr = @"今天星期六,天气很好";
        resultStr = [NSString string:_contentStr safeSubstringToIndex:5];

    }else if (indexPath.row == 3){
        _contentStr = @"今天星期六,天气很好";
        resultStr = [NSString string:_contentStr safeSubstringWithRange:NSMakeRange(0, 5)];
    }else if (indexPath.row == 4){
        _contentStr = @"今天星期六,天气很好";
        resultStr = [NSString string:_contentStr safeStringByAppendingString:@"明天星期几"];

    }else if (indexPath.row == 5){
        _contentStr = @"马金丽";
        resultStr = [NSString md5WithString:_contentStr];
    }else if (indexPath.row == 6){
        
        _contentStr = @"15237155555";
        BOOL isValid = [NSString isValidMobileNumber:_contentStr];
        if (isValid) {
            NSLog(@"电话号码合理");
        }else{
            NSLog(@"电话号码不合理");
        }
    }else if (indexPath.row == 7){
        _contentStr = @"夏目贵志0000";

        BOOL isValid = [NSString isValiedRealName:_contentStr];
        if (isValid) {
            NSLog(@"是");
        }else{
            NSLog(@"不是");
        }
    }else if (indexPath.row == 8){
        _contentStr = @"夏目贵志0000dsassdd";
        
        BOOL isValid = [NSString isOnlyChinese:_contentStr];
        if (isValid) {
            NSLog(@"是");
        }else{
            NSLog(@"不是");
        }
    }else if (indexPath.row == 9){
        _contentStr = @"41****************025333333333333333";
        BOOL isValid = [NSString isValidBankCardNumber:_contentStr];
        if (isValid) {
            NSLog(@"银行卡号是");
        }else{
            NSLog(@"银行卡号不是");
        }
    }else if (indexPath.row == 10){
        _contentStr = @"641271708@qq.com";
        BOOL isValid = [NSString isValidEmail:_contentStr];
        if (isValid) {
            NSLog(@"邮箱是");
        }else{
            NSLog(@"邮箱不是");
        }
    }else if (indexPath.row == 11){
        _contentStr = @"4342666666`122222222222222222";
        BOOL isValid = [NSString isValidIdentifyFifteen:_contentStr];
        if (isValid) {
            NSLog(@"身份证是");
        }else{
            NSLog(@"身份证不是");
        }
    }else if (indexPath.row == 12){
        _contentStr = @"64188888889hhhhhhh";
        BOOL isValid = [NSString isOnlyNumber:_contentStr];
        if (isValid) {
            NSLog(@"是");
        }else{
            NSLog(@"不是");
        }
    }
    else{
       
    }
    NSLog(@"%@",resultStr);

}

- (NSMutableArray *)titleArray
{
    if (!_titleArray) {
        _titleArray = [[NSMutableArray alloc]init];
    }
    return _titleArray;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
