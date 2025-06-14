@echo off
set STEAMCMD=steamcmd.exe
set BASEDIR=%~dp0FjordurServer

echo Starte Download fuer FjordurServer (Fjordur)
%STEAMCMD% +login anonymous +force_install_dir "%BASEDIR%" +app_update 376030 validate +quit

pause
