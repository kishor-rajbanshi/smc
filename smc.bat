@ECHO off

REM Author : Kishor Rajbanshi
REM Copyright (c) kishor-rajbanshi.com.np

SETLOCAL EnableExtensions EnableDelayedExpansion

ECHO.
ECHO [101;93m Initializing... [0m
ECHO.

IF "%1" == "start" GOTO :START
IF "%1" == "stop" GOTO :STOP
IF "%1" == "restart" GOTO :RESTART

GOTO ABOUT

:START
IF "%2"=="" GOTO END
IF NOT "%2"=="nginx" IF NOT "%2"=="mysql" IF NOT "%2"=="php-cgi" (
	ECHO [41m %2 [0m not found.
	GOTO ABOUT
)
TASKLIST /FI "IMAGENAME eq %2.exe" | find /I /N "%2.exe" > NUL
IF "%ERRORLEVEL%"=="0" (
	ECHO [32m "%2" is already running. [0m
)ELSE (
	ECHO [36m starting "%2"... [0m
	IF "%2"=="nginx" (
        FOR /F "delims=" %%A IN ('where.exe %2') DO (
            CD /D "%%~dpA"
        )
		START /WAIT RunHiddenConsole %2
	)
	IF "%2"=="mysql" START /WAIT RunHiddenConsole mysqld --console
	IF "%2"=="php-cgi" (
		START /WAIT RunHiddenConsole %2 -b 127.0.0.1:9000
		ECHO  [33musing host:127.0.0.1, port:9000[0m
	)
	ECHO [92m "%2" started. [0m
)
SHIFT
GOTO START

:STOP
IF "%2"=="" GOTO END
TASKLIST /FI "IMAGENAME eq %2.exe" | find /I /N "%2.exe" > NUL
IF "%2"=="mysql" TASKLIST /FI "IMAGENAME eq mysqld.exe" | find /I /N "mysqld.exe" > NUL
IF "%ERRORLEVEL%"=="0" (
	IF "%2"=="mysql" (
		TASKKILL /F /IM mysqld.exe>NUL
	)ELSE (
		TASKKILL /F /IM %2.exe>NUL
	)
	ECHO [31m "%2" stopped. [0m
)ELSE (
	ECHO [33m "%2" is not running. [0m
)
SHIFT
GOTO STOP

:RESTART
IF "%2"=="" GOTO END
TASKLIST /FI "IMAGENAME eq %2.exe" | find /I /N "%2.exe" > NUL
IF "%2"=="mysql" TASKLIST /FI "IMAGENAME eq mysqld.exe" | find /I /N "mysqld.exe" > NUL
IF "%ERRORLEVEL%"=="0" (
	IF "%2"=="mysql" (
		TASKKILL /F /IM mysqld.exe>NUL
	)ELSE (
		TASKKILL /F /IM %2.exe>NUL
	)
	ECHO [31m "%2" stopped. [0m
	ECHO [31m "%2" Restarting. [0m
	IF "%2"=="nginx" (
		FOR /F "delims=" %%A IN ('where.exe %2') DO (
            CD /D "%%~dpA"
        )
		START /WAIT RunHiddenConsole %2
	)
	IF "%2"=="mysql" START /WAIT RunHiddenConsole mysqld --console
	IF "%2"=="php-cgi" (
		START /WAIT RunHiddenConsole %2 -b 127.0.0.1:9000
		ECHO  [33musing host:127.0.0.1, port:9000[0m
	)
	ECHO [92m "%2" started. [0m
)ELSE (
	ECHO [33m "%2" is not running. [0m
)
SHIFT
GOTO RESTART

:ABOUT
ECHO [42mWelcome to Service Management Console[0m
ECHO [96mSMC version 1.0.0[0m
ECHO.
ECHO [33mThis console application allows you to manage services with ease.[0m
ECHO [33mYou can start, stop, or restart specific services using the provided[0m
ECHO [33mcommands and arguments.[0m

ECHO.
ECHO [94mUsage:[0m
ECHO    command [arguments]
ECHO.
ECHO [94mAvailable commands:[0m
ECHO    [92mstart[0m    [95mStart a service[0m
ECHO    [92mstop[0m     [95mStop a service[0m
ECHO    [92mrestart[0m  [95mRestart a service[0m
ECHO.
ECHO [94mArguments:[0m
ECHO    [92mnginx[0m    [95mManage the Nginx web server[0m
ECHO    [92mmysql[0m    [95mManage the MySQL database server[0m
ECHO    [92mphp-cgi[0m  [95mManage the PHP CGI process[0m
ECHO.
ECHO [33mUse this application to efficiently control various services on your[0m
ECHO [33msystem, ensuring smooth operations for your needs.[0m
ECHO.

:END
