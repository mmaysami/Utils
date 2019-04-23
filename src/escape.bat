:: ---------------------------------------------------------
:: Author: Moe Maysami
:: ---------------------------------------------------------
@echo off
cls
echo;
:: Note for this to work, you must EnableDelayedExpansion
setlocal EnableDelayedExpansion
@echo on

:: Set Test Vars
set test1=An exclamation mark^^^^!
set test2=An exclamation mark^^^^^^^^^^!
set "test3=An exclamation mark^^^^^!"
set test4a=An exclamation mark^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^!
set test4b=%test4a%!

@echo off
:: Show Test Vars
echo test1 : %test1%
echo test2 : %test2%
echo test3 : %test3%
echo test4a: %test4a%
echo test4b: %test4b%