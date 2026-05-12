---
title: Winforms UI cross thread operations
date: '2009-02-27T00:00:00+08:00'
draft: false
tags:
- dotnet code
slug: winforms-ui-cross-thread-operations
---

>     ThreadPool.QueueUserWorkItem(new WaitCallback(LoadUsers));
> 
>     private void LoadUsers(Object stateInfo)
>     {
>      var site = new SPSite(testHarnessSettings.Url);
> 
>      var web = site.OpenWeb();
> 
>       foreach(SPUser user in web.AllUsers)
>       {
>        if (usersListBox.InvokeRequired)
>        {
>              usersListBox.Invoke(  
>               new MethodInvoker(
>              delegate { usersListBox.Items.Add((user.LoginName));  
>        }));
>       }
>     }
>  

