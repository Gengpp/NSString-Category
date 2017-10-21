//
//  NSString+Category.h
//  NSStringCategory
//
//  Created by 马金丽 on 17/10/21.
//  Copyright © 2017年 majinli. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Category)


#pragma mark - 常用字符串处理
/**
 字符串判空

 @param string 被判断的字符串
 @return YES:是空 NO:非空
 */
+ (BOOL)isBlankString:(NSString *)string;



/**
 截取索引后几个字符串

 @param string 原字符串
 @param formIndex 索引
 @return 截取之后的字符串
 */
+ (NSString *)string:(NSString *)string safeSubstringFormIndex:(NSUInteger)formIndex;


/**
 截取索引之前的几个字符串

 @param string 原字符串
 @param toIndex 索引
 @return 截取后的字符串
 */
+ (NSString *)string:(NSString *)string safeSubstringToIndex:(NSUInteger)toIndex;


/**
 截取某区间的字符串
 
 @param string 原字符串
 @param range 区间
 @return 截取后的字符串
 */
+ (NSString *)string:(NSString *)string safeSubstringWithRange:(NSRange)range;



/**
 拼接字符串

 @param string  原字符串
 @param aString 拼接的字符串
 @return 拼接之后的字符串
 */
+ (NSString *)string:(NSString *)string safeStringByAppendingString:(NSString *)aString;


#pragma mark - MD5加密
/**
 字符串进行MD5加密

 @param string 原字符串
 @return 加密后的字符串
 */
+ (NSString *)md5WithString:(NSString *)string;

#pragma mark - 验证特殊号码


/**
 判断是否是有效的电话号码

 @param string 原字符串
 @return YESorNO
 */
+ (BOOL)isValidMobileNumber:(NSString *)string;


/**
 判断是否是有效的真事姓名

 @param string 原字符串
 @return YESorNO
 */
+ (BOOL)isValiedRealName:(NSString *)string;



/**
 是否全是中文

 @param string 原字符串
 @return YESorNO
 */
+ (BOOL)isOnlyChinese:(NSString *)string;


/**
 是否是有效的银行卡

 @param string 原字符串
 @return YESorNO
 */
+ (BOOL) isValidBankCardNumber:(NSString *)string;


/**
 是否是有效的邮箱

 @param string 原字符串
 @return YESorNO
 */
+ (BOOL) isValidEmail:(NSString *)string;

//15位

/**
 检测有效身份证
 @param string 原字符串
 @return YESorNO
 */
//15
+ (BOOL) isValidIdentifyFifteen:(NSString *)string;

//18位
+ (BOOL) isValidIdentifyEighteen:(NSString *)string;


/**
 限制只能输入数字

 @param string 原字符串
 @return YESorNO
 */
+ (BOOL) isOnlyNumber:(NSString *)string;


@end
