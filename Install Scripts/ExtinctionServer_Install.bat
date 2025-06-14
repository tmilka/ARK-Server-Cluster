@echo off
set STEAMCMD=steamcmd.exe
set BASEDIR=%~dp0ExtinctionServer

echo Starte Download fuer ExtinctionServer (Extinction)
%STEAMCMD% +login anonymous +force_install_dir "%BASEDIR%" +app_update 376030 validate +quit

pause
