@echo off
REM 🍣 Maki Client - .mcpack Builder (Windows)
REM Erstellt automatisch die fertige .mcpack Datei

echo.
echo ========================================
echo  🍣 Maki Client .mcpack Builder
echo ========================================
echo.

REM Temp-Ordner erstellen
if exist "temp_mcpack" rmdir /s /q "temp_mcpack"
mkdir temp_mcpack

echo [1/4] Kopiere behavior_pack...
xcopy /E /I /Y "behavior_pack" "temp_mcpack\behavior_pack" >nul

echo [2/4] Kopiere resource_pack...
xcopy /E /I /Y "resource_pack" "temp_mcpack\resource_pack" >nul

echo [3/4] Erstelle .mcpack (ZIP)...
powershell -Command "Add-Type -AssemblyName System.IO.Compression.FileSystem; [System.IO.Compression.ZipFile]::CreateFromDirectory('temp_mcpack', 'Maki-Client.mcpack')"

echo [4/4] Bereinige temp Dateien...
rmdir /s /q "temp_mcpack"

echo.
echo FERTIG!
echo.
echo Die Datei 'Maki-Client.mcpack' wurde erstellt!
echo.
pause
