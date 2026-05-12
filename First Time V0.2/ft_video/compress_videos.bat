@echo off
echo Starting video compression...
echo.

set OUTPUT_DIR=compressed
if not exist "%OUTPUT_DIR%" mkdir "%OUTPUT_DIR%"

for %%f in (*.mp4 *.webm *.mov) do (
    echo.
    echo Compressing: %%f
    ffmpeg -i "%%f" -c:v libvpx-vp9 -crf 35 -b:v 0 -c:a libopus -b:a 48k -y "%OUTPUT_DIR%\%%~nf.webm"
    if %errorlevel% neq 0 (
        echo ERROR compressing %%f
    ) else (
        echo Success: %%f
    )
)

echo.
echo ================================
echo All done! Check the "compressed" folder.
pause