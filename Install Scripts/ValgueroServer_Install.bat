@echo off
set STEAMCMD=steamcmd.exe
set BASEDIR=%~dp0ValgueroServer

echo Starte Download fuer ValgueroServer (Valguero_P)
%STEAMCMD% +login anonymous +force_install_dir "%BASEDIR%" +app_update 376030 validate +quit

pause
