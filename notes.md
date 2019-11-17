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

# adc

* detects the following
    * item connected at 30 pin connector
    * battery charge
    * microphone jack item
* stmpe811-adc.c
* already mainlined but a first test always gave the same results for the readings

# battery, charging, fuel gauge

* one of the bigger problems, the glue code is quite complex
* maybe we can port this from the newer version of the note?
    * [Samsung sec_battery driver](https://github.com/LineageOS/android_kernel_samsung_lt03lte/blob/cm-14.1/drivers/battery/sec_battery.c)
* charger
    * smb347_charger.c
    * supported in mainline but no device tree binding yet
* battery
    * sec_battery_px.c
    * battery charge? via adc channel 6
    * this code looks like the glue code for charger, battery and fuel gauge
* fuel gauge
    * max17042_fuelgauge_px.c
    * can be replaced with max17042_battery from mainline
* max77686 = pmic + rtc
    * should be mainly supported


# network

* works out of the box, only the nvram file will be a small problem
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
    * works out of the box
    * will be changed depending on the system_rev (p4-input @ line 512)
    * cfg files are in usr/lib/firmware, the one that fits needs to be renamed to maxtouch.cfg

* Synaptics touchpad
    * for system_rev <0x5 
    * what is this, certain hw versions or countries?
    * more info needed


# connectors

* 30 pin usb connector
    * completely missing and quite a huge task but can be split into parts
    * old: 30pin_con.c
    * cable type via adc channel 7
    * at least one of the accessories is chainable (keyboard -> usb connection)
        * power goes in both directions
    * known accessories
        * MHL adapter (does this exist? it's supported in the code)
        * USB to pc
        * USB to charger (I think this only matters in terms of transferred current)
        * keyboard
            * there seems to be an overcurrent issue (mach-p4notepq.c @ line 1403)
        * OTG adapter
* headphone jack
    * sec_jack.c
    * device detection via adc channel 4

