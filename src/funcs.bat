:: ---------------------------------------------------------
:: Author: Moe Maysami
:: ---------------------------------------------------------
@echo off
cls
echo;
:: Note for this to work, you must EnableDelayedExpansion
setlocal EnableDelayedExpansion

set myPath="%~dp0"
set myFile="%~nx0"
set AutoGSpace="AutoGSpace.bat"	2> nul		
set DistMat="Var p=0.8 W Q=1 Diag Scl=6 Loc=1.8.csv" 	2> nul		
set spcStr="  ABCDE EFGH JKLM      "
set Var1="ab&"XY"
set Var2="12=34"
set "null="
set nulStr=""
set bksl="\"



set var1="C:\Users\mamo8001\Project\Clustering\01 Codes\tests\M&M'Chars\"
set var2="Variant Distance p=0.8 Weighted Q=1 Diag Scale=6 Location=1.8.csv"
set var3="\"
call :JoinQuotedStrings var1,var2,var3,var4
echo Output: %var4%

REM echo;
REM call :JoinQuotedStrings Var1 Var2 null Var2
REM REM echo Var1: %Var1%
REM echo **Out Var2: %Var2%					2> nul		
REM REM echo Var3: %Var3%
REM echo;

call :JoinQuotedStrings myPath DistMat nulStr OutMat1
REM AbsDistMat
REM echo;
REM echo Path :  %myPath%		2> nul
REM echo **Out Var: %OutMat1%		2> nul		
REM echo Full File: %AbsDistMat%

REM call :JoinPathDeQuote myPath, DistMat, bksl, OutMat2
REM REM AbsDistMat
REM REM echo;
REM REM echo Path :  %myPath%		2> nul
REM echo **Out Path: %OutMat2%		2> nul		
REM REM echo Full File: %AbsDistMat%


REM echo;
REM call :DeQuote Var1 DQ1 DQ2
REM echo **Out Var1: %DQ1%	
REM echo **Out Var2: %DQ2%	

REM echo; 
REM call :DeQuote Val1 Val2 Val4
REM echo Val1: %Val1%
REM echo Val2: %Val2%
REM echo Val4: %Val4%


::==============================================
::		Function Definitions
::==============================================
GOTO :EOF



::==============================================
:TrimQuoted
::==============================================
:: SYNTAX 
:: 	CALL :TrimQuoted inStr outStr
::
:: 	set inStr="ABCD    "  			
:: 	set outStr="ABCD"	
:: 	Note: Pass inStr1, inStr2, inStr3 with no %

	REM :: Clean-Up Tabs/Space
	REM set _tmp=%_tmp:	=%
	REM set _tmp=%_tmp:	=%

	set _tmpstr=!%~1!
	::Trim Right Tab/Space (Up to 50)
	for /l %%a in (1,1,50) do (
		if "!_tmpstr:~-2,-1!"=="	" set _tmpstr="%_tmpstr:~1,-5%"
		if "!_tmpstr:~-2,-1!"==" " 	  set _tmpstr="%_tmpstr:~1,-2%"
		)

		::Trim Left Space/Tab
	for /f "tokens=* delims=	" %%a in (%_tmpstr%) do set _tmpstr="%%a"	
	for /f "tokens=* delims= "    %%a in (%_tmpstr%) do set _tmpstr="%%a"
	set %~2=%_tmpstr%
	exit /b	




::==============================================
:JoinQuotedStrings
:: Assumes No Tab in Strings
::==============================================
:: SYNTAX 
:: 	CALL :JoinQuotedStrings inStr1 inStr2 outStr
::	
:: NOTE
::  Parametric INput Args ONLY, do NOT use Strings Args
::	Pass inStr1, inStr2 with no %
::
:: 	set inStr1="%~dp0"  	"C:\Users\MM\J&J"
:: 	set inStr2="%~nx0"		"Alpha&Beta.txt"

	echo ---------- JoinQuotedStrings ----------
	:: Get Input Args
	echo --Arg1	: %~1
	echo --Arg2	: %~2
	echo --Arg2	: %~3
	echo --InVal : !%~1!
	echo --InVal2: !%~2!
	echo --InVal2: !%~3!	

	set _tmp1=!%~1!
	set _tmp2=!%~2!
	set _sep=!%~3!	

	echo --InDel1: %_tmp1% 2> nul
	echo --InDel2: %_tmp2% 2> nul
	echo --InDel3: %_sep% 2> nul	

	
	REM REM :: -------------- Method 1 -------------------
	REM REM :: -------------------------------------------
	REM REM :: Remove Quotations (Might create Tab/Space)
	REM set _tmp1DQ="%_tmp1:"=%"
	REM set _tmp2DQ="%_tmp2:"=%"
	REM echo --InDeQ1: %_tmp1DQ% 2> nul
	REM echo --InDeQ2: %_tmp2DQ% 2> nul
	
	REM call :TrimQuoted _tmp1DQ _tmp1DQ
	REM call :TrimQuoted _tmp2DQ _tmp2DQ
	REM echo --InDeT1: %_tmp1DQ% 2> nul
	REM echo --InDeT2: %_tmp2DQ% 2> nul	

	REM REM REM :: Elements: Clean-Up Tabs/Space (Removes Tab in Middle!)
	REM REM set _tmp1DQ=%_tmp1DQ:	=%
	REM REM set _tmp2DQ=%_tmp2DQ:	=%
	REM REM echo --InDeq1 No-Tab: %_tmp1DQ% 2> nul
	REM REM echo --InDeq2 No-Tab: %_tmp2DQ% 2> nul	
	
	REM REM REM :: Elements: Trim Right Tab/Space (Up to 50)
	REM REM for /l %%a in (1,1,50) do (
		REM REM if "!_tmp1DQ:~-2,-1!"=="	" set _tmp1DQ="%_tmp1DQ:~1,-5%"
		REM REM if "!_tmp1DQ:~-2,-1!"==" " set _tmp1DQ="%_tmp1DQ:~1,-2%"

		REM REM if "!_tmp2DQ:~-2,-1!"=="	" set _tmp2DQ="%_tmp2DQ:~1,-5%"
		REM REM if "!_tmp2DQ:~-2,-1!"==" " set _tmp2DQ="%_tmp2DQ:~1,-2%"	
		REM REM )
	REM REM REM :: Elements: Trim Left Space/Tab
	REM REM REM ::tmp1DQ Left Trim, Causes Extra Space Again!
	REM REM :: for /f "tokens=* delims=	" %%a in (%_tmp1DQ%) do set _tmp1DQ="%%a"	
	REM REM :: for /f "tokens=* delims= " %%a in (%_tmp1DQ%) do set _tmp1DQ="%%a"	
	
	REM REM for /f "tokens=* delims=	" %%a in (%_tmp2DQ%) do set _tmp2DQ="%%a"	
	REM REM for /f "tokens=* delims= " %%a in (%_tmp2DQ%) do set _tmp2DQ="%%a"	
	
	REM set _tmp="%_tmp1DQ:"=%%_sep:"=%%_tmp2DQ:"=%"
	REM echo Joined: %_tmp%
	

	:: -------------- Method 2 -------------------
	:: -------------------------------------------	
	:: Join Might create Tab/Space
	set _tmp="%_tmp1:"=%%_sep:"=%%_tmp2:"=%"
	call :TrimQuoted _tmp _tmp


	:: Joined: Clean-Up Tabs/Space (Removes Tab in Middle!)
	set _tmp=%_tmp:	=%
	echo --Out No-Tab: %_tmp% 2> nul
	
	REM :: Joined: Trim Right Tab/Space (Up to 50)
	REM for /l %%a in (1,1,50) do (
		REM if "!_tmp:~-2,-1!"=="	" set _tmp="%_tmp:~1,-5%"
		REM if "!_tmp:~-2,-1!"==" " set _tmp="%_tmp:~1,-2%"
		REM )
	REM :: Joined: Trim ElementsLeft Space/Tab
	REM for /f "tokens=* delims=	" %%a in (%_tmp%) do set _tmp="%%a"	
	REM for /f "tokens=* delims= " %%a in (%_tmp%) do set _tmp="%%a"


	::	Replace Repeat Sep
	:: ------------------------		
	if %_sep% == "\" (
		set _tmp=%_tmp:\\\=\%
		set _tmp=%_tmp:\\=\%
	)

	
	echo --Output: %_tmp%
	set %~4=%_tmp%
	REM &REM
	REM goto :EOF
	exit /b

	
	
	
::==============================================
:JoinPathDeQuote
:: 		Join Path String With 
::		Escape Chars and Quotations
::==============================================
:: SYNTAX 
:: 	CALL :JoinPathDeQuote inStr1 inStr2 inStr3 outStr
::	
:: NOTE
::  Parametric INput Args ONLY, do NOT use Strings Args
::	Pass inStr1, inStr2, inStr3 with no %
::
:: 	set inStr1="%~dp0"  	"C:\Users\MM\J&J"
:: 	set inStr2="%~nx0"		"Alpha&Beta.txt"
:: 	set inStr3=Path Sep 	"\"

	echo ---------- JoinPathDeQuote ----------
	:: Re-Assign Input Args1,2
	set _tmp1="!%~1!"
	set _tmp2="!%~2!"
	set _sep="!%~3!"

	echo --Arg1	: %~1
	echo --Arg2	: %~2
	echo --Arg3	: %~3
	echo --InVal : !%~1!
	echo --InVal2: !%~2!
	echo --InVal3: !%~3!

	set _tmp1="!%~1!"
	set _tmp2="!%~2!"
	set _sep="!%~3!"

	:: Clean ", Concat, Re-Quote Entire Path String 
	set _tmp="%_tmp1:"=%%_sep:"=%%_tmp2:"=%"
	
	:: Clean Repeats of Path Separators
	echo;
	echo --Out-Pre : %_tmp%
	IF %_sep% == "\" (
		REM echo --Equals
		set _tmp=%_tmp:\\\=\%
		set _tmp=%_tmp:\\=\%
		)
		
	echo --Out-Post: %_tmp%

	set %~4=%_tmp%
	GOTO :EOF	
	
::==============================================
:DeQuote
::==============================================
:: SYNTAX 
:: 	CALL :JoinPathDeQuote inStr1 outStr2 outStr3
::
::  Parametric INput Args ONLY, do NOT use Strings Args
::	Pass inStr1, inStr2, inStr3 with no %
::
:: 	set inStr1="%~dp0"  			"C:\Users\MM\J&J"
:: 	set outStr2="De-Quoted inStr1	C:\Users\MM\J&J
:: 	set outStr3=Fixed Value 		"Indie Params"

	echo ---------- DeQuote ----------
	echo --Arg1	: %~1
	echo --Arg2	: %~2
	echo --Arg3	: %~3
	echo --InVal : !%~1!
	echo --InVal2: !%~2!
	echo --InVal3: !%~3!
	set _tmp=!%~1!
	set _tmp="%_tmp:"=%"
	set %~2=%_tmp%
	set %~3=Indie Params
	echo --Output1: %_tmp%
	exit /b
	REM goto :EOF

