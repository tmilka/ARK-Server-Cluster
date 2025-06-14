@echo off
setlocal enabledelayedexpansion

:: === SteamCMD Pfad ===
set STEAMCMD=steamcmd.exe

:: === Mod-ID für Structures Plus ===
set MODID=731604991

:: === Verzeichnisstruktur wie bei dir ===
set MAPFOLDERLIST=IslandServer ScorchedServer RagnarokServer FjordurServer ValgueroServer

:: === Mod via SteamCMD herunterladen ===
echo [1/4] Lade Structures Plus (ID: %MODID%) via SteamCMD herunter ...
%STEAMCMD% +login anonymous +workshop_download_item 346110 %MODID% +quit

:: === Mod-Dateien vorbereiten ===
set WORKSHOPDIR=steamapps\workshop\content\346110\%MODID%
if not exist "%WORKSHOPDIR%" (
    echo Fehler: Mod konnte nicht heruntergeladen werden!
    pause
    exit /b
)

echo [2/4] Mod wurde erfolgreich heruntergeladen.

:: === Mod in jede Karte kopieren ===
echo [3/4] Installiere Mod in Serverordner ...
for %%S in (%MAPFOLDERLIST%) do (
    set TARGET=%%S\ShooterGame\Content\Mods\%MODID%
    mkdir "!TARGET!" >nul 2>&1
    xcopy /E /Y /I "%WORKSHOPDIR%" "!TARGET!"
    copy /Y "%WORKSHOPDIR%.mod" "%%S\ShooterGame\Content\Mods\%MODID%.mod"

    :: === GameUserSettings.ini bearbeiten ===
    set INIFILE=%%S\ShooterGame\Saved\Config\WindowsServer\GameUserSettings.ini

    :: Mod-Eintrag prüfen oder ergänzen
    findstr /C:"ActiveMods=" "!INIFILE!" >nul
    if !errorlevel! equ 1 (
        echo ActiveMods=%MODID%>>"!INIFILE!"
    ) else (
        powershell -Command "(Get-Content '!INIFILE!') -replace 'ActiveMods=.*', 'ActiveMods=%MODID%' | Set-Content '!INIFILE!'"
    )
)

echo [4/4] Mod wurde erfolgreich installiert und in allen Servern eingetragen.
pause
