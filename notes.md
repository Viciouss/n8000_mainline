# general

* all code references are related to the old LOS kernel for cm-14.1
    * https://github.com/LineageOS/android_kernel_samsung_smdk4412/tree/cm-14.1


# HW Revisions

* code references multiple versions of the tablet with changing hardware
* officially checked in code are 5, 6 and 7 to 9 but there could be others
* version <= 5
    * is this the N801x?
* version 6
    * confirmed N8000 on own hardware
* version 7
    * reserved (see los kernel p4-input.c line 122)
* version 8
    * same as 0.7
* version 9
    * LTE model such as N8020 (does this also include the N8015?)


# battery, charging, etc.

* almost all of this is hand crafted and there is a lot of code to be ported over to mainline
* adc
    * stmpe811-adc.c
    * already supported but a first test always gave the same results for the readings
* headphone jack
    * sec_jack.c
    * device detection via adc channel 4
* charger
    * smb347_charger.c
* battery
    * sec_battery_px.c
    * battery charge? via adc channel 6
* fuel gauge
    * max17042_fuelgauge_px.c
    * this looks like 2000 lines of a real mess :-(
* connector
    * 30pin_con.c
    * cable type via adc channel 7
* max77686 = pmic + rtc
    * should be mainly supported


# network

* Broadcom BCM4334 wireless
    * has multiple versions
        * nvram_net.txt_murata -> socitype:0x1 chip:0x4334 rev:0x3 pkg:0x0
        * nvram_net.txt -> ?
        * nvram_net.txt_murata_b2 -> ?
        * nvram_net.txt_semcosh -> ?
    * somtimes rev 0x2 can be 0x1 (see dhd_sdio.c @ line 8711)
    * there seems to be no connection between system_rev and chip revision


# display

* the display is from samsung and doesn't seem to need any driver aside from the gpio-backlight one
* mdnie code is missing, this will probably cause issues with display adjustments like brightness
    and color adjustments


# touchscreen

* Atmel touchpad
    * will be changed depending on the system_rev (switch_config @ line 512)
    * cfg files are in usr/lib/firmware, the one that fits needs to be renamed to maxtouch.cfg

* Synaptics touchpad
    * for system_rev <0x5 
    * what is this, certain hw versions or countries?
    * more info needed