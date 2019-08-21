
Pod::Spec.new do |s|
  s.name         = "MLSLogger"
  s.version      = "1.0.0"
  s.summary      = "模块化日志管理工具"
  s.description  = <<-DESC
                    模块化日志管理工具， 统一配置处理日志，减少项目内垃圾代码
                   DESC

  s.homepage     = "https://www.minlison.cn"
  s.license      = "MIT"
  s.author             = { "Minlison" => "yuanhang.1991@163.com" }
  s.platform     = :ios, "8.0"
  s.static_framework = true
  s.source       = { :git => "https://github.com/Minlison/MLSLogger.git", :tag => "v#{s.version}" }
  s.documentation_url = "https://www.minlison.cn/article/mlslogger"
  s.source_files  = "Classes/**/*.{h,m}"
  s.public_header_files = "Classes/**/MLSLogger.h"
  s.requires_arc = true
  s.dependency "CocoaLumberjack", '>= 3.5.2'
end
