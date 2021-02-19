@echo off

set prefix=
set url=

:processargs
set arg=%1
if defined arg (
    if "%arg%"=="-n" (set prefix="https://")
    if not "%arg%"=="-n" (set url="%arg%")
    shift
    goto processargs
)

set url=%prefix%%url%
set url=%url:"=%

<nul set /p unused=^<!DOCTYPE html^>^<body^>^<script^>window.open('> script.html
<nul set /p unused=%url%>> script.html
<nul set /p unused=','detab','toolbar=0');window.close();^</script^>^</body^> >> script.html

start chrome script.html

PING localhost -n 2 >NUL

del script.html
