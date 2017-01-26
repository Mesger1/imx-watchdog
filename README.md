# WATCHDOG BREAKDOWN
Two watchdogs :
IMX internal ARM chip watchdog:
http://www.nxp.com/assets/documents/data/en/reference-manuals/IMX6SLRM.pdf
APX external apx chip watchdog, this repo concerns IMX Watchdog only

## IMX WATCHDOG
Devregs (tool for reading and setting registers) :
 * https://github.com/boundarydevices/devregs
 * copy .dat files to /etc/
 * compile src/devregs.cpp with :
 * arm-linux-gnueabihf-g++ -static -march=armv7 devregs.cpp -o devregs

### 0x20bc000 watchdog :
 * write 0x0034 activate with 0.5 sec timout
 * write 0x00ff  activate with 128sec timeout
 * write 0x5555 and subsequently 0xAAAA for reset timer (this is what the wd_keepalive service is for)
 * standard value 0x7f34 (So chipset imx watchdog is running at 64sec interval already as far as i can tell, upon looking at the reset interval status register 0xAAAA is sent after 0x5555)
 * 0x20bc002 interval resetter :
 * 0x1234 is reboot threshold 

### syntax for devregs is :
 * read : devregs 0x20bc000
 * write : devregs 0x20bc000 0x0034
