@echo // Copyright (C) 1996-2005 Markus F.X.J. Oberhumer
@echo //
@echo //   OS/2 16-bit
@echo //   Microsoft C/C++
@echo //
@call b\prepare.bat
@if "%BECHO%"=="n" echo off


set CC=cl -nologo -AL -G2
%CC% -D__OS2__ -O -W3 %CFI% -c src\*.c
@if errorlevel 1 goto error
%CC% -Lp -F 2000 -Fm -Fe%BEXE% *.obj %BLDLIBS% /link /noe
@if errorlevel 1 goto error


@call b\done.bat
@goto end
:error
@echo ERROR during build!
:end
@call b\unset.bat
