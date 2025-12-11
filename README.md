# autonomous-nina-sequence
This project is for an autonomous NINA sequence that can run 24/7 without user direct user intervention.

The main audience for this sequence is those who are running a permanent setup in an observatory. Those who set up and tear down every night or for every stretch of clear weather may find parts of this that can be adapted to that setup but the primary audience is those who are permanently set up.

Although intended for permanent setups in an observatory, the sequence currently runs in two commercial observatories where the sequence does not control the roof so the sequence doesn't currently do that. However, it should not be difficult to modify it to support ASCOM DOME operation.

## Structural Change at revision 0.48.0

This release changes the way dark and bias frames are configured. The scalar variables that defined whether to get bin1 and bin2 broadband darks and biases and bin1 narrowband darks and biases have been removed. In their place are four arrays: dark_length_array, dark_gain_array, dark_offset_array and dark_binning_array. For each dark or bias type desired add an index to each array defining the parameters for that calibration frame. The screenshow below shows a sample configuration for doing 300s bin1 gain 0 darks, 600s, bin1 gain 100 darks and biases for both gain 0 and gain 100 at bin1:

<img width="992" height="766" alt="Screenshot 2025-09-17 at 10 36 05 AM" src="https://github.com/user-attachments/assets/9e798d3e-9aa9-4f7e-b61b-00cdfb63d35c" />

This has the advantage of allowing you to define multipel dark lengths at a given gain and binning all from within the sequence instead of the three pre-defined options in the old method. To define bias frames use a length of 0. The sequence will detect this and tell nina it is a bias frame so it will get the appropriate metadata.

## Structural Change at revision 0.33.0.0

Beginning with this release, the sequence has been restructured. Instead of there being IF instructions sprinkled throughout to handle differences for different observatories there are a series of templates with names starting with "custom". These are intended to be supplied by each user for their own configuration. With the exception of the "custom warm camera" template the supplied custom templates are empty and do nothing. You can customize them for your own needs. You can refer to the supplied custom observatory implementations that are in the release zip file for examples.

This has some advantages. It no longer requires users to install plugins they don't need like Astro-Physics Tools or 10 Micron Tools. It also makes the sequence smaller and (a little) easier to understand. It also provides clearly marked spots for customization where the user can do what is needed wtihout worrying about how to pick up changes in the sequence going forward.

## Software Prerequisites

- NINA 3.2
 
 ## NINA Plugin Minimum Version Requirements
- Target Scheduler (5.8.2.0)
- Sequencer Powerups (3.28.4.4)
- Livestack plugin (1.0.1.7)
- Ground Station (3.0.0.117) [^1]

[^1]: You could replace the instructions that send notifications to Discord with a different notification mechanism or remove if not needed.
The first three plugins are initegral to the structure of the sequence. 

The Livestack plugin is optional. The sequence will try to enable livestacking by default but you can disable that by setting the live_stack variable to 0.

The others are particular to the way the teams using the sequence are using NINA. While the instuctions from Smart Mridian Flip and Astro-Physics Tools are confined to specific spots and not numerous, the Discord Alerts instructions are used throughout the sequence. While it is definitely possible to remove them or replace them with instructions from another notification plugin, it would be fairly tedious to do.

You can run this sequence with only the first three plugins installed and NINA will skip over the instructions that it doesn't have the plugin for. However, if you plan to contribute changes back to this repository you must have alll required plugins installed for your changes to merge in properly.

 ## Equipment Requirements (from NINA's equipment tab)

 - Camera (what's the point of astro-imaging without one!)
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

### Scripts

The sequence expects to find three scripts in C:\AutonomousScripts. These must exist though they do not need to do anything. The three scripts are:
- startup.bat - this gets called before connecting to any equipment and can be used to turn on power in a non-ASCOM way
- shutdown.bat - this gets called after disconnecting from the equipment and can be used to turn off power in a non-ASCOM way.

## Wiki

For information on how to configure and customize the sequence, please see the [Wiki](https://github.com/ac4lt/autonomous-nina-sequence/wiki).
