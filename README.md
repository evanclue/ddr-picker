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

- custom version of [bemani-mame](https://github.com/987123879113/mame/wiki) that instantly loads 573 mixes at the title screen, with event mode enabled in every mix that supports it
- every game supports the original cab lighting, using a [LIT board](https://dinsfire.com/projects/lit-board/).
- hand-made graphics for every single DDR logo, including many custom square logos that fit better in each "tile"
- custom pegasus theme based on [pegasus-grid-micro](https://github.com/mmatyas/pegasus-theme-grid-micro), optimized for a high-resolution 4:3 display
- reset button to return to the menu after opening a game
- support for DDR Solo, if you have a stage that supports it

---
---

## installation:

#### first thing you're gonna need to do is get your cab modded with an LCD.
- acquire a 30" 16:10 display, such as the Dell Ultrasharp U3014.
- safely discharge and remove the original CRT, and store it in a safe place, or sell it to someone that will appreciate it more than you do.
- [build a display mount out of wood so that the 16:10 display lines up perfectly with the original bezel.](https://user-images.githubusercontent.com/72628412/178120376-47b18732-93ec-43bb-a496-6dd16dea765b.jpg)
- be sure to remove the plastic front bezel from the LCD. it reduces the distance between the display and the bezel, and makes it look really nice. this can be done easily with a standard spudger to separate the plastic clips.

---

#### next, we gotta get a PC in there.
- get a PC. maybe you have an old rig gathering dust -- you can use that. MAME and simulators aren't very demanding, they'll likely run fine on whatever you already have.
- if you removed the CRT from your DDR cab, you have a ton of room in the back of the monitor box to drop your PC into. that's where i have mine, and it fits very nicely in there.
- create a lightweight Windows 10 install, such as [LTSC](https://docs.microsoft.com/en-us/windows/whats-new/ltsc/), on an SSD with reasonably high capacity. the latest LTSC 2021 is probably fine, but i used LTSC 2019 for no reason in particular.

---

#### now, set up your cab stuff.
- install your [LIT board](https://dinsfire.com/projects/lit-board/) to make your cab lights work, and your [J-PAC](https://www.ultimarc.com/control-interfaces/j-pac-en/j-pac-c-control-only-version/), so your control panel buttons will work.
- i have my control panel set up like this:
![cp-mapping](https://user-images.githubusercontent.com/72628412/178121065-bd7bb1a5-8258-42e7-bedc-ac0ffc1999cd.png)
- i found that this was the best mapping for compatibility with games, and functionality within pegasus-fe's limitations.

---

#### at this point, we can finally get started on setting up pegasus, and getting games running.
- download the latest version of [pegasus-fe](https://pegasus-frontend.org/#downloads).
- place pegasus-fe.exe somewhere like `C:/pegasus/pegasus-fe`. don't run it yet.
- create a blank text document titled `portable.txt` and place it in your `C:/pegasus/pegasus-fe` next to pegasus-fe.exe
- download the [modified micro theme zip](https://github.com/evanclue/ddr-picker/raw/main/micro.zip).
- create a new directory in your pegasus folder just called `themes`, and extract the micro zip in there.
- the full path for the micro theme should be `C:/pegasus/themes/micro/`.
- download [settings.txt](https://github.com/evanclue/ddr-picker/raw/main/settings.txt).
- create a new folder called 'config' in the pegasus directory.
- drop the settings.txt in there. full path should be `C:/pegasus/config/settings.txt`
- 
---
