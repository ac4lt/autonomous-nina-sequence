# autonomous-nina-sequence
This project is for an autonomous NINA sequence that can run 24/7 without user direct user intervention.

The main audience for this sequence is those who are running a permanent setup in an observatory. Those who set up and tear down every night or for every stretch of clear weather may find parts of this that can be adapted to that setup but the primary audience is those who are permanently set up.

Although intended for permanent setups in an observatory, the sequence currently runs in two commercial observatories where the sequence does not control the roof so the sequence doesn't currently do that. However, it should not be difficult to modify it to support ASCOM DOME operation.

## Software Prerequisites

- NINA 3

Use beta 3 or higher. 
 
 ## NINA Plugin Minimum Version Requirements
- Target Scheduler (4.2.0.0)
- Scheduler Powerups (3.11.1.0)
- Connector plugin (2.0.2.1)
- Discord Alerts (2.2.0.0) [^1]
- Smart Meridian Flip (2.0.0.0) [^2]
- Astro-Physics Tools (2.0.0.0) [^3]

[^1]: You could replace the instructions that send notifications to Discord with another alerting plugin (like **Ground Station**) or remove those instructions if notifications are not needed.
[^2]: If you don't plan to take advantage of the **Smert Meridian Flip** plugin then you can replace the **Smart Meridian Flip** trigger with the standard NINA **Meridian Flip** trigger. Or create a configuration file for Smart Meridian Flip that flips at a fixed time (e.g. 10 minutes past the meridian) for each declination.
[^3]: The sequence only uses the plugin to start he APCC program.

The first three plugins are initegral to the structure of the sequence. The others are particular to the way the teams using the sequence are using NINA. While the instuctions from Smart Mridian Flip and Astro-Physics Tools are confined to specific spots and not numerous, the Discord Alerts instructions are used throughout the sequence. While it is definitely possible to remove them or replace them with instructions from another notification plugin, it would be fairly tedious to do.

You can run this sequence with only the first three plugins installed and NINA will skip over the instructions that it doesn't have the plugin for. However, if you plan to contribute changes back to this repository you must have alll required plugins installed for your changes to merge in properly.

 ## Equipment Requirements (from NINA's equipment tab)

 - Camera (what's the point of astro-imaging withoout one!)
 - Filter Wheel (if using a mono camera)
 - Telescope
 - Focuser
 - Flat Panel
 - Weather
 - Safety Monitor

All other equipment is optional. The Weather and Safety monitor are integral to the operation of the sequence. If NINA doesn't have access to weather and safety data then much of the logic of the sequence will not be able to operate. Similarly, if a flat panel does not exist then the sequence will not be able to get flats automatically. While NINA 3 does support sky flats, this sequence does not currently use them.

To use the automatic dark collection features you either need a camera with a physical shutter or a controllabllable cover for the front of the telescope (like a Flip-Flat). It meeds to make a light tight seal to be usable for darks.

## Equipment Requirements If Power Management Is Needed

If you want the sequence to be able to turn equipment power on or off then you either need an ASCOM switch driver or an external script that can turn the switches on or off.

## Installation

Make sure NINA and all the required plugins are installed and configured.

NINA stores its sequences in JSON format. The sequence is made up of a collection of JSON files that are in the "sequence" subdirectory when you unzipped the release. Copy the contents of that sequence directory into your NINA sequence directory (by default it is the "N.I.N.A" directory in the Documents directory.

## Wiki

For information on how to configure and customize the sequence, please see the [Wiki](https://github.com/ac4lt/autonomous-nina-sequence/wiki).
