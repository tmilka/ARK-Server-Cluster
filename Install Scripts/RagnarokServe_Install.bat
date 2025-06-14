@echo off
set STEAMCMD=steamcmd.exe
set BASEDIR=%~dp0RagnarokServer

echo Starte Download fuer RagnarokServer (Ragnarok)
%STEAMCMD% +login anonymous +force_install_dir "%BASEDIR%" +app_update 376030 validate +quit

pause
