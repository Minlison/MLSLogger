# MLSLogger Class Reference

&nbsp;&nbsp;**Inherits from** NSObject  
&nbsp;&nbsp;**Declared in** MLSLogger.h  

## Overview

<a href="#//api/name/showLevel">showLevel</a> 与 <a href="#//api/name/env">env</a> 冲突， 以最后一个设置为准

## Tasks

### 

[&nbsp;&nbsp;showLevel](#//api/name/showLevel) *property* 

[&nbsp;&nbsp;env](#//api/name/env) *property* 

[&nbsp;&nbsp;verbose](#//api/name/verbose) *property* 

[&nbsp;&nbsp;info](#//api/name/info) *property* 

[&nbsp;&nbsp;debug](#//api/name/debug) *property* 

[&nbsp;&nbsp;warning](#//api/name/warning) *property* 

[&nbsp;&nbsp;error](#//api/name/error) *property* 

## Properties

<a name="//api/name/debug" title="debug"></a>
### debug

debug 日志级别

`@property (copy, nonatomic, class, readonly) MLSLogBlock debug`

#### Declared In
* `MLSLogger.h`

<a name="//api/name/env" title="env"></a>
### env

日志模式 Default MLSLoggerEnvDebug
非发布模式，日志记录在 Document 下，可以 copy 出来
发布模式下，日志记录在 Library 下，不可以 copy 出来

`@property (nonatomic, assign, class) MLSLoggerEnv env`

#### Declared In
* `MLSLogger.h`

<a name="//api/name/error" title="error"></a>
### error

error 日志级别

`@property (copy, nonatomic, class, readonly) MLSLogBlock error`

#### Declared In
* `MLSLogger.h`

<a name="//api/name/info" title="info"></a>
### info

info 日志级别

`@property (copy, nonatomic, class, readonly) MLSLogBlock info`

#### Declared In
* `MLSLogger.h`

<a name="//api/name/showLevel" title="showLevel"></a>
### showLevel

日志显示级别 Default MLSLoggerShowLevelOff

`@property (nonatomic, assign, class) MLSLoggerShowLevel showLevel`

#### Declared In
* `MLSLogger.h`

<a name="//api/name/verbose" title="verbose"></a>
### verbose

verbose 日志级别

`@property (copy, nonatomic, class, readonly) MLSLogBlock verbose`

#### Declared In
* `MLSLogger.h`

<a name="//api/name/warning" title="warning"></a>
### warning

warning 日志级别

`@property (copy, nonatomic, class, readonly) MLSLogBlock warning`

#### Declared In
* `MLSLogger.h`

