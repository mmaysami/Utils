:: ---------------------------------------------------------
:: Author: Moe Maysami
:: ---------------------------------------------------------
@echo off
cls
echo;
:: Note for this to work, you must EnableDelayedExpansion
setlocal EnableDelayedExpansion

set inStr="    A B C D    "


echo My Pre : %inStr%
call :myTrim %inStr% %outStr%
echo My Post : %outStr%

REM echo Pre : %inStr%
REM call :Trim instr %inStr%
REM echo Post : %inStr%
REM echo Out: %outStr%

REM call :Test1 & call :Test2 & call :Test3 
exit /b


REM ::==============================================
:TrimQuoted
REM ::==============================================
REM :: SYNTAX 
REM :: 	CALL :TrimQuoted inStr outStr
REM ::
REM :: 	set inStr="ABCD    "  			
REM :: 	set outStr="ABCD"	
REM :: 	Note: Pass inStr1, inStr2, inStr3 with no %

	REM :: Clean-Up Tabs/Space
	REM set _tmp=%_tmp:	=%
	REM set _tmp=%_tmp:	=%

	set _tmpstr=%~1
	::Trim Right Tab/Space (Up to 50)
	for /l %%a in (1,1,50) do (
		if "!_tmpstr:~-2,-1!"=="	" set _tmpstr="%_tmpstr:~1,-5%"
		if "!_tmpstr:~-2,-1!"==" " 	  set _tmpstr="%_tmpstr:~1,-2%"
		)

		::Trim Left Space/Tab
	for /f "tokens=* delims=	" %%a in (%_tmpstr%) do set _tmpstr="%%a"	
	for /f "tokens=* delims= "    %%a in (%_tmpstr%) do set _tmpstr="%%a"
	set %~2 = %_tmpstr%
	exit /b

REM ::==============================================
REM :Trim-Func0
REM ::==============================================
REM :: SYNTAX 
REM :: 	CALL :Trim-Func0 outStr %inStr%
REM ::	
REM :: NOTE
REM ::  Parametric INput Args ONLY, do NOT use Strings Args
REM ::	Pass inStr1, inStr2 with no %
REM ::
REM :: 	set inStr="   ABCD    "  			
REM :: 	set outStr="ABCD"	
REM ::

	REM :: SetLocal EnableDelayedExpansion

	REM SetLocal EnableDelayedExpansion
	REM echo ---------- Trim-Func0 ----------

	REM set lrTrim=%~1
	REM echo [%lrTrim%]
	
	REM ::trim right whitespace (up to 100 spaces at the end)
	REM for /l %%a in (1,1,100) do (
		REM if "!lrTrim:~-1!"==" " (
			REM REM echo "Removing"
			REM set lrTrim=!lrTrim:~0,-1! 
			REM )
		REM )
	REM echo [%lrTrim%]

	REM ::trim left whitespace
	REM for /f "tokens=* delims= " %%a in ("%lrTrim%") do set lrTrim=%%a
	REM echo [%lrTrim%]
	
	REM set %~2="Indie Params"
	REM echo --Out [%lrTrim%]
	REM exit /b

REM :Trim-Func1
	REM SetLocal EnableDelayedExpansion
	REM set Params=%*
	REM for /f "tokens=1*" %%a in ("!Params!") do EndLocal & set %1=%%b
	REM exit /b

REM :Test1
	REM set Value=   a b c   
	REM set Expected=a b c
	REM call :Trim Actual %Value%
	REM if "%Expected%" == "%Actual%" (echo Test1 passed) else (echo Test1 failed)
	REM exit /b

REM :Test2
	REM SetLocal EnableDelayedExpansion
	REM set Value=   a \ / : * ? " ' < > | ` ~ @ # $ [ ] & ( ) + - _ = z    
	REM set Expected=a \ / : * ? " ' < > | ` ~ @ # $ [ ] & ( ) + - _ = z
	REM call :Trim Actual !Value!
	REM if !Expected! == !Actual! (echo Test2 passed) else (echo Test2 failed)
	REM exit /b

REM :Test3
	REM set /p Value1="Enter string to trim: " %=%
	REM echo Before: [%Value1%]
	REM call :Trim Value2 %Value1%
	REM echo After : [%Value2%]
	REM exit /b



REM ::==============================================
REM :Trim-Func2
REM ::==============================================
REM :: SYNTAX 
REM :: 	CALL :Trim-Func2 outStr %inStr%
REM ::	
REM :: NOTE
REM ::  Parametric INput Args ONLY, do NOT use Strings Args
REM ::	Pass inStr1, inStr2 with no %
REM ::
REM :: 	set inStr="   ABCD    "  			
REM :: 	set outStr="ABCD"	
REM ::
	REM :: SetLocal EnableDelayedExpansion
	REM echo ---------- Trim-Func2 ----------
	REM set Params=%*
	REM for /f "tokens=1*" %%a in ("!Params!") do EndLocal & set %1=%%b
	REM exit /b


REM ::==============================================
REM :Trim-Func3
REM ::==============================================
REM :: SYNTAX 
REM :: 	CALL :Trim-Func3 inStr outStr
REM ::	
REM :: NOTE
REM ::  Parametric INput Args ONLY, do NOT use Strings Args
REM ::	Pass inStr1, inStr2 with no %
REM ::
REM ::
REM :: 	set inStr="ABCD    "  			
REM :: 	set outStr="ABCD"	
REM ::
	REM :: SetLocal EnableDelayedExpansion
	REM echo ---------- Trim-Func3 ----------
	REM set _temp=!%~1!
	REM REM for /f "tokens=* delims= " %%a in ("%_temp%") do set _temp=%%a
	REM REM for /l %%a in (1,1,200) do if "!_temp:~-1!"==" " set _temp=!_temp:~0,-1!

	REM set Params=%*
	REM for /f "tokens=1*" %%a in ("!Params!") do EndLocal & set %1=%%b
	REM set %~2=%_temp%
	REM exit /b
	REM REM goto :EOF