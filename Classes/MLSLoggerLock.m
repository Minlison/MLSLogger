//
//  MLSLoggerLock.m
//  CocoaLumberjack
//
//  Created by MinLison on 2018/5/7.
//

#import "MLSLoggerLock.h"
@interface MLSLoggerLock ()
@property (nonatomic, strong) NSRecursiveLock *lock;
@end
@implementation MLSLoggerLock
+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    static MLSLoggerLock *instance = nil;
    dispatch_once(&onceToken,^{
        instance = [[super allocWithZone:NULL] init];
        instance.lock = [[NSRecursiveLock alloc] init];
    });
    return instance;
}

+ (id)allocWithZone:(struct _NSZone *)zone {
    return [self sharedInstance];
}
+ (BOOL)tryLock {
    return [[MLSLoggerLock sharedInstance].lock tryLock];
}
+ (void)unLock {
    [[MLSLoggerLock sharedInstance].lock unlock];
}
@end
