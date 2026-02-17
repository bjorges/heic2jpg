@echo off
setlocal enabledelayedexpansion

REM === HEIC to JPG converter ===
REM Converts all .heic files in the given folder (and subfolders) to .jpg
REM Skips files that already have a .jpg version
REM
REM Usage: convert-heic.bat [folder]
REM   If no folder is given, uses the current directory.
REM
REM Requires: ImageMagick 7 installed and "magick" on PATH
REM   https://imagemagick.org/archive/binaries/ImageMagick-7.1.2-13-Q16-HDRI-x64-dll.exe

REM Check that magick is available
where magick >nul 2>nul
if errorlevel 1 (
    echo ERROR: magick.exe not found on PATH.
    echo Please install ImageMagick and make sure "Add to system PATH" was checked during install.
    pause
    exit /b 1
)

REM Determine source folder
set "SRC=%~1"
if "%SRC%"=="" set "SRC=%cd%"

echo Converting HEIC files in: %SRC%
echo.

set converted=0
set skipped=0

for /r "%SRC%" %%F in (*.heic *.HEIC) do (
    set "input=%%F"
    set "output=%%~dpnF.jpg"

    if exist "!output!" (
        echo SKIP: %%~nxF  (jpg already exists)
        set /a skipped+=1
    ) else (
        echo CONVERT: %%~nxF
        magick "!input!" "!output!"
        if errorlevel 1 (
            echo   WARNING: failed to convert %%~nxF
        ) else (
            set /a converted+=1
        )
    )
)

echo.
echo Done. Converted: %converted%  Skipped: %skipped%
pause
