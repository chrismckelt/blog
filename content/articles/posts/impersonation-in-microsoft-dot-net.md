---
title: Impersonation in Microsoft Dot Net
date: '2008-07-28T00:00:00+08:00'
draft: false
tags:
- dotnet code
slug: impersonation-in-microsoft-dot-net
---

_**Usage**_

    string domain = "ExampleDomain";
    string userName = "ExampleUserName";
    string password = "ExamplePassword"; 

    using (Impersonation impersonation = new Impersonation(domain, userName, password))
    {
     // impersonation occuring in here 
             Console.WriteLine(System.Security.Principal.WindowsIdentity.GetCurrent().Name);
    } 

_**Implementation**_

<script src="https://gist.github.com/chrismckelt/846be3c45554f20263daf3c6173da2c1.js"></script>