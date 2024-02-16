@echo off
setlocal enabledelayedexpansion

cd Store

for /f "tokens=1-5 delims=:. " %%a in ("%time%") do (
    set hour=%%a
    set minute=%%b
)

for /f "tokens=1-3 delims=/-" %%a in ("%date%") do (
    set "day=%%a"
    set "month=%%b"
    set "year=%%c"
)

set "year=!year:~-2!"
set "month2=!month:~-1!"

set "directory_name=!year!.!month2!.!day!"
if not exist "!directory_name!\" (
    mkdir "!directory_name!" || (echo Failed to create directory. & exit /b 1)
)

cd "!directory_name!" || (echo Failed to change into directory. & exit /b 1)

set "file_name=!day!.!month!.!year!.!hour!.!minute!.txt"
echo. > "!file_name!" || (echo Failed to create file. & exit /b 1)

echo Directory '!directory_name!' and file '!file_name!' created successfully.

start notepad.exe "!file_name!"
