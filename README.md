# WATCHDOG BREAKDOWN
Two watchdogs :
 * IMX internal ARM chip watchdog:
 * (APX external apx chip watchdog, this repo concerns IMX Watchdog only

## IMX WATCHDOG
http://www.nxp.com/assets/documents/data/en/reference-manuals/IMX6SLRM.pdf 
### Devregs (tool for reading and setting registers) :
 * https://github.com/boundarydevices/devregs
 * copy .dat files to /etc/
 * compile src/devregs.cpp with :
    * arm-linux-gnueabihf-g++ -static -march=armv7 devregs.cpp -o devregs

### 0x20bc000 watchdog :
 * write 0x0034 activate with 0.5 sec timout
 * write 0xff34  activate with 128sec timeout
 * example : devregs 0x20BC000 0xFF34

### 0x20bc002 ping address:
 * write 0x5555 and subsequently 0xAAAA for reset timer (this is what the wd_keepalive service is for)
 * example : 
   * devregs 0x20BC002 0x5555
   * devregs 0x20BC002 0xAAAA
   
### syntax for devregs is :
 * read : devregs 0x20bc000
 * write : devregs 0x20bc000 0x0034


### this repo installs :
   * 'imx-watchdog' service at a 10second interval which starts up as the first service. For enabling watchdog sooner (at bootloader ) check this repository : https://github.com/gerdmestdagh/u-boot-watchdog-enabled
   * 'imx-keepalive' service which pings the watchdog every 5 seconds
   *  Install with:
      * sudo apt-get update
      * wget -q -O - http://bit.ly/2k9RKzu | bash
