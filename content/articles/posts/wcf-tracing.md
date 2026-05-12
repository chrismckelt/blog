---
title: WCF Tracing
date: '2009-11-13T00:00:00+08:00'
draft: false
tags:
- dotnet
slug: wcf-tracing
---

In the web.config in between the <configuration></configuration> tags
> 
>  <system.diagnostics\>  
>             <sources\>  
>                   <source name\="System.ServiceModel"
>                               switchValue\="Information, ActivityTracing"
>                               propagateActivity\="true"\>  
>                         <listeners\>  
>                               <add name\="traceListener"
>                                     type\="System.Diagnostics.XmlWriterTraceListener"
>                                     initializeData\= "WCFTrace.svclog" />  
>                         </listeners\>  
>                   </source\>  
>             </sources\>  
>             <trace autoflush\="true" />  
>       </system.diagnostics\>  
> 
 
