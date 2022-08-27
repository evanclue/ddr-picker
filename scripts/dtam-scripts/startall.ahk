#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

run pegasus-fe.exe
run CommaToKillAll.exe
run PeriodToResetAllPegasus.exe
run PlusToCopyScreen.exe
run SlashToCopyScreen.exe
run SpacebarToResetAllPegasus.exe
run backendcontrols.bat
run TildeToRebootMachine.exe
run F1ToKioskModeAndReboot.exe
run F2ToAdminModeAndReboot.exe
Run, powershell  -noLogo -ExecutionPolicy unrestricted -file C:\pegasus\scripts\FocusPegasus.ps1,, Hide