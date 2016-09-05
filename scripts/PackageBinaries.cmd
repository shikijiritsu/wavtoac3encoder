@echo on
setlocal

set varVersion=5.4
set varOutput=EncWAVtoAC3-%varVersion%
set varBase=..
set varPathAftenBin=src\aften\windows\output
set varWinRAR=c:\Program Files\WinRAR\WinRAR.exe

mkdir "%varOutput%"
mkdir "%varOutput%\Lang"
mkdir "%varOutput%\libaftendll_x86"
mkdir "%varOutput%\libaftendll_x86_SSE"
mkdir "%varOutput%\libaftendll_x86_SSE2"
mkdir "%varOutput%\libaftendll_x86_SSE3"

copy "%varBase%\README.md" "%varOutput%"
copy "%varBase%\CHANGELOG.md" "%varOutput%"
copy "%varBase%\COPYING.TXT" "%varOutput%"

copy "%varBase%\Lang\*.txt" "%varOutput%\Lang"

copy "%varBase%\src\bin\Release\Win32\EncWAVtoAC3.exe" "%varOutput%"
copy "%varBase%\%varPathAftenBin%\libaftendll_x86\libaften.dll" "%varOutput%\libaftendll_x86\libaften.dll"
copy "%varBase%\%varPathAftenBin%\libaftendll_x86_SSE\libaften.dll" "%varOutput%\libaftendll_x86_SSE\libaften.dll"
copy "%varBase%\%varPathAftenBin%\libaftendll_x86_SSE2\libaften.dll" "%varOutput%\libaftendll_x86_SSE2\libaften.dll"
copy "%varBase%\%varPathAftenBin%\libaftendll_x86_SSE3\libaften.dll" "%varOutput%\libaftendll_x86_SSE3\libaften.dll"
copy "%varBase%\engines\unicode\Win32\EncWAVtoAC3.engines" "%varOutput%"
copy "EncWAVtoAC3.portable" "%varOutput%"

"%varWinRAR%" a -ep1 -m5 -r -t "%varOutput%.zip" "%varOutput%\*"
rmdir /S /Q "%varOutput%"

endlocal
