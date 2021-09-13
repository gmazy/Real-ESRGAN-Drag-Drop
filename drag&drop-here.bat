:: :::::::::::::::::::::::::::::::::::::::::::::
:: Drag & Drop handler for Real-ESRGAN / Waifu2x
:: License: CC0
:: :::::::::::::::::::::::::::::::::::::::::::::

@echo off

:: Output folder relative to current folder %~dp0
set output=%~dp0\output

:: Real ESRGAN path
set executable=%~dp0\realesrgan-ncnn-vulkan.exe

:: Waifu2x path
if not exist "%executable%" (
	set executable=%~dp0\waifu2x-ncnn-vulkan.exe
)

:: Create output folder
if not exist "%output%" mkdir "%output%"

:: loop through drag&drop files
if [%1]==[] goto :eof
set n=0
:loop
echo %1
call "%executable%" -i %1 -o "%output%\%~n1%~x1"
shift
set /a n+=1
if not [%1]==[] goto loop

timeout 1