@echo off

START QRes.exe /x:2133 /y:1600 /R:60
taskkill /F /IM pegasus-fe.exe
taskkill /F /IM spice.exe
taskkill /F /IM notitg.exe
taskkill /F /IM mame.exe
taskkill /F /IM mame2lit.exe
taskkill /F /IM pcsx2x64.exe
taskkill /F /IM OutFox.exe
taskkill /F /IM game.exe
taskkill /F /IM OpenITG-PC.exe
taskkill /F /IM NotITG-v4.2.0.exe
taskkill /F /IM ITGmania.exe
taskkill /F /IM Mungyodance.exe
taskkill /F /IM Mungyodance2.exe

START pegasus-fe.exe