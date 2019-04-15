:: ---------------------------------------------------------
:: Author: Moe Maysami
:: ---------------------------------------------------------
@echo off
cls
echo;
:: Note for this to work, you must EnableDelayedExpansion
setlocal EnableDelayedExpansion

REM Variable with modifier  Description

REM %~I                     Expands %I which removes any surrounding 
REM                         quotation marks ("").
REM %~fI                    Expands %I to a fully qualified path name.
REM %~dI                    Expands %I to a drive letter only.
REM %~pI                    Expands %I to a path only.
REM %~nI                    Expands %I to a file name only.
REM %~xI                    Expands %I to a file extension only.
REM %~sI                    Expands path to contain short names only.
REM %~aI                    Expands %I to the file attributes of file.
REM %~tI                    Expands %I to the date and time of file.
REM %~zI                    Expands %I to the size of file.
REM %~$PATH:I               Searches the directories listed in the PATH environment 
REM                         variable and expands %I to the fully qualified name of 
REM                         the first one found. If the environment variable name is 
REM                         not defined or the file is not found by the search,
REM                         this modifier expands to the empty string. 



REM echo DName %~d0
REM echo PName %~p0
REM echo Path  %~dp0
REM echo FName %~n0
REM echo Extt  %~x0


set myPath="%~dp0"
set myFile="%~nx0"
set AutoGSpace="AutoGSpace.bat"

echo ~ Quotation Marks: "%~dp0"
echo ~ No Quotation Marks: %~dp0 2> nul
echo;
echo Path: %myPath%
echo;
set T1=myPath
:: WORKS
set T2=%myPath%
:: NOT Working for Escape Chars in myPath
set T3="%mypath%"	2> nul
set T4=!%mypath%!	2> nul
set T5="!%mypath%!"	2> nul

echo T1: %T1%		2> nul
echo T2: %T2%		2> nul
echo T3: %T3%		2> nul
echo T4: %T4% 		2> nul
echo T5: %T5% 		2> nul
echo;



echo;
echo ~~ setting
set T=%myPath%\%myFile%	2> nul
echo Joined: %T%		2> nul

echo;
echo ~~ calling
REM CALL :joinpath "C:\ABC" "DEF\GHJ" %pp%
REM echo %pp%
set TI1=%myPath%			2> nul
set TI2=%myPath%			2> nul
echo dequote1/2 by:%TI1%	2> nul
CALL :dequote1 TI1	2> nul
CALL :dequote2 TI2 TO2		2> nul
echo;
echo dq1 Out: "%TI1%"		2> nul
REM echo dq1 Out:"%TO1%"	2> nul
echo dq2 Out: "%TO2%"		2> nul

pause
Goto :eof


:dequote1
	echo -DQ1I %~1 :!%~1!	2> nul		
	for /f "delims=" %%A in ('echo %%%1%%') do set %1=%%~A
	echo -DQ1O %~1 :!%~1!	2> nul		
	EXIT /B 0

:dequote2
	echo -DQ2I %~1 :!%~1!	2> nul	
	set _temp=!%~1!			2> nul
	set _temp=%_temp:"=%	2> nul
	echo -DQ2O Temp: %_temp%	2> nul
	set %~2 = %_temp%		2> nul
	echo -DQ2O %~2 :!%~2!	2> nul	
	REM set %~2 =%_temp:"=%	2> nul
EXIT /B 0

:joinpath
set Path1="%~1"				2> nul
set Path2="%~2"				2> nul
set Join=%PATH1%\%PATH2%	2> nul
REM if {%Path1:~-1,1%}=={\} (set Result=%Path1%%Path2%) else (set Result=%Path1%\%Path2%)
set %~3=%Join%				2> nul
EXIT /B 0