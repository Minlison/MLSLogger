//
//  MLSLogger.m
//  MLSLogger
//
//  Created by MinLison on 2018/5/7.
//  Copyright © 2018年 MinLison. All rights reserved.
//

#import "MLSLogger.h"
#import "MLSLogMacros.h"
#import "MLSLoggerLock.h"

static DDLogLevel lbloglevel = DDLogLevelAll;
static MLSLoggerShowLevel _showLevel = MLSLoggerShowLevelVerbose;
static MLSLoggerEnv _env = MLSLoggerEnvDebug;

@implementation MLSLogger
+ (MLSLoggerShowLevel)showLevel {
    return _showLevel;
}

+ (void)setShowLevel:(MLSLoggerShowLevel)showLevel {
    if ([MLSLoggerLock tryLock] ) {
        _showLevel = showLevel;
        switch (showLevel) {
            case MLSLoggerShowLevelAll:
                lbloglevel = DDLogLevelAll;
                break;
            case MLSLoggerShowLevelVerbose:
                lbloglevel = DDLogLevelVerbose;
                break;
            case MLSLoggerShowLevelInfo:
                lbloglevel = DDLogLevelInfo;
                break;
            case MLSLoggerShowLevelDebug:
                lbloglevel = DDLogLevelDebug;
                break;
            case MLSLoggerShowLevelWarning:
                lbloglevel = DDLogLevelWarning;
                break;
            case MLSLoggerShowLevelError:
                lbloglevel = DDLogLevelError;
                break;
            case MLSLoggerShowLevelOff:
                lbloglevel = DDLogLevelOff;
                break;
        }
        [MLSLoggerLock unLock];
    }
    [self configLogger];
    
}

+ (MLSLoggerEnv)env {
    return _env;
}

+ (void)setEnv:(MLSLoggerEnv)env {
    if ([MLSLoggerLock tryLock]) {
        _env = env;
        switch (env) {
            case MLSLoggerEnvDebug:
                [self setShowLevel:(MLSLoggerShowLevelVerbose)];
                break;
            case MLSLoggerEnvTest:
                [self setShowLevel:(MLSLoggerShowLevelInfo)];
                break;
            case MLSLoggerEnvPreRelease:
                [self setShowLevel:(MLSLoggerShowLevelInfo)];
                break;
            case MLSLoggerEnvGrayScaleRelease:
                [self setShowLevel:(MLSLoggerShowLevelWarning)];
                break;
            case MLSLoggerEnvRelease:
                [self setShowLevel:(MLSLoggerShowLevelError)];
                break;
        }
        [MLSLoggerLock unLock];
    }
    [self configLogger];
    
}
+ (void)configLogger {
    if ([MLSLoggerLock tryLock]) {
        
        NSString *logDir = @"";
        if (_env != MLSLoggerEnvRelease) {
            logDir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject stringByAppendingPathComponent:@"mlslogger.log"];
        } else {
            logDir = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES).lastObject stringByAppendingPathComponent:@"mlslogger.log"];
        }
        BOOL isDir = NO;
        if ([[NSFileManager defaultManager] fileExistsAtPath:logDir isDirectory:&isDir]) {
            if (!isDir) {
                [[NSFileManager defaultManager] createDirectoryAtPath:logDir withIntermediateDirectories:YES attributes:nil error:NULL];
            }
        } else {
            [[NSFileManager defaultManager] createDirectoryAtPath:logDir withIntermediateDirectories:YES attributes:nil error:NULL];
        }
        DDLogFileManagerDefault *fileManager = [[DDLogFileManagerDefault alloc] initWithLogsDirectory:logDir];
        DDFileLogger *fileLogger = [[DDFileLogger alloc] initWithLogFileManager:fileManager];
        
        fileLogger.maximumFileSize = 10 * 1024 * 1024; // 10MB
        
        [DDLog addLogger:fileLogger withLevel:(DDLogLevelAll)];
        [DDLog addLogger:[DDTTYLogger sharedInstance] withLevel:(DDLogLevelAll)];
        [MLSLoggerLock unLock];
    }
}

