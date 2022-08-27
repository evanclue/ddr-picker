# ddr-picker
ddr-picker is a [pegasus-fe](https://pegasus-frontend.org/)-based game frontend for Dance Dance Revolution cabinets.<br> it was created to be as fast, pretty, and seamless as possible.

https://user-images.githubusercontent.com/72628412/178119730-f949970a-1269-4377-9f61-493f88cf89aa.mp4

if you are looking for a plug-and-play solution, look elsewhere. this will require a lot of manual reworking for your exact system.<br>
this will NOT WORK on an original CRT without heavy reworking of all the graphics, and scripts.

ddr-picker was specifically optimized for the niche of DDR cabinets that feature a Windows 10 PC plugged into a Dell Ultrasharp U3014 LCD running in 2133 x 1600 resolution (4:3, maxing out the vertical resolution of the monitor) underneath the original display bezel.<br>
the DDR cabinet's control panel is handled using a [J-PAC](https://www.ultimarc.com/control-interfaces/j-pac-en/j-pac-c-control-only-version/), which makes the buttons on the cab function like a keyboard. the lighting is handled using a [LIT board](https://dinsfire.com/projects/lit-board/).

this was a personal project that i originally never intended to share, but i've put enough work into it at this point that i want to save other people the time of building something like this from the ground up.<br>
i'm a [graphic designer](https://clue.graphics), and not a coder -- so ddr-picker is bodged together in the only way i know how: [autohotkey](https://www.autohotkey.com/).

## features:

- custom version of [bemani-mame](https://github.com/987123879113/mame/wiki) that instantly loads KS573 mixes at the title screen, with event mode enabled in every mix that supports it
- every game supports the original cab lighting (bass neons, marquee header spotlights), using a [LIT board](https://dinsfire.com/projects/lit-board/).
- hand-made graphics for every single DDR logo, including many custom square logos that fit better in each "tile"
- custom pegasus theme based on [pegasus-grid-micro](https://github.com/mmatyas/pegasus-theme-grid-micro), optimized for a high-resolution 4:3 display
- reset button to return to the menu after opening a game
- support for DDR Solo, if you have a stage that supports it

---
---

## installation:

### first thing you're gonna need to do is get your cab modded with an LCD.
- acquire a 30" 16:10 display, such as the Dell Ultrasharp U3014.
- safely discharge and remove the original CRT, and store it in a safe place, or sell it to someone that will appreciate it more than you do.
- [build a display mount out of wood so that the 16:10 display lines up perfectly with the original bezel.](https://user-images.githubusercontent.com/72628412/178120376-47b18732-93ec-43bb-a496-6dd16dea765b.jpg)
- be sure to remove the plastic front bezel from the LCD. it reduces the distance between the display and the bezel, and makes it look really nice. this can be done easily with a standard spudger to separate the plastic clips.

---

### next, we gotta get a PC in there.
- get a PC. maybe you have an old rig gathering dust -- you can use that. MAME and simulators aren't very demanding, they'll likely run fine on whatever you already have.
- if you removed the CRT from your DDR cab, you have a ton of room in the back of the monitor box to drop your PC into. that's where i have mine, and it fits very nicely in there.
- create a lightweight Windows 10 install, such as [LTSC](https://docs.microsoft.com/en-us/windows/whats-new/ltsc/), on an SSD with reasonably high capacity. the latest LTSC 2021 is probably fine, but i used LTSC 2019 for no reason in particular.

---

### now, set up your cab stuff.
- install your [LIT board](https://dinsfire.com/projects/lit-board/) to make your cab lights work, and your [J-PAC](https://www.ultimarc.com/control-interfaces/j-pac-en/j-pac-c-control-only-version/) for your control panel. use [WinIPAC v2](http://ultimarc2.com/winipacv2.html) to remap your control panel buttons to keyboard keys.
- i have my control panel set up like this:
![cp-mapping](https://user-images.githubusercontent.com/72628412/178121065-bd7bb1a5-8258-42e7-bedc-ac0ffc1999cd.png)
- i found that this was the best mapping for compatibility with games, and functionality within pegasus-fe's limitations.
- download [custom resolution utility](https://www.monitortests.com/forum/Thread-Custom-Resolution-Utility-CRU) and add 2133x1600@60Hz as a custom resolution. save, and reboot. set the custom resolution. hooray, high-res 4:3!

- but what about the pads?
- ah, right, the dance stages. you can probably use a pair of [STAC boards](https://icedragon.io/stac/) to adapt the original dance stages to PC, but i don't know how to do that, because i don't own original DDR stages. my DDR cab uses [StepManiaX stages](https://shop.steprevolution.com/products/stepmaniax-stage-5th-generation).

---

### at this point, we can finally get started on setting up pegasus.
- download the latest version of [pegasus-fe](https://pegasus-frontend.org/#downloads).
- place pegasus-fe.exe somewhere like `C:/pegasus`. don't run it yet.
- create a blank text document titled `portable.txt` and place it in your `C:/pegasus` directory next to `pegasus-fe.exe`
- download the [modified micro theme zip](https://github.com/evanclue/ddr-picker/raw/main/pegasus-stuff/micro.zip).
- create a new directory in your pegasus folder just called `themes`, and extract the micro zip in there.
- the full path for the micro theme should be `C:/pegasus/themes/micro/`.
- download [settings.txt](https://github.com/evanclue/ddr-picker/raw/main/pegasus-stuff/settings.txt). once you click the link, right-click and do "save page as" to download it.
- create a new folder called 'config' in the pegasus directory.
- drop the settings.txt in there. full path should be `C:/pegasus/config/settings.txt`
- if you open pegasus now, it should give you an error saying there are no games installed. so let's get some games!

---

### now, we can set up MAME for DDR.
i've assembled a ready-to-go pack to get MAME going on your DDR cabinet.<br>you can download it [here](https://drive.google.com/file/d/1MeW7KpsYcS2fmws7ZQG0OomuIFVHAcid/view?usp=sharing), [here](https://mega.nz/file/ICVRFJwI#ksriX9qHzXEdDwwjsqYv84MN1V43CSedjK8lEosV_7Y), or [here](https://archive.org/download/ddr573-mame/ddr573-mame.zip). (12GB)<br><br>
it includes:
  - a custom build of [bemani-mame](https://github.com/987123879113/mame/wiki).
  - pre-built NVRAM for (almost) every game, negating the need to install each game manually.
  - save states that drop you right into the title screen of the game with event mode already enabled, skipping the lengthy boot process.
  - all the game data you need to get it going.

once you have the MAME pack downloaded, you should extract it to `C:/pegasus/games/ddr573-mame` for example.<br>
now that we have MAME, we can start writing scripts to get games to launch.

---

### writing scripts to get games to launch.

you can do this a few different ways. you can do it using a mame.exe shortcut, you can do it as a batch script -- but i've had trouble getting pegasus to open .lnk and .bat files sometimes, and i couldn't really figure out why.<br>my solution was to use autohotkey, compile my scripts as .exe, and have pegasus open the .exe file.

by doing it this way, however, it seems to break pegasus's process watchdog feature, which causes the frontend to restart alongside the game, wasting resources. luckily, this is an easy fix, and just requires us to run a .bat file to kill pegasus before starting the game.

so let's do it.
- install [autohotkey](https://www.autohotkey.com/).
- download the [kill_pegasus script](https://github.com/evanclue/ddr-picker/raw/main/scripts/kill_pegasus.bat), and [this launcher script for DDR Extreme Pro Clarity](https://github.com/evanclue/ddr-picker/raw/main/scripts/launch_ddrexproc.ahk) by right-clicking the page, and doing 'save page as'.
- put both of the scripts next to the mame executable in the `ddr573-mame` folder.

let's take a look at what these scripts actually do.

`run kill_pegasus.bat`<br>
  this will end the pegasus process as soon as the game is opened. it must be a separate batch script, since autohotkey is not authorized to do system tasks like ending a process.<br>
`run mame2lit.exe`<br>
  this runs the mame support program that handles cab lights for a LIT board.<br>
`run mame.exe ddrexproc -state o`<br>
  this tells mame to load DDR Extreme Pro Clarity using a specific save state named 'o'.<br>
i made a save state right before the title screen of the game in event mode, and named them all 'o'. why 'o'? i don't know. whatever, shut up!

- go ahead and run the launcher script. it should drop you into the ddr extreme title screen, with light support. hooray!
- to exit mame, just press esc.
- you can now right click on the .ahk file you made, and click "compile script" to create an .exe of the script that pegasus can run later.

you can easily copy the launcher script, and edit it to point at different games.<br>
to see what save states exist in the pack, you can view `C:\pegasus\games\ddr573-mame\sta`.<br>
all you have to do is replace `ddrexproc` in the launcher script with the name of the games in the `sta` folder that you want to run.<br>
for instance, if you replaced it with `ddr2m`, it would launch Dance Dance Revolution 2ndMIX.<br>
feel free to repeat this for every game listed in the `sta` folder that you want to have in your pegasus setup.

i have uploaded a [whole bunch of example mame launcher scripts](https://github.com/evanclue/ddr-picker/tree/main/scripts/ahk-launcher-scripts). feel free to download and use them however you like!

you can see what mame name corresponds with each DDR game [here](https://github.com/987123879113/mame/wiki/Dance-Dance-Revolution-%7C-Dancing-Stage).

**pro tip:** if you want to have increased visual clarity when booting a game, you can create a shortcut of `kill_pegasus.bat`, `mame2lit.exe`, and `mame.exe`, edit the properties of each shortcut so that they start 'minimized', and then point the autohotkey launcher script to their respective .lnk shortcut files.<br>they will start minimized, and it looks really clean. i prefer it, but whether or not you choose to do it yourself is up to you.

---

### downloading assets for pegasus
- okay, so we have some game launchers written in autohotkey, and compiled to .exe.
- now, we can download the logos for each game you want to have in your launcher.
- you can download [individual logos](https://github.com/evanclue/ddr-picker/tree/main/assets), or you can just download [the whole pack](https://github.com/evanclue/ddr-picker/raw/main/assets.zip).
- there isn't really any reason why you shouldn't download the whole pack, considering it's only like 9MB of images. but the choice is yours.
- create a new folder inside of the 'config' folder of your pegasus setup, called `metafiles`.
- the full path should be `C:\pegasus\config\metafiles`. drag the assets folder in there, to make it `C:\pegasus\config\metafiles\assets`.
- you should now have a whole bunch of .png files of various ddr logos inside of `C:\pegasus\config\metafiles\assets`.

---

### setting up the metadata files
- download this [ddr metadata template file](https://github.com/evanclue/ddr-picker/raw/main/scripts/ddr.metadata.pegasus.txt) by right-clicking and doing 'save page as', and place it in your `metafiles` folder, next to `assets`.
- the full path should be `C:\pegasus\config\metafiles\ddr.metadata.pegasus.txt`
- you should be able to boot up pegasus-fe finally, and scroll around! hooray! look how pretty it is!
- the only game you should be able to launch successfully is extreme pro clarity, since we set it up earlier.
- you will need to manually go through your ddr metadata file, remove the games you don't want, and add paths to the launchers of all the games you DO want.
- this is the tedious part, since you'll have to make an autohotkey launcher script for each game, and add the path of each launcher to the metadata file per-game. in the template, replace the `[insert path here]` with the path to your launcher for each game.
- i have also made metafile templates for [Dancing Stage](https://github.com/evanclue/ddr-picker/raw/main/scripts/dancingstage.metadata.pegasus.txt), [In The Groove](https://github.com/evanclue/ddr-picker/raw/main/scripts/itg.metadata.pegasus.txt), and [DDR Solo](https://github.com/evanclue/ddr-picker/raw/main/scripts/solo.metadata.pegasus.txt).
- drop these other template files into your metafiles directory, and you can scroll between each page with numpad 4 and numpad 6. they should have nice little collection logos on the top of the screen to match.

- once you've gone through and made scripts for every game, added them to the corresponding metadata file, and tested each and every game to make sure they launch fine through pegasus, you can start setting up your controls in MAME.

---

### setting up controls in MAME.

- open a game using pegasus, or by running your launcher manually.
- press TAB. this will open a settings menu.
- scroll to *Input (this machine)* and press enter.
- systematically clear every control in the list by pressing delete, then the down arrow. delete, down, delete, down, delete, etc., until the list is entirely cleared.
- *Up*, *Down*, *Left*, and *Right* corresponds to the dance pad.
- *Button 2* is the left selector button, and *Button 3* is the right selector button. setting *Button 1* won't do anything, don't bother.
- *Player Start* is the start button.
- apply these settings for both P1 and P2.
- press tab to close the menu.
- press esc. to gracefully exit mame to make sure your settings will be saved.
- you will have to do this for each game individually, but you only have to do it once.

---

### automating windows to run the frontend at startup.

it's all starting to look very promising. we have a frontend for DDR that looks great, all the games' controls are set up, the cab lights are working, and you can navigate the frontend using the cab buttons.

now all we have to do is **automate windows to run the frontend at startup.**

i've tried all sorts of methods of booting a program on startup, and they are all way, way too slow.<br>
putting a shortcut in the "startup" folder, adding a value to the "run" command in registry... i even tried doing it in [windows task scheduler](https://docs.microsoft.com/en-us/windows/win32/taskschd/task-scheduler-start-page), which was hell. and, annoyingly, it was equally as slow as the other methods. 30-60 seconds after reaching the desktop is unacceptable to me.

the fastest and most effective method, albeit a bit aggressive, is to replace the windows shell with our own script.<br>
this means that windows never initializes background services, which means you get more processing power for your games, and no annoying shit like windows defender. it also never initializes explorer.exe, which means no desktop icons, start menu, etc.<br>
perfect for a "kiosk" setup like this!<br>

- download [QRes.exe](https://github.com/evanclue/ddr-picker/raw/main/scripts/QRes.exe) and [pegasus-startup.ahk](https://github.com/evanclue/ddr-picker/raw/main/scripts/pegasus-startup.ahk), and place them in your `C:\pegasus` directory.

let's take a look at what this script actually does.<br>
`run QRes.exe /x:2133 /y:1600 /R:60`<br>
this will reset the monitor's resolution to 2133x1600, at 60Hz. if your monitor's resolution got out of wack from a game messing it up or something, this will make sure it always boots into the resolution we want, right from startup.<br>
`run pegasus-fe.exe`<br>
and, of course, we want pegasus to start as soon as possible, so here it is.

- compile the .ahk script to .exe.
- open regedit, and navigate to `HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon`. don't drop down the winlogon folder, just click on it.
- you should now be able to see *Shell* on the right side. double-click on it, and replace `explorer.exe` with `C:\pegasus\pegasus-startup.exe`
- this will run our startup script immediately on boot, while disabling explorer, and other things we don't need.
- reboot.
- while in this "dedicated" pegasus mode, you can do ctrl+shift+esc to open task manager. do file>run, and you can open explorer.exe to do whatever file management tweaks you need to do. you can open regedit as well using the run prompt to revert the shell back to `explorer.exe` if you need to.

---

### adding a reset button.

after opening a game, the only way for us to close the game and get back to the menu is to do it ourselves, or reboot.<br>
that sucks. let's make a reset button!

the way i made this happen is with a combination of hardware and software tweaks.<br>
i added a [physical reset button to my cab's coindoor](https://user-images.githubusercontent.com/72628412/178127104-343ae045-aaf1-47c7-aba1-c28c2190d382.jpg), as demonstrated in the video at the top of this readme.<br>
i wired the button up to the coin signal wires, which a J-PAC is able to bind to a keyboard key using WinIPAC v2.<br>
so, i assigned the coin assembly to output the F12 key. which means i essentially have a physical F12 key on my coindoor now.<br>
using an extremely simple autohotkey + batch solution, we can make this act as a "reset" button that closes whatever game is open, and returns to pegasus.<br>

- download [reset-button.ahk](https://github.com/evanclue/ddr-picker/raw/main/scripts/reset-button.ahk) and [killall-reset.bat](https://github.com/evanclue/ddr-picker/raw/main/scripts/killall-reset.bat) and place both of them into your pegasus folder.

let's take a look at what these scripts actually do.<br>
`reset-button.ahk` sits in memory forever and waits for the F12 key to be pressed. when it is pressed, it runs killall-reset.bat.<br>
`killall-reset.bat` resets the resolution to 2133x1600 in case a game changed the resolution, then checks if any game programs are open.<br>
if they are, it ends the processes, and restarts pegasus.

so now, all we have to do is make the reset button script start at boot.
- compile reset-button.ahk into an .exe using the right-click menu.
- open pegasus-startup.ahk with a text editor, and add `run reset-button.exe` to it.
- save the document, and re-compile pegasus-startup.ahk into an .exe.

---

### additional modifications and contributions.

Hey all, [Dean](https://github.com/dtammam) here - I absolutely loved this project, implemented it on my cab and could not get over how cool it was. I also found that I had additional ideas to make it even better, connected with Clue and submitted some of these as contributions. 
You can see all of my files that I figured could be relevant in the `scripts\dtam-scripts` directory, and I'll explain the general ideas below.

---

#### automating the transition between kiosk mode and admin mode quickly.

I wanted to get fancy and make transitioning from 'kiosk' mode to 'admin mode' smooth and simple with a new set of extra scripts since I found making meaningful changes to files annoying in the limited 'kiosk' mode. If you're interested, checkout the following files in this repo:

- F1ToKioskModeAndReboot.ahk
- F2ToAdminModeAndReboot.ahk
- ShellToGame.bat
- ShellToPC.bat
- ShellToGame.reg
- ShellToPC.reg
- reboot.ps1

These files effectively automate the portion above for replacing `explorer.exe` with `C:\pegasus\pegasus-startup.exe` and vice versa in `HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon` by setting the appropriate key and rebooting the computer with a mapped button via .AHK script (F1 and F2 in this example, but easily modifiable):

- F1ToKioskModeAndReboot.ahk and F2ToAdminModeAndReboot.ahk each run ShellToGame.bat & reboot.ps1 or ShellToPC.bat & reboot.ps1 respectively.
- ShellToGame.bat opens ShellToGame.reg and imports it into the registry, while ShellToPC.bat opens ShellToPC.reg and imports it into the registry.
- reboot.ps1 kicks off an immediate computer reboot and starts it up in the correct 'mode', now that the key is set to what we want.

---

#### managing volume while in kiosk mode.

I realized quickly that running Windows without `explorer.exe` running has a bunch of second order consequences. One of the consequences was that the audio on-screen display (OSD) didn't work without Explorer running - I was only able to adjust volume by using the volume knob within the cab. To deal with this, I researched and found out about [this solution](https://www.reddit.com/r/gpdwin/comments/aroc9v/fix_using_volume_keys_with_a_custom_shell_not_gpd/) which totally worked - all you need to do is follow the instructions in that page, [install the app](https://github.com/sirWest/AudioSwitch/releases) and get it to start with your startup .AHK by adding a new .bat file:

- backendcontrols.bat

When you do this, the startup script goes and launches the .exe for Audio Controls in the background and restores functionality (putting it in a startup folder doesn't work, because, well - `explorer.exe` isn't running) and lets you use your beloved media control keys to change the volume :)

---

#### send screenshots to your phone.

This one is more for a private setup and less applicable for a shared cabinet.
When I get good scores, I want to share pics of those scores with my friends. So I'd whip out my phone to take the pics... and more often than not would get distracted, opening other apps and checking notifications - that's no good if I'm trying to get a real workout in. So, I needed to figure out a way to take pics of great scores without needing to use my phone to do it. Hence, my solution below:

- Pick your cloud photo service of choice (iCloud, Google Photos, Dropbox, etc.)
- Install it on your cabinet, log it in and set it to auto start
- Pick a button that will be used to initiate a screenshot and then save the photo into the relevant folder in your cloud app

I use iCloud, and will use it for this explanation. You'll need a few files:

- ScreenshotTake.ps1
- PlusToCopyScreen.ahk
- SlashToCopyScreen.ahk
- backendcontrols.bat

It's actually pretty much ready to use. All you need to do is figure out which button you want and which folder your photos need to land into to get automatically uploaded to the cloud provider of your choice, and update `Line 47` of ScreenshotTake.ps1 to make the correct directory precede the file in the variable. ScreenshotTake.ps1 is a cool script that basically takes a .jpg image of your screen using .NET and saves it in the location of your choice. My setup saves it here, but will need to be updated depending on where your `Upload` directory is:

  `$File = "C:\Users\me\Pictures\Uploads\$($FileName).jpg"`

Once done... compile the button specific .ahk files and reference them in your `pegasus-startup.ahk` (feel free to reference my `startall.ahk` for an example), update your `backendcontrols.bat` to include any relevant .exe's for the cloud provider (again, putting it in a startup folder doesn't work, because `explorer.exe` isn't running), compile your .ahk's into .exe's and you should be all set!

Passing it back to Clue to wrap.

---

### you did it! hooray!
now you have a ddr-picker setup for your cab! this took me literally all day to write, and i hope i didn't miss anything.
if you need any further help, feel free to reach out to me on [discord](https://discord.gg/clue).
