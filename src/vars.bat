:: ---------------------------------------------------------
:: Author: Moe Maysami
:: ---------------------------------------------------------
@echo off
cls
echo;
:: Note for this to work, you must EnableDelayedExpansion
setlocal EnableDelayedExpansion

REM ==========================================================================================
REM In batch files, when a line or a block (all the lines enclosed in parenthesis) is reached, 
REM before being executed, it is parsed. In this parse phase, each variable read is replaced 
REM with the value the variable has before the execution starts.

REM If inside a block you change a variable, and want to access this changed value inside 
REM the same block, you need delayed expansion. The code in Laf answer reflect how to do it
REM Or, if it is possible, you can change your code to not need it
REM ==========================================================================================
set /A i1=1
set "s1=1"
set "str=some text"
set var1=A
set var2=B
set AB=hi

REM if %i1% EQU 1 (
if %s1%==1 (
	echo --Code Blocks [IF] and Delayed Exapansion---
	echo Init Value: 		%str%
	set "str=CHANGED %str%"
	REM :: Will NOT reflect changes
	echo Changed Value: 		%str%
	REM :: DOES reflect changes
	echo Changed Value[Delayed]: !str!	
	echo;
)
set newvar1=%var1%%var2%
set newvar2=!%var1%%var2%!

echo var1 : A
echo var2 : B
echo AB   : Hi
echo;
echo Normal  Mix %%var1%%%%var2%%   : %newvar1%  
echo Delayed Mix ^^!%%var1%%%%var2%%^^! : %newvar2%  

set sep="\"
if %sep% == "\" (
	echo Equals
) else (
	echo NOn-Equal 
)

REM set D="\"
REM if %D% EQU "\" (
	REM echo "Inside"
	REM )
	
	

