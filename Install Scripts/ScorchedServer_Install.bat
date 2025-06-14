@echo off
set STEAMCMD=steamcmd.exe
set BASEDIR=%~dp0ScorchedServer

echo Starte Download fuer ScorchedServer (ScorchedEarth_P)
%STEAMCMD% +login anonymous +force_install_dir "%BASEDIR%" +app_update 376030 validate +quit

pause
