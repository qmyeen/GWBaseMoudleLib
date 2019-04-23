//
//  NSString+GWWebErrorCode.m
//  SuperGWLibray
//
//  Created by QMY on 2019/4/22.
//  Copyright © 2019 gwm. All rights reserved.
//

#import "NSString+GWWebErrorCode.h"

@implementation NSString (GWWebErrorCode)

/**
 *  生成错误码信息（根据协议错误码定义）
 *
 *  @return 错误信息字典集
 */
-(NSDictionary *)ADcreateBaseWebErrorCodeAndMessage
{
    NSMutableDictionary *errorCodeAndMessage = [[NSMutableDictionary alloc] initWithCapacity:10];
    
    [errorCodeAndMessage setObject:@"成功" forKey:GWk_1000];
    NSDictionary *returnDic = [[NSDictionary alloc] initWithDictionary:errorCodeAndMessage];
    return returnDic;
}
/*!
 *  通过服务器传过来的ResulteMessage返回错误信息
 *
 *  @return 错误信息
 */
-(NSString *)GWErrorCode
{
    NSDictionary *dic = [[NSDictionary alloc] init];
    dic = [self ADcreateBaseWebErrorCodeAndMessage];
    
    NSString *errorStr = @"";
    errorStr = dic[self];
    
    return errorStr;
}
@end