+ (MLSLogBlock)verbose {
    return ^(NSString *format, ...) {
        
        if ([MLSLoggerLock tryLock]) {
            NSString *message = @"";
            if (format) {
                va_list args;
                va_start(args, format);
                
                message = [[NSString alloc] initWithFormat:format arguments:args];
                
                va_end(args);
            }
            if (![NSThread currentThread].isMainThread) {
                dispatch_sync(dispatch_get_main_queue(), ^{
                        NSLogVerboseInner(@"🗯🗯🗯%@🗯🗯🗯",message);
                });
            } else {
                NSLogVerboseInner(@"🗯🗯🗯%@🗯🗯🗯",message);
            }
            [MLSLoggerLock unLock];
        }
    };
}

+ (MLSLogBlock)info {
    return ^(NSString *format, ...) {
        if ([MLSLoggerLock tryLock]) {
            NSString *message = @"";
            if (format) {
                va_list args;
                va_start(args, format);
                
                message = [[NSString alloc] initWithFormat:format arguments:args];
                
                
                va_end(args);
            }
            if (![NSThread currentThread].isMainThread) {
                dispatch_sync(dispatch_get_main_queue(), ^{
                    NSLogInfoInner(@"ℹ️ℹ️ℹ️%@ℹ️ℹ️ℹ️",message);
                });
            } else {
                NSLogInfoInner(@"ℹ️ℹ️ℹ️%@ℹ️ℹ️ℹ️",message);
            }
            [MLSLoggerLock unLock];
        }
    };
}

+ (MLSLogBlock)error {
    return ^(NSString *format, ...) {
        if ([MLSLoggerLock tryLock]) {
            
            NSString *message = @"";
            
            if (format) {
                va_list args;
                va_start(args, format);
                
                message = [[NSString alloc] initWithFormat:format arguments:args];
                
                va_end(args);
            }
            if (![NSThread currentThread].isMainThread) {
                dispatch_sync(dispatch_get_main_queue(), ^{
                    NSLogErrorInner(@"‼️‼️‼️%@‼️‼️‼️",message);
                });
            } else {
                NSLogErrorInner(@"‼️‼️‼️%@‼️‼️‼️",message);
            }
            [MLSLoggerLock unLock];
        }
    };
}

+ (MLSLogBlock)warning {
    return ^(NSString *format, ...) {
        if ([MLSLoggerLock tryLock]) {
            NSString *message = @"";
            if (format) {
                va_list args;
                va_start(args, format);
                
                message = [[NSString alloc] initWithFormat:format arguments:args];
                
                va_end(args);
            }
            if (![NSThread currentThread].isMainThread) {
                dispatch_sync(dispatch_get_main_queue(), ^{
                    NSLogWarnInner(@"⚠️⚠️⚠️%@⚠️⚠️⚠️",message);
                });
            } else {
                NSLogWarnInner(@"⚠️⚠️⚠️%@⚠️⚠️⚠️",message);
            }
            [MLSLoggerLock unLock];
        }
    };
}

+ (MLSLogBlock)debug {
    return ^(NSString *format, ...) {
        if ([MLSLoggerLock tryLock]) {
            NSString *message = @"";
            if (format) {
                va_list args;
                va_start(args, format);
                
                message = [[NSString alloc] initWithFormat:format arguments:args];
                
                va_end(args);
            }
            if (![NSThread currentThread].isMainThread) {
                dispatch_sync(dispatch_get_main_queue(), ^{
                    NSLogDebugInner(@"🔹🔹🔹%@🔹🔹🔹",message);
                });
            } else {
                NSLogDebugInner(@"🔹🔹🔹%@🔹🔹🔹",message);
            }
            [MLSLoggerLock unLock];
        }
    };
}
@end
