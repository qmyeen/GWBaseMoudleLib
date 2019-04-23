//
//  GWiCloudBaseMacro.h
//  SuperGWLibray
//
//  Created by QMY on 2019/4/22.
//  Copyright © 2019 gwm. All rights reserved.
//

#ifndef GWiCloudBaseMacro_h
#define GWiCloudBaseMacro_h



#import "GWiCloudURLMacro.h"
#import "NSString+GWWebErrorCode.h"

/**
 *  选择使用第几版主协议HeadInfo
 */
typedef NS_OPTIONS(NSUInteger, ENUM_HEADINFO_TYPE){
    /**
     *  不使用HeadInfo
     */
    HEADINFO_TYPE_NONE = 1,
    /**
     *  使用第一版
     */
    HEADINFO_TYPE_ONE  = 2,
};
#pragma mark - 超时
/**
 *  设置默认网络超时
 *
 *  @return 设置默认网络超时时间
 */
#define GWServiceTimeInterval 10


enum:UInt8
{
    GWHttpPingingModeNone = 1,
    GWHttpPingingModePK   = 1<<1,
    GWHttpPingingModeCer  = 1<<2,
};
static UInt8 GWHttpPinging = GWHttpPingingModeCer;

#define CerFileName @""

/**
 
 */
#define PKContent @""
typedef NS_OPTIONS(NSUInteger, ENUM_PKENCODEING_TYPE){
    /**
     *
     */
    PKENCODEING_TYPE_NORMAL = 0,
    /**
     *
     */
    PKENCODEING_TYPE_BASE64 = 1,
};

static ENUM_PKENCODEING_TYPE PKENCODEING_TYPE = PKENCODEING_TYPE_NORMAL;
#endif /* GWiCloudBaseMacro_h */
