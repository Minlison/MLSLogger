//
//  MLSLogger.h
//  MLSLogger
//
//  Created by MinLison on 2018/5/7.
//  Copyright © 2018年 MinLison. All rights reserved.
//

#import <Foundation/Foundation.h>

#define NSLogVerbose(fmt, ...)      MLSLogger.verbose((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#define NSLogInfo(fmt, ...)         MLSLogger.info((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#define NSLogDebug(fmt, ...)        MLSLogger.debug((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#define NSLogError(fmt, ...)        MLSLogger.error((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#define NSLogWarn(fmt, ...)         MLSLogger.warning((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)

/**
 日志显示级别

 - MLSLoggerShowLevelVerbose: 全部 默认
 - MLSLoggerShowLevelInfo: 信息
 - MLSLoggerShowLevelDebug:  调试
 - MLSLoggerShowLevelWarning: 警告
 - MLSLoggerShowLevelError: 错误
 */
typedef NS_ENUM(NSInteger, MLSLoggerShowLevel)
{
    MLSLoggerShowLevelAll,
    MLSLoggerShowLevelVerbose,
    MLSLoggerShowLevelDebug,
    MLSLoggerShowLevelInfo,
    MLSLoggerShowLevelWarning,
    MLSLoggerShowLevelError,
    MLSLoggerShowLevelOff,
};

/**
 日志模式

 - MLSLoggerEnvDebug: 调试模式， 对应日志级别 MLSLoggerShowLevelVerbose
 - MLSLoggerEnvTest: 测试模式   对应日志级别 MLSLoggerShowLevelInfo
 - MLSLoggerEnvPreRelease: 预发布模式 对应日志级别 MLSLoggerShowLevelWarning
 - MLSLoggerEnvGrayScaleRelease: 灰度发布 对应日志级别 MLSLoggerShowLevelError
 - MLSLoggerEnvRelease: 发布 对应日志级别 MLSLoggerShowLevelError
 */
typedef NS_ENUM(NSInteger, MLSLoggerEnv)
{
    MLSLoggerEnvDebug,
    MLSLoggerEnvTest,
    MLSLoggerEnvPreRelease,
    MLSLoggerEnvGrayScaleRelease,
    MLSLoggerEnvRelease,
};


@class MLSLogger;
/**
 日志函数输出函数
 */
typedef void (^MLSLogBlock)(NSString *format, ...);


/**
 showLevel 与 env 冲突， 以最后一个设置为准
 */
@interface MLSLogger : NSObject


/**
 日志显示级别 Default MLSLoggerShowLevelOff
 */
@property (nonatomic, assign, class) MLSLoggerShowLevel showLevel;

/**
 日志模式 Default MLSLoggerEnvDebug
 非发布模式，日志记录在 Document 下，可以 copy 出来
 发布模式下，日志记录在 Library 下，不可以 copy 出来
 */
@property (nonatomic, assign, class) MLSLoggerEnv env;

/**
 verbose 日志级别
 */
@property (copy, nonatomic, class, readonly) MLSLogBlock verbose;

/**
 info 日志级别
 */
@property (copy, nonatomic, class, readonly) MLSLogBlock info;

/**
 debug 日志级别
 */
@property (copy, nonatomic, class, readonly) MLSLogBlock debug;

/**
 warning 日志级别
 */
@property (copy, nonatomic, class, readonly) MLSLogBlock warning;

/**
 error 日志级别
 */
@property (copy, nonatomic, class, readonly) MLSLogBlock error;

@end
