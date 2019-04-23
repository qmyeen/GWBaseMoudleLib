//
//  GWAppDotNetAPIClient.h
//  SuperGWLibray
//
//  Created by QMY on 2019/4/22.
//  Copyright © 2019 gwm. All rights reserved.
//

#import "AFHTTPSessionManager.h"

NS_ASSUME_NONNULL_BEGIN
@class GWCloudConfig;
@interface GWAppDotNetAPIClient : AFHTTPSessionManager
/**
 *  设置网络请求
 *
 *  @param timeInterval 超时时间（默认10s）
 *
 *  @return 返回请求
 */
+ (instancetype)sharedInstance;
@end

NS_ASSUME_NONNULL_END
