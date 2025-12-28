@echo off
nasm -f win64 %1.asm -o %1.obj
gcc %1.obj -o %1.exe

echo Build Complete
echo Running
echo %TIME%
%1.exe
echo %TIME%
