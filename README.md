# autonomous-nina-sequence
This project is for an autonomous NINA sequence that can run 24/7 without user direct user intervention.

The main audience for this sequence is those who are running a permanent setup in an observatory. Those who set up and tear down every night or for every stretch of clear weather may find parts of this that can be adapted to that setup but the primary audience is those who are permanently set up.

Although intended for permanent setups in an observatory, the sequence currently runs in two commercial observatories where the sequence does not control the roof so the sequence doesn't currently do that. However, it should not be difficult to modify it to support ASCOM DOME operation.

## Software Prerequisites

- NINA 3
- Target Scheduler plugin
- Scheduler Powerups plugin
- Discord Alerts plugin
- Connector plugin
- Smart Meridian Flip plugin

 While NINA 3 is in early release as of November 2023, it has proved quite stable for me. However, as of this pont in time, it should be considered beta software at best. *Be aware that it is a rapidly mvoing project and that problems likely will occur*.

 Two of the required plugins (**Dsicord Alert** and **Smaert Meridian Flip**) are not stricly required. You could replace the instructions that send notifications to Discord with another alerting plugin (like **Ground Station**) or remove those instructions if notifications are not needed. Similarly if you don't plan to take advantage of the **Smert Meridian Flip** plugin then you can replace the **Smart Meridian Flip** trigger with the standard NINA **Meridian Flip** trigger.

 ## Equipment Prerequisites (from NINA's equipment tab)

 - Camera (what's the point of astro-imaging withoout one!)
 - Filter Wheel (if using a mono camera)
 - Telescope
 - Focuser
 - Flat Panel
 - Weather
 - Safety Monitor

All other equipment is optional. The Weather and Safety monitor are integral to the operation of the sequence. If NINA doesn't have access to weather and safety data then much of the logic of the sequence will not be able to operate. Similarly, if a flat panel does not exist then the sequence will not be able to get flats automatically. While NINA 3 does support sky flats, this sequence does not currently use them.

**Rotators can be problematic** with this sequence as it currently stand in November 2023 unless your flats can work regardless of rotator position. If you can use a flat from rotator angle "a" with a light froame taken at some different angle "b" and get a good calibration then it will be fine but if not then this sequence is not currently a good choice for you. Eventually, the Target Scheduler author is planning to add flat support that will handle rotation but until that happens this sequence works best at a fixed rotation angle.

 ## Optional

For those using Astro-Physics mounts with the APCC program, the **Astro-Physics Tools** plugin can be used. For those with 10Micron mounts, the **10 Micron Tools** plug-in can be used.

## Installation

Make sure NINA and all the required plugins are installed and configured.

The sequence is made up of a collection of JSON files. NINA stores its sequences in JSON format. The top level sequence file autonomous.json should be placed in the NINA directory in your Documents directory and the files in the Templates directory shoudl be added to the Templates directory that is in the same location. Then in the NINA advanced sequencer load autonomous.zip and you should be ready to go.

## Basic Configuration

to be written...
