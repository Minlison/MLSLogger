# MLSLoggerEnv Constants Reference

&nbsp;&nbsp;**Declared in** MLSLogger.h  

### MLSLoggerEnv

日志模式

<ul>
<li>MLSLoggerEnvDebug: 调试模式， 对应日志级别 MLSLoggerShowLevelVerbose</li>
<li>MLSLoggerEnvTest: 测试模式   对应日志级别 MLSLoggerShowLevelInfo</li>
<li>MLSLoggerEnvPreRelease: 预发布模式 对应日志级别 MLSLoggerShowLevelWarning</li>
<li>MLSLoggerEnvGrayScaleRelease: 灰度发布 对应日志级别 MLSLoggerShowLevelError</li>
<li>MLSLoggerEnvRelease: 发布 对应日志级别 MLSLoggerShowLevelError</li>
</ul>

#### Definition
    typedef NS_ENUM(NSInteger, MLSLoggerEnv ) {   
        
        MLSLoggerEnvDebug,
        
        MLSLoggerEnvTest,
        
        MLSLoggerEnvPreRelease,
        
        MLSLoggerEnvGrayScaleRelease,
        
        MLSLoggerEnvRelease,
        
    };

#### Constants

<a name="" title="MLSLoggerEnvDebug"></a><code>MLSLoggerEnvDebug</code>

日志模式

&nbsp;&nbsp;&nbsp;Declared In `MLSLogger.h`.

<a name="" title="MLSLoggerEnvTest"></a><code>MLSLoggerEnvTest</code>

日志模式

&nbsp;&nbsp;&nbsp;Declared In `MLSLogger.h`.

<a name="" title="MLSLoggerEnvPreRelease"></a><code>MLSLoggerEnvPreRelease</code>

日志模式

&nbsp;&nbsp;&nbsp;Declared In `MLSLogger.h`.

<a name="" title="MLSLoggerEnvGrayScaleRelease"></a><code>MLSLoggerEnvGrayScaleRelease</code>

日志模式

&nbsp;&nbsp;&nbsp;Declared In `MLSLogger.h`.

<a name="" title="MLSLoggerEnvRelease"></a><code>MLSLoggerEnvRelease</code>

日志模式

&nbsp;&nbsp;&nbsp;Declared In `MLSLogger.h`.

#### Declared In
`MLSLogger.h`

