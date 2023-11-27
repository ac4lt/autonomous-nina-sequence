# autonomous-nina-sequence
This project is for an autonomous NINA sequence that can run 24/7 without user direct user intervention.

The main audience for this sequence is those who are running a permanent setup in an observatory. Those who set up and tear down every night or for every stretch of clear weather may find parts of this that can be adapted to that setup but the primary audience is those who are permanently set up.

Although intended for permanent setups in an observatory, the sequence currently runs in two commercial observatories where the sequence does not control the roof so the sequence doesn't currently do that. However, it should not be difficult to modify it to support ASCOM DOME operation.

## Software Prerequisites

- NINA 3

 While NINA 3 is in early release as of November 2023, it has proved quite stable for me. However, as of this pont in time, it should be considered beta software at best. *Be aware that it is a rapidly mvoing project and that problems likely will occur*.
 
 ## NINA Plugin Requirements
- Target Scheduler
- Scheduler Powerups
- Connector plugin
- Discord Alerts[^1]
- Smart Meridian Flip[^2]
- Astro-Physics Tools[^3]

[^1]: You could replace the instructions that send notifications to Discord with another alerting plugin (like **Ground Station**) or remove those instructions if notifications are not needed.
[^2]: If you don't plan to take advantage of the **Smert Meridian Flip** plugin then you can replace the **Smart Meridian Flip** trigger with the standard NINA **Meridian Flip** trigger. Or create a configuration file for Smart Meridian Flip that flips at a fixed time (e.g. 10 minutes past the meridian) for each declination.
[^3]: The sequence only uses the plugin to start he APCC program.

The first three plugins are initegral to the structure of the sequence. The others are particular to the way the teams using the sequence are using NINA. While the instuctions from Smart Mridian Flip and Astro-Physics Tools are confined to specific spots and not numerous, the Discord Alerts instructions are used throughout the sequence. While it is definitely possible to remove them or replace them with instructions from another notification plugin, it would be fairly tedious to do.

 ## Equipment Requirements (from NINA's equipment tab)

 - Camera (what's the point of astro-imaging withoout one!)
 - Filter Wheel (if using a mono camera)
 - Telescope
 - Focuser
 - Flat Panel
 - Weather
 - Safety Monitor

All other equipment is optional. The Weather and Safety monitor are integral to the operation of the sequence. If NINA doesn't have access to weather and safety data then much of the logic of the sequence will not be able to operate. Similarly, if a flat panel does not exist then the sequence will not be able to get flats automatically. While NINA 3 does support sky flats, this sequence does not currently use them.

## Equipment Requirements If Power Management Is Needed

If you want the sequence to be able to turn equipment power on or off then you either need an ASCOM switch driver or an external script that can turn the switches on or off.

## Equipment That Probably Won't (Yet) Work Well With This Sequence

**Rotators can be problematic** with this sequence as it currently stand in November 2023 unless your flats can work regardless of rotator position. If you can use a flat from rotator angle "a" with a light froame taken at some different angle "b" and get a good calibration then it will be fine but if not then this sequence is not currently a good choice for you. Eventually, the Target Scheduler author is planning to add flat support that will handle rotation but until that happens this sequence works best at a fixed rotation angle.

## Installation

Make sure NINA and all the required plugins are installed and configured.

NINA stores its sequences in JSON format. The sequence is made up of a collection of JSON files that are in the "sequence" subdirectory when you unzipped the release. Copy the contents of that sequence directory into your NINA sequence directory (by default it is the "N.I.N.A" directory in the Documents directory.

## Wiki

For information on how to configure and customize the sequence, please see the [Wiki](https://github.com/ac4lt/autonomous-nina-sequence/wiki).
