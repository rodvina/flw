@echo off
echo %ANT_HOME%
SET ANT_HOME=%MBS_HOME_1.0%\supportLibs\ant-1.7.1
SET JAVA_HOME=%MBS_HOME_1.0%\supportLibs\jdk-1.7.0

IF [%1]==[] (
REM No target specified
%ANT_HOME%/bin/ant -f build.xml -p 
) ELSE (
%ANT_HOME%/bin/ant -f build.xml %1 
)