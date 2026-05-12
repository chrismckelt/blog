---
title: SQL Server error handling
date: '2009-09-11T00:00:00+08:00'
draft: false
tags:
- sql
slug: sql-server-error-handling
---

> CREATE PROCEDURE <procName>
> AS
> BEGIN
>    SET NOCOUNT ON
>    BEGIN TRY
> 
>       --Do work
> 
>    END TRY
> 
>    BEGIN CATCH
> /\* Note that catching and rethrowing an exception is a lossy operation. ERROR\_PROCEDURE() etc will be reset. \*/
>       DECLARE @errorMessage   NVARCHAR(4000);
>       DECLARE @errorSeverity  INT;
>       DECLARE @errorState     INT;
> 
>       SELECT  @errorMessage   = ERROR\_MESSAGE(),
>               @errorSeverity  = ERROR\_SEVERITY() ,
>               @errorState     = ERROR\_STATE();
> 
>       --Perform required recovery actions.
> 
>       RAISERROR ( @errorMessage, @errorSeverity, @errorState );
>       
>       RETURN 1;
> 
>    END CATCH
>    
>    RETURN 0;
> END

