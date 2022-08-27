#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

SetKeyDelay, 0, 50

/::
Run, powershell  -noLogo -ExecutionPolicy unrestricted -file C:\pegasus\scripts\dtam-scripts\ScreenshotTake.ps1,, Hide