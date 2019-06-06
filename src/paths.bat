:: ---------------------------------------------------------
:: Author: Moe Maysami
:: ---------------------------------------------------------
@echo off
cls
echo;

setlocal EnableDelayedExpansion


set myPath="%~dp0"
set myFile="%~nx0"
set myName="%~n0"

echo Path: %myPath%
echo File: %myFile%
echo Name: %myName%



set "I="
REM ::----------------------------------------------------------------------------------- 
REM :: Variable with modifier  Description
REM :: % ~I"                   Expands %I which Removes any surrounding
REM ::                         quotation marks ("").
REM :: % ~fI                   Expands %I to a fully qualified path name.
REM :: % ~dI                   Expands %I to a drive letter only.
REM :: % ~pI                   Expands %I to a path only.
REM :: % ~nI                   Expands %I to a file name only.
REM :: % ~xI                   Expands %I to a file extension only.
REM :: % ~sI                   Expands path to contain short names only.
REM :: % ~aI                   Expands %I to the file attributes of file.
REM :: % ~tI                   Expands %I to the date and time of file.
REM :: % ~zI                   Expands %I to the size of file.
REM :: % ~$PATH:I              Searches the directories listed in the PATH environment 
REM ::                         variable and expands %I to the fully qualified name of 
REM ::                         the first one found. If the environment variable name is 
REM ::                         not defined or the file is not found by the search,
REM ::                         this modifier expands to the empty string. 
