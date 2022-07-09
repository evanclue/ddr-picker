# ddr-picker
ddr-picker is a [pegasus-fe](https://pegasus-frontend.org/)-based game frontend for Dance Dance Revolution cabinets. it was created to be as fast, pretty, and seamless as possible.

https://user-images.githubusercontent.com/72628412/178119730-f949970a-1269-4377-9f61-493f88cf89aa.mp4

if you are looking for a plug-and-play solution, look elsewhere. this will require a lot of manual reworking for your exact system.
this will NOT WORK on an original CRT without heavy reworking of all the graphics, and scripts.

ddr-picker was specifically optimized for the niche of DDR cabinets that feature a Windows 10 PC plugged into a Dell Ultrasharp U3014 LCD running in 2133 x 1600 resolution (4:3, maxing out the vertical resolution of the monitor) underneath the original display bezel.
the DDR cabinet's control panel is handled using a [J-PAC](https://www.ultimarc.com/control-interfaces/j-pac-en/j-pac-c-control-only-version/), which makes the buttons on the cab function like a keyboard. the lighting is handled using a [LIT board](https://dinsfire.com/projects/lit-board/).

this was a personal project that i originally never intended to share, but i've put enough work into it at this point that i want to save other people the time of building something like this from the ground up.
i'm a [graphic designer](https://clue.graphics), and not a coder -- so ddr-picker is bodged together in the only way i know how: [autohotkey](https://www.autohotkey.com/).

## features:

- custom version of [bemani-mame](https://github.com/987123879113/mame/wiki) that instantly loads 573 mixes at the title screen, with event mode enabled in every mix that supports it
- every game supports the original cab lighting, using a [LIT board](https://dinsfire.com/projects/lit-board/).
- hand-made graphics for every single DDR logo, including many custom square logos that fit better in each "tile"
- custom pegasus theme based on [pegasus-grid-micro](https://github.com/mmatyas/pegasus-theme-grid-micro), optimized for a high-resolution 4:3 display
- reset button to return to the menu after opening a game
- support for DDR Solo, if you have a stage that supports it
