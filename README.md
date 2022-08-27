# ddr-picker
ddr-picker is a [pegasus-fe](https://pegasus-frontend.org/)-based game frontend for Dance Dance Revolution cabinets.<br> It was created to be as fast, pretty, and as seamless as possible.

https://user-images.githubusercontent.com/72628412/178119730-f949970a-1269-4377-9f61-493f88cf89aa.mp4

If you are looking for a plug-and-play solution, look elsewhere - this will require a lot of manual reworking for your exact system.<br>
This WILL NOT WORK on an original CRT without heavy reworking of all the graphics, and scripts.

ddr-picker was specifically optimized for the niche of DDR cabinets that feature a Windows 10 PC plugged into a Dell Ultrasharp U3014 LCD running in 2133 x 1600 resolution (4:3, maxing out the vertical resolution of the monitor) underneath the original display bezel.<br>
The DDR cabinet's control panel is handled using a [J-PAC](https://www.ultimarc.com/control-interfaces/j-pac-en/j-pac-c-control-only-version/), which makes the buttons on the cab function like a keyboard. The lighting is handled using a [LIT board](https://dinsfire.com/projects/lit-board/).

This was a personal project that I originally never intended to share, but I've put enough work into it at this point that I want to save other people the time of building something like this from the ground up.<br>
I'm a [graphic designer](https://clue.graphics), and not a coder -- so ddr-picker is bodged together in the only way i know how: [autohotkey](https://www.autohotkey.com/).

## Features:

- Custom version of [bemani-mame](https://github.com/987123879113/mame/wiki) that instantly loads KS573 mixes at the title screen, with event mode enabled in every mix that supports it
- Every game supports the original cab lighting (bass neons, marquee header spotlights), using a [LIT board](https://dinsfire.com/projects/lit-board/).
- Hand-made graphics for every single DDR logo, including many custom square logos that fit better in each "tile"
- Custom Pegasus theme based on [pegasus-grid-micro](https://github.com/mmatyas/pegasus-theme-grid-micro), optimized for a high-resolution 4:3 display
- Reset button to return to the menu after opening a game
- Support for DDR Solo, if you have a stage that supports it

---
---

## Installation:

### First thing you're gonna need to do is get your cab modded with an LCD.
- Acquire a 30" 16:10 display, such as the Dell Ultrasharp U3014.
- Safely discharge and remove the original CRT, and store it in a safe place, or sell it to someone that will appreciate it more than you do.
- [build a display mount out of wood so that the 16:10 display lines up perfectly with the original bezel.](https://user-images.githubusercontent.com/72628412/178120376-47b18732-93ec-43bb-a496-6dd16dea765b.jpg)
- Be sure to remove the plastic front bezel from the LCD. it reduces the distance between the display and the bezel, and makes it look really nice. this can be done easily with a standard spudger to separate the plastic clips.

---

### Next, we gotta get a PC in there.
- Get a PC. Maybe you have an old rig gathering dust -- you can use that. MAME and simulators aren't very demanding, they'll likely run fine on whatever you already have.
- If you removed the CRT from your DDR cab, you have a ton of room in the back of the monitor box to drop your PC into. That's where I have mine, and it fits very nicely in there.
- Create a lightweight Windows 10 install, such as [LTSC](https://docs.microsoft.com/en-us/windows/whats-new/ltsc/) on an SSD with reasonably high capacity. The latest LTSC 2021 is probably fine, but I used LTSC 2019 for no reason in particular.

---

### Now, set up your cab stuff.
- Install your [LIT board](https://dinsfire.com/projects/lit-board/) to make your cab lights work, and your [J-PAC](https://www.ultimarc.com/control-interfaces/j-pac-en/j-pac-c-control-only-version/) for your control panel. Use [WinIPAC v2](http://ultimarc2.com/winipacv2.html) to remap your control panel buttons to keyboard keys.
- I have my control panel set up like this:
![cp-mapping](https://user-images.githubusercontent.com/72628412/178121065-bd7bb1a5-8258-42e7-bedc-ac0ffc1999cd.png)
- I found that this was the best mapping for compatibility with games, and functionality within Pegasus' limitations.
- Download [custom resolution utility](https://www.monitortests.com/forum/Thread-Custom-Resolution-Utility-CRU) and add 2133x1600@60Hz as a custom resolution. save, and reboot. Set the custom resolution. Hooray, high-res 4:3!

- But what about the pads?
- Ah, right, the dance stages. you can probably use a pair of [STAC boards](https://icedragon.io/stac/) to adapt the original dance stages to PC, but I don't know how to do that, because I don't own original DDR stages. my DDR cab uses [StepManiaX stages](https://shop.steprevolution.com/products/stepmaniax-stage-5th-generation).

---

### At this point, we can finally get started on setting up Pegasus.
- Download the latest version of [pegasus-fe](https://pegasus-frontend.org/#downloads).
- Place pegasus-fe.exe somewhere like `C:/pegasus`. don't run it yet.
- Create a blank text document titled `portable.txt` and place it in your `C:/pegasus` directory next to `pegasus-fe.exe`
- Download the [modified micro theme zip](https://github.com/evanclue/ddr-picker/raw/main/pegasus-stuff/micro.zip).
- Create a new directory in your Pegasus folder just called `themes`, and extract the micro zip in there.
- The full path for the micro theme should be `C:/pegasus/themes/micro/`.
- Download [settings.txt](https://github.com/evanclue/ddr-picker/raw/main/pegasus-stuff/settings.txt). Once you click the link, right-click and do "save page as" to download it.
- Create a new folder called 'config' in the Pegasus directory.
- Drop the settings.txt in there. full path should be `C:/pegasus/config/settings.txt`
- If you open Pegasus now, it should give you an error saying there are no games installed... so let's get some games!

---

### Now, we can set up MAME for DDR.
I've assembled a ready-to-go pack to get MAME going on your DDR cabinet.<br>You can download it [here](https://drive.google.com/file/d/1MeW7KpsYcS2fmws7ZQG0OomuIFVHAcid/view?usp=sharing), [here](https://mega.nz/file/ICVRFJwI#ksriX9qHzXEdDwwjsqYv84MN1V43CSedjK8lEosV_7Y), or [here](https://archive.org/download/ddr573-mame/ddr573-mame.zip). (12GB)<br><br>
It includes:
  - A custom build of [bemani-mame](https://github.com/987123879113/mame/wiki).
  - Pre-built NVRAM for (almost) every game, negating the need to install each game manually.
  - Save states that drop you right into the title screen of the game with event mode already enabled, skipping the lengthy boot process.
  - All the game data you need to get it going.

Once you have the MAME pack downloaded, you should extract it to `C:/pegasus/games/ddr573-mame` for example.<br>
Now that we have MAME, we can start writing scripts to get games to launch.

---

### Writing scripts to get games to launch.

You can do this a few different ways. You can do it using a mame.exe shortcut, you can do it as a batch script -- but I've had trouble getting pegasus to open .lnk and .bat files sometimes, and I couldn't really figure out why.<br>My solution was to use autohotkey, compile my scripts as .exe, and have Pegasus open the .exe file.

By doing it this way, however, it seems to break Pegasus' process watchdog feature, which causes the frontend to restart alongside the game, wasting resources. luckily, this is an easy fix, and just requires us to run a .bat file to kill Pegasus before starting the game.

So let's do it.
- Install [autohotkey](https://www.autohotkey.com/).
- Download the [kill_pegasus script](https://github.com/evanclue/ddr-picker/raw/main/scripts/kill_pegasus.bat), and [this launcher script for DDR Extreme Pro Clarity](https://github.com/evanclue/ddr-picker/raw/main/scripts/launch_ddrexproc.ahk) by right-clicking the page, and doing 'save page as'.
- Put both of the scripts next to the mame executable in the `ddr573-mame` folder.

Let's take a look at what these scripts actually do.

`run kill_pegasus.bat`<br>
  This will end the Pegasus process as soon as the game is opened. It must be a separate batch script, since autohotkey is not authorized to do system tasks like ending a process.<br>
`run mame2lit.exe`<br>
  This runs the mame support program that handles cab lights for a LIT board.<br>
`run mame.exe ddrexproc -state o`<br>
  This tells mame to load DDR Extreme Pro Clarity using a specific save state named 'o'.<br>
I made a save state right before the title screen of the game in event mode, and named them all 'o'. why 'o'? I don't know. whatever, shut up!

- Go ahead and run the launcher script. it should drop you into the ddr extreme title screen, with light support. hooray!
- To exit mame, just press esc.
- You can now right click on the .ahk file you made, and click "compile script" to create an .exe of the script that Pegasus can run later.

You can easily copy the launcher script, and edit it to point at different games.<br>
To see what save states exist in the pack, you can view `C:\pegasus\games\ddr573-mame\sta`.<br>
All you have to do is replace `ddrexproc` in the launcher script with the name of the games in the `sta` folder that you want to run.<br>
For instance, if you replaced it with `ddr2m`, it would launch Dance Dance Revolution 2ndMIX.<br>
Feel free to repeat this for every game listed in the `sta` folder that you want to have in your Pegasus setup.

I have uploaded a [whole bunch of example mame launcher scripts](https://github.com/evanclue/ddr-picker/tree/main/scripts/ahk-launcher-scripts). Feel free to download and use them however you like!

You can see what mame name corresponds with each DDR game [here](https://github.com/987123879113/mame/wiki/Dance-Dance-Revolution-%7C-Dancing-Stage).

**Pro tip:** if you want to have increased visual clarity when booting a game, you can create a shortcut of `kill_pegasus.bat`, `mame2lit.exe`, and `mame.exe`, edit the properties of each shortcut so that they start 'minimized', and then point the autohotkey launcher script to their respective .lnk shortcut files.<br>they will start minimized, and it looks really clean. i prefer it, but whether or not you choose to do it yourself is up to you.

---

### Downloading assets for Pegasus
- Okay, so we have some game launchers written in autohotkey, and compiled to .exe.
- Now, we can download the logos for each game you want to have in your launcher.
- You can download [individual logos](https://github.com/evanclue/ddr-picker/tree/main/assets), or you can just download [the whole pack](https://github.com/evanclue/ddr-picker/raw/main/assets.zip).
- There isn't really any reason why you shouldn't download the whole pack, considering it's only like 9MB of images. But the choice is yours.
- Create a new folder inside of the 'config' folder of your Pegasus setup, called `metafiles`.
- The full path should be `C:\pegasus\config\metafiles`. Drag the assets folder in there, to make it `C:\pegasus\config\metafiles\assets`.
- You should now have a whole bunch of .png files of various ddr logos inside of `C:\pegasus\config\metafiles\assets`.

---

### Setting up the metadata files
- Download this [ddr metadata template file](https://github.com/evanclue/ddr-picker/raw/main/scripts/ddr.metadata.pegasus.txt) by right-clicking and doing 'save page as', and place it in your `metafiles` folder, next to `assets`.
- The full path should be `C:\pegasus\config\metafiles\ddr.metadata.pegasus.txt`
- You should be able to boot up pegasus-fe finally, and scroll around! hooray! look how pretty it is!
- The only game you should be able to launch successfully is extreme pro clarity, since we set it up earlier.
- You will need to manually go through your ddr metadata file, remove the games you don't want, and add paths to the launchers of all the games you DO want.
- This is the tedious part, since you'll have to make an autohotkey launcher script for each game, and add the path of each launcher to the metadata file per-game. in the template, replace the `[insert path here]` with the path to your launcher for each game.
- I have also made metafile templates for [Dancing Stage](https://github.com/evanclue/ddr-picker/raw/main/scripts/dancingstage.metadata.pegasus.txt), [In The Groove](https://github.com/evanclue/ddr-picker/raw/main/scripts/itg.metadata.pegasus.txt), and [DDR Solo](https://github.com/evanclue/ddr-picker/raw/main/scripts/solo.metadata.pegasus.txt).
- Drop these other template files into your metafiles directory, and you can scroll between each page with numpad 4 and numpad 6. They should have nice little collection logos on the top of the screen to match.

- Once you've gone through and made scripts for every game, added them to the corresponding metadata file, and tested each and every game to make sure they launch fine through pegasus, you can start setting up your controls in MAME.

---

### Setting up controls in MAME

- Open a game using Pegasus, or by running your launcher manually.
- Press TAB. this will open a settings menu.
- Scroll to *Input (this machine)* and press enter.
- Systematically clear every control in the list by pressing delete, then the down arrow. delete, down, delete, down, delete, etc., until the list is entirely cleared.
- *Up*, *Down*, *Left*, and *Right* corresponds to the dance pad.
- *Button 2* is the left selector button, and *Button 3* is the right selector button. setting *Button 1* won't do anything, don't bother.
- *Player Start* is the start button.
- Apply these settings for both P1 and P2.
- Press tab to close the menu.
- Press esc. to gracefully exit mame to make sure your settings will be saved.
- Uou will have to do this for each game individually, but you only have to do it once.

---

### Automating windows to run the frontend at startup.

It's all starting to look very promising. we have a frontend for DDR that looks great, all the games' controls are set up, the cab lights are working, and you can navigate the frontend using the cab buttons.

Now all we have to do is **automate windows to run the frontend at startup.**

I've tried all sorts of methods of booting a program on startup, and they are all way, way too slow.<br>
Putting a shortcut in the "startup" folder, adding a value to the "run" command in registry... I even tried doing it in [windows task scheduler](https://docs.microsoft.com/en-us/windows/win32/taskschd/task-scheduler-start-page), which was hell. and, annoyingly, it was equally as slow as the other methods. 30-60 seconds after reaching the desktop is unacceptable to me.

The fastest and most effective method, albeit a bit aggressive, is to replace the Windows shell with our own script.<br>
This means that windows never initializes background services, which means you get more processing power for your games, and no annoying shit like Windows defender. It also never initializes explorer.exe, which means no desktop icons, start menu, etc.<br>
Perfect for a "kiosk" setup like this!<br>

- Download [QRes.exe](https://github.com/evanclue/ddr-picker/raw/main/scripts/QRes.exe) and [pegasus-startup.ahk](https://github.com/evanclue/ddr-picker/raw/main/scripts/pegasus-startup.ahk), and place them in your `C:\pegasus` directory.

Let's take a look at what this script actually does.<br>
`run QRes.exe /x:2133 /y:1600 /R:60`<br>
This will reset the monitor's resolution to 2133x1600, at 60Hz. If your monitor's resolution got out of wack from a game messing it up or something, this will make sure it always boots into the resolution we want, right from startup.<br>
`run pegasus-fe.exe`<br>
And, of course, we want Pegasus to start as soon as possible, so here it is.

- Compile the .ahk script to .exe.
- Open regedit, and navigate to `HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon`. don't drop down the winlogon folder, just click on it.
- You should now be able to see *Shell* on the right side. double-click on it, and `explorer.exe` with `C:\pegasus\pegasus-startup.exe`
- This will run our startup script immediately on boot, while disabling explorer, and other things we don't need.
- Reboot.
- While in this "dedicated" egasus mode, you can do ctrl+shift+esc to open task manager. Do file>run, and you can open explorer.exe to do whatever file management tweaks you need to do. You can open regedit as well using the run prompt to revert the shell back to `explorer.exe` if you need to.

---

### Adding a reset button.

After opening a game, the only way for us to close the game and get back to the menu is to do it ourselves, or reboot.<br>
that sucks. Let's make a reset button!

The way I made this happen is with a combination of hardware and software tweaks.<br>
I added a [physical reset button to my cab's coindoor](https://user-images.githubusercontent.com/72628412/178127104-343ae045-aaf1-47c7-aba1-c28c2190d382.jpg), as demonstrated in the video at the top of this readme.<br>
I wired the button up to the coin signal wires, which a J-PAC is able to bind to a keyboard key using WinIPAC v2.<br>
So, I assigned the coin assembly to output the F12 key, which means I essentially have a physical F12 key on my coindoor now.<br>
Using an extremely simple autohotkey + batch solution, we can make this act as a "reset" button that closes whatever game is open, and returns to Pegasus.<br>

- Download [reset-button.ahk](https://github.com/evanclue/ddr-picker/raw/main/scripts/reset-button.ahk) and [killall-reset.bat](https://github.com/evanclue/ddr-picker/raw/main/scripts/killall-reset.bat) and place both of them into your Pegasus folder.

Let's take a look at what these scripts actually do.<br>
`reset-button.ahk` sits in memory forever and waits for the F12 key to be pressed. When it is pressed, it runs killall-reset.bat.<br>
`killall-reset.bat` resets the resolution to 2133x1600 in case a game changed the resolution, then checks if any game programs are open.<br>
If they are, it ends the processes, and restarts Pegasus.

So now, all we have to do is make the reset button script start at boot.
- Compile reset-button.ahk into an .exe using the right-click menu.
- Open pegasus-startup.ahk with a text editor, and add `run reset-button.exe` to it.
- Save the document, and re-compile pegasus-startup.ahk into an .exe.

---

### Additional modifications and contributions.

Hey all, [Dean](https://github.com/dtammam) here - I absolutely loved this project, implemented it on my cab and could not get over how cool it was. I also found that I had additional ideas to make it even better, connected with Clue and submitted some of these as contributions. 
You can see all of my files that I figured could be relevant in the `scripts\dtam-scripts` directory, and I'll explain the general ideas below.

---

### Automating the transition between kiosk mode and admin mode quickly.

I wanted to get fancy and make transitioning from 'kiosk' mode to 'admin mode' smooth and simple with a new set of extra scripts since I found making meaningful changes to files annoying in the limited 'kiosk' mode. If you're interested, checkout the following files in this repo:

- F1ToKioskModeAndReboot.ahk
- F2ToAdminModeAndReboot.ahk
- ShellToGame.bat
- ShellToPC.bat
- ShellToGame.reg
- ShellToPC.reg
- reboot.ps1

These files effectively automate the portion above for replacing `explorer.exe` with `C:\pegasus\pegasus-startup.exe` and vice versa in `HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon` by setting the appropriate key and rebooting the computer with a mapped button via .AHK script (F1 and F2 in this example, but easily modifiable):

- F1ToKioskModeAndReboot.ahk and F2ToAdminModeAndReboot.ahk each run ShellToGame.bat & reboot.ps1 or ShellToPC.bat to reboot.ps1 respectively.
- ShellToGame.bat opens ShellToGame.reg and imports it into the registry, while ShellToPC.bat opens ShellToPC.reg and imports it into the registry.
- reboot.ps1 kicks off an immediate computer reboot and starts it up in the correct 'mode', now that the key is set to what we want.

---

### Managing volume while in kiosk mode.

I realized quickly that running Windows without `explorer.exe` running has a bunch of second and third order consequences. One of the consequences was that the audio on-screen display (OSD) didn't work without Explorer running - I was only able to adjust volume by using the volume knob within the cab and lost access to my beloved media control keys. To deal with this, I researched and found out about [this solution](https://www.reddit.com/r/gpdwin/comments/aroc9v/fix_using_volume_keys_with_a_custom_shell_not_gpd/) which totally worked - all you need to do is follow the instructions in that page, [install the app](https://github.com/sirWest/AudioSwitch/releases) and get it to start with your startup .AHK by adding a new .bat file:

- backendcontrols.bat

When you do this, the startup script goes and launches the .exe for Audio Controls in the background and restores functionality (putting it in a startup folder doesn't work, because, well - `explorer.exe` isn't running) :)

---

### Screenshots to your phone.

This one is more for a private setup versus a more public setup.
I realized that when I got good scores, I'd want to share pics with friends. So I'd whip out my phone, and take pics - but... it would more often than not distract my session because I'd want to open another app and check text. So, I needed to figure out a way to take pics of great scores without needing to use my phone to do it. Hence, my solution:

- Pick your cloud photo service of choice (iCloud, Google Photos, Dropbox, etc.)
- Install it on your cabinet, log it in and set it to auto start
- Pick a button that will be used to initiate a screenshot and then save the photo into the relevant folder in your cloud app

I use iCloud, and will use it for this explanation. You'll need a few files:

- ScreenshotTake.ps1
- PlusToCopyScreen.ahk
- SlashToCopyScreen.ahk
- backendcontrols.bat

It's actually pretty much ready to use. All you need to do is figure out which folder your photos need to land into to get automatically uploaded to the cloud provider of your choice, and update `Line 47` of ScreenshotTake.ps1 to make the correct directory precede the file in the variable:

  $File = "C:\Users\me\Pictures\Uploads\$($FileName).jpg"

Once done... compile the two .ahk files and reference them in your `pegasus-startup.ahk` (feel free to reference my `startall.ahk` for an example), update your `- backendcontrols.bat` to include any relevant .exe's for the cloud provider (again, putting it in a startup folder doesn't work, because, well - `explorer.exe` isn't running), compile your .ahk's into .exe's and you should be all set!

Passing it back to Clue to wrap.

---

### You did it! Hooray!
Now you have a ddr-picker setup for your cab! This took me literally all day to write, and I hope I didn't miss anything.
If you need any further help, feel free to reach out to me on [discord](https://discord.gg/clue).