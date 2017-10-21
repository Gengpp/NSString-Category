//
//  NSString+Category.m
//  NSStringCategory
//
//  Created by 马金丽 on 17/10/21.
//  Copyright © 2017年 majinli. All rights reserved.
//

#import "NSString+Category.h"

#import <CommonCrypto/CommonDigest.h>
@implementation NSString (Category)



+ (BOOL)isBlankString:(NSString *)string{
    
    NSString *resultStr = [string description];
    if ([resultStr isEqualToString:@"NULL"] || [string isKindOfClass:[NSNull class]] || [string isEqual:[NSNull null]] || [resultStr isEqual:NULL] || [[resultStr class] isSubclassOfClass:[NSNull class]] || resultStr == nil || resultStr == NULL || [[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length] == 0 || [resultStr isEqualToString:@"<null>"] || [string isEqualToString:@"(null)"]) {
        return  YES;
    }else{
        return NO;
    }
    
}


+ (NSString *)string:(NSString *)string safeSubstringFormIndex:(NSUInteger)formIndex
{
    if (formIndex > string.length) {
        return nil;
    }else{
        return [string substringFromIndex:formIndex];
    }
}


+ (NSString *)string:(NSString *)string safeSubstringToIndex:(NSUInteger)toIndex
{
    if (toIndex > string.length) {
        return nil;
    }else{
        return [string substringToIndex:toIndex];
    }
}

+ (NSString *)string:(NSString *)string safeSubstringWithRange:(NSRange)range
{
    NSUInteger location = range.location;
    NSUInteger length = range.length;
    if (location + length > string.length) {
        return nil;
    }else{
        return [string substringWithRange:range];
    }
}

+ (NSString *)string:(NSString *)string safeStringByAppendingString:(NSString *)aString
{
    if (aString == nil) {
        return [string stringByAppendingString:@""];
    } else {
        return [string stringByAppendingString:aString];
    }
}


+ (NSString *)md5WithString:(NSString *)string
{
    if (string == nil || [string length] == 0) {
        return nil;
    }
    const char *value = [string UTF8String];
    unsigned char  outputBuffer[CC_MD5_DIGEST_LENGTH];
    CC_MD5(value, (CC_LONG)strlen(value), outputBuffer);
    NSMutableString *outputString = [[NSMutableString alloc]initWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for (NSInteger count = 0; count < CC_MD5_DIGEST_LENGTH; count ++ ) {
        [outputString appendFormat:@"%02x",outputBuffer[count]];
    }
    return outputString;
}


+ (BOOL)isValidMobileNumber:(NSString *)string
{
    NSString *const mobile = @"^1(3|4|5|7|8)\\d{9}$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",mobile];
    return [predicate evaluateWithObject:string];
}

+ (BOOL)isValiedRealName:(NSString *)string
{
    NSString *nicknameRegex = @"^[\u4e00-\u9fa5]{2,8}$";
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",nicknameRegex];
    
    return [predicate evaluateWithObject:string];
}


+ (BOOL)isOnlyChinese:(NSString *)string
{
    NSString * chineseTest=@"^[\u4e00-\u9fa5]{0,}$";
    NSPredicate*chinesePredicate=[NSPredicate predicateWithFormat:@"SELF MATCHES %@",chineseTest];
    return [chinesePredicate evaluateWithObject:string];
}


+ (BOOL)isValidBankCardNumber:(NSString *)string
{
    NSString* const BANKCARD = @"^(\\d{16}|\\d{19})$";
    
    NSPredicate* predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", BANKCARD];
    return [predicate evaluateWithObject:string];
}

+ (BOOL)isValidEmail:(NSString *)string
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    
    return [emailTest evaluateWithObject:string];
}


+ (BOOL)isValidIdentifyFifteen:(NSString *)string
{
    NSString * identifyTest=@"^[1-9]\\d{7}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}$";
    NSPredicate*identifyPredicate=[NSPredicate predicateWithFormat:@"SELF MATCHES %@",identifyTest];
    return [identifyPredicate evaluateWithObject:string];
}

+ (BOOL)isValidIdentifyEighteen:(NSString *)string
{
    NSString * identifyTest=@"^[1-9]\\d{5}[1-9]\\d{3}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}([0-9]|X)$";
    NSPredicate*identifyPredicate=[NSPredicate predicateWithFormat:@"SELF MATCHES %@",identifyTest];
    return [identifyPredicate evaluateWithObject:string];
}


+ (BOOL) isOnlyNumber:(NSString *)string
{
    BOOL res = YES;
    NSCharacterSet* tmpSet = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
    int i = 0;
    while (i < string.length) {
        NSString * resultstring = [string substringWithRange:NSMakeRange(i, 1)];
        NSRange range = [resultstring rangeOfCharacterFromSet:tmpSet];
        if (range.length == 0) {
            res = NO;
            break;
        }
        i++;
    }
    
    return res;
}
@end
