fetacky-midi is a very crude Nintendo Wii Remote Drums drum machine create as a simple hack to be used with the new kernel 4.19 support of this particular hardware.

Needed steps:

  * Follow the guide at https://wiki.archlinux.org/index.php/XWiimote (install hid-wiimote kernel module, connect your wiimote/drums, check the working with xwiishow tool)
  * run ./make.sh to build volume adjusted samples
  * run ./drum.sh
  * ...
  * Profit! https://youtu.be/LrG0KQlirk0

Final notes:
  
  * Yes, I know that this is completely unusable for producing tight music... this is hence reflected in the name of this project "Fetacky MIDI" which are czech words meaning "Junkie's MIDI".
