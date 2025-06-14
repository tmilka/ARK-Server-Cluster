@echo off
set STEAMCMD=steamcmd.exe
set BASEDIR=%~dp0IslandServer

echo Starte Download fuer IslandServer (TheIsland)
%STEAMCMD% +login anonymous +force_install_dir "%BASEDIR%" +app_update 376030 validate +quit

pause
