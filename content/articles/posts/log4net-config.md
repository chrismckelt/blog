---
title: Log4Net config
date: '2009-10-15T00:00:00+08:00'
draft: false
tags:
- dotnet log4net
slug: log4net-config
---

## Log4Net config
> 
>     <?  xml version\="1.0" encoding\="utf-8" ?\>
> <configuration\>  
>   <log4net\>  
>     <appender name\="WindowsEventAppender" type\="log4net.Appender.EventLogAppender"\>  
>       <param name\="LogName" value\="Application" />  
>       <applicationName value\="Phoenix" />  
>       <layout type\="log4net.Layout.PatternLayout"\>  
>         <conversionPattern value\="%date \[%thread\] %-5level %logger%newline =&gt; %message%newline" />  
>       </layout\>  
>       <filter type\="log4net.Filter.LevelRangeFilter"\>   
>         <param name\="LevelMin" value\="DEBUG" />  
>       </filter\>  
>     </appender\>  
>     <appender name\="RollingFile" type\="log4net.Appender.RollingFileAppender"\>  
>       <file type\="log4net.Util.PatternString"   value\="logs\\\\phoenix.log" />  
>       <appendToFile value\="true" />  
>       <maximumFileSize value\="500KB" />  
>       <maxSizeRollBackups value\="2" />  
>       <layout type\="log4net.Layout.PatternLayout"\>  
>         <conversionPattern value\="%date \[%thread\] %-5level %logger%newline =&gt; %message%newline" />  
>       </layout\>  
>     </appender\>    
>     <root\>  
>       <level value\="DEBUG" />    
>       <appender-ref ref\="WindowsEventAppender" />  
>       <appender-ref ref\="RollingFile" />  
>     </root\>  
>   </log4net\>  
> </configuration\>  
 