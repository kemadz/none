@ECHO OFF
SET "WDKBASEDIR=C:\WinDDK\7600.16385.1"
SET "NTMAKEENV=%WDKBASEDIR%\bin"
SET "PATH=%WDKBASEDIR%\bin\x86;%WDKBASEDIR%\bin\x86\x86;%PATH%"
SET "INCLUDE=.\include;%WDKBASEDIR%\inc\api;%WDKBASEDIR%\inc\api\crt\stl70;%WDKBASEDIR%\inc\crt;%WDKBASEDIR%\inc\ddk"
SET "LIB=.\lib;%WDKBASEDIR%\lib\crt\i386;%WDKBASEDIR%\lib\win7\i386"

IF EXIST none.exe DEL /Q /F none.exe
IF EXIST none.obj DEL /Q /F none.obj
cl.exe /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_UNICODE" /D "UNICODE" /nologo /MD /W3 /EHsc /O2 /c none.c
link.exe none.obj msvcrt_winxp.obj /NOLOGO /RELEASE /SUBSYSTEM:WINDOWS /MACHINE:X86 /MERGE:.rdata=.text /OPT:REF /OPT:ICF /OUT:"none.exe"
