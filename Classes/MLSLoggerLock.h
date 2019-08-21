//
//  MLSLoggerLock.h
//  CocoaLumberjack
//
//  Created by MinLison on 2018/5/7.
//

#import <Foundation/Foundation.h>

@interface MLSLoggerLock : NSObject
+ (BOOL)tryLock;
+ (void)unLock;
@end
