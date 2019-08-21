//
//  NSLogMacros.h
//  MLSLogger
//
//  Created by MinLison on 2018/5/17.
//

#import <CocoaLumberjack/CocoaLumberjack.h>
#ifndef LB_LOG_LEVEL_DEF
    #define LB_LOG_LEVEL_DEF lbloglevel
#endif

#define NSLogErrorInner(frmt, ...)   LOG_MAYBE(NO,                LB_LOG_LEVEL_DEF, DDLogFlagError,   0, nil, __PRETTY_FUNCTION__, frmt, ##__VA_ARGS__)
#define NSLogWarnInner(frmt, ...)    LOG_MAYBE(LOG_ASYNC_ENABLED, LB_LOG_LEVEL_DEF, DDLogFlagWarning, 0, nil, __PRETTY_FUNCTION__, frmt, ##__VA_ARGS__)
#define NSLogInfoInner(frmt, ...)    LOG_MAYBE(LOG_ASYNC_ENABLED, LB_LOG_LEVEL_DEF, DDLogFlagInfo,    0, nil, __PRETTY_FUNCTION__, frmt, ##__VA_ARGS__)
#define NSLogDebugInner(frmt, ...)   LOG_MAYBE(LOG_ASYNC_ENABLED, LB_LOG_LEVEL_DEF, DDLogFlagDebug,   0, nil, __PRETTY_FUNCTION__, frmt, ##__VA_ARGS__)
#define NSLogVerboseInner(frmt, ...) LOG_MAYBE(LOG_ASYNC_ENABLED, LB_LOG_LEVEL_DEF, DDLogFlagVerbose, 0, nil, __PRETTY_FUNCTION__, frmt, ##__VA_ARGS__)

#define NSLogErrorToDDLogInner(ddlog, frmt, ...)   LOG_MAYBE_TO_DDLOG(ddlog, NO,                LB_LOG_LEVEL_DEF, DDLogFlagError,   0, nil, __PRETTY_FUNCTION__, frmt, ##__VA_ARGS__)
#define NSLogWarnToLBLogInner(ddlog, frmt, ...)    LOG_MAYBE_TO_DDLOG(ddlog, LOG_ASYNC_ENABLED, LB_LOG_LEVEL_DEF, DDLogFlagWarning, 0, nil, __PRETTY_FUNCTION__, frmt, ##__VA_ARGS__)
#define NSLogInfoToLBLogInner(ddlog, frmt, ...)    LOG_MAYBE_TO_DDLOG(ddlog, LOG_ASYNC_ENABLED, LB_LOG_LEVEL_DEF, DDLogFlagInfo,    0, nil, __PRETTY_FUNCTION__, frmt, ##__VA_ARGS__)
#define NSLogDebugToLBLogInner(ddlog, frmt, ...)   LOG_MAYBE_TO_DDLOG(ddlog, LOG_ASYNC_ENABLED, LB_LOG_LEVEL_DEF, DDLogFlagDebug,   0, nil, __PRETTY_FUNCTION__, frmt, ##__VA_ARGS__)
#define NSLogVerboseToLBLogInner(ddlog, frmt, ...) LOG_MAYBE_TO_DDLOG(ddlog, LOG_ASYNC_ENABLED, LB_LOG_LEVEL_DEF, DDLogFlagVerbose, 0, nil, __PRETTY_FUNCTION__, frmt, ##__VA_ARGS__)
