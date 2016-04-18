Byzanz
======

Byzanz was once intended to be used as a GNOME 2 applet. Nowadays this feature is disabled because the way how applets work in GNOME 3 has changed fundamentally. However it is also possible to use byzanz as a command line tool - its real strength. It still has the same functionality but you won't see an icon in your systray or a program starting.

**EXAMPLES**

 - record the whole screen and save the output as an animated GIF
  
  **$> byzanz mydesktop.gif**

 - record the whole screen and audio input and save the output as OGG Theora

  **$> byzanz -a mydesktop.ogv**

 - record only the top right quarter of your screen with 1680x1050 resolution for 30 seconds, include the mouse cursor and audio and save the output as OGG Theora
 
 **$> byzanz -a -c -d 30 -x 840 -y 0 -w 840 -h 525 mydesktop.ogv**
