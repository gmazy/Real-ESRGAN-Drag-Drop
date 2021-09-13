@echo off

:: Set paths relative to current folder %~dp0
set realesrgan=%~dp0\realesrgan-ncnn-vulkan.exe
set output=%~dp0\output

:: loop through drag&drop files
if [%1]==[] goto :eof
set n=0
:loop
echo %1
call "%realesrgan%" -i %1 -o "%output%\%~n1%~x1"
shift
set /a n+=1
if not [%1]==[] goto loop

timeout 1