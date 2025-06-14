@echo off
set STEAMCMD=steamcmd.exe
set BASEDIR=%~dp0

setlocal enabledelayedexpansion

set MAPS=IslandServer ScorchedServer RagnarokServer FjordurServer ValgueroServer
set MAP_NAMES=TheIsland ScorchedEarth_P Ragnarok Fjordur Valguero_P

set i=0
for %%S in (%MAPS%) do (
    for /f "tokens=%i% delims= " %%M in ("%MAP_NAMES%") do (
        echo Starte Download fuer: %%S mit Karte %%M
        %STEAMCMD% +login anonymous +force_install_dir "!BASEDIR!%%S" +app_update 376030 validate +quit
    )
    set /a i+=1
)
pause
