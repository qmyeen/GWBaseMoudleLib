//
//  GWAppDotNetAPIClient.m
//  SuperGWLibray
//
//  Created by QMY on 2019/4/22.
//  Copyright © 2019 gwm. All rights reserved.
//

#import "GWAppDotNetAPIClient.h"
#import "GWiCloudBaseMacro.h"
static GWAppDotNetAPIClient *_sharedClient = nil;


@implementation GWAppDotNetAPIClient
/**
 *  设置网络请求
 *  @return 返回请求
 */
+ (instancetype)sharedInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[GWAppDotNetAPIClient alloc] initWithBaseURL:[NSURL URLWithString:ProjectBaseURL]];
        AFSecurityPolicy * SecurityPolicy;
        _sharedClient.securityPolicy.allowInvalidCertificates = YES;
        _sharedClient.requestSerializer.timeoutInterval = GWServiceTimeInterval;
        if (GWHttpPinging == GWHttpPingingModeNone)
        {
            SecurityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
        }
        else
        {
            SecurityPolicy = [self customSecurityPolicy];
        }
        _sharedClient.securityPolicy = SecurityPolicy;

    });
    
    return _sharedClient;
}

#pragma mark- 配置https
+ (AFSecurityPolicy *)customSecurityPolicy
{
    /** https */
    NSData * PingData;
    NSUInteger SSLPinningMode = 0;
    if (GWHttpPinging == GWHttpPingingModePK)
    {
        SSLPinningMode = AFSSLPinningModePublicKey;
        
        PingData = PKENCODEING_TYPE?[[NSData alloc]
                                     initWithBase64EncodedString:PKContent options:NSDataBase64DecodingIgnoreUnknownCharacters]:[PKContent dataUsingEncoding:NSUTF8StringEncoding];
    }
    else
    {
        SSLPinningMode = AFSSLPinningModeCertificate;
        NSString*cerPath = [[NSBundle mainBundle] pathForResource:CerFileName ofType:@"cer"];
        PingData = [NSData dataWithContentsOfFile:cerPath];
    }
    
    NSSet*set = [[NSSet alloc] initWithObjects:PingData,nil];
    AFSecurityPolicy *policy = [AFSecurityPolicy policyWithPinningMode:SSLPinningMode withPinnedCertificates:set];
    return policy;
}
@end


