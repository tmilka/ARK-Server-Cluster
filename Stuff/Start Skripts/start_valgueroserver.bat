@echo off
cd /d "ValgueroServer\ShooterGame\Binaries\Win64"

start ShooterGameServer.exe "Valguero_P?listen?SessionName=TheBoisARK_Valguero?ServerPassword=Milchmann01?ServerAdminPassword=AdminMilchmann01?Port=7785?QueryPort=27019?RCONPort=7786?GameModIds=731604991" -NoBattlEye -clusterid=TheBoisARK -clusterunsharable -server -log
pause
