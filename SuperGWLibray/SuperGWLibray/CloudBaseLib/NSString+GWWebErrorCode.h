//
//  NSString+GWWebErrorCode.h
//  SuperGWLibray
//
//  Created by QMY on 2019/4/22.
//  Copyright © 2019 gwm. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


static NSString *GWk_1000 = @"1000";


@interface NSString (GWWebErrorCode)
/*!
 *  通过服务器传过来的ResulteMessage返回错误信息
 *
 *  @return 错误信息
 */
-(NSString *)GWErrorCode;
@end

NS_ASSUME_NONNULL_END
