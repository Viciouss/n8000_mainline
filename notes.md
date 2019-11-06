# HW Revisions

* code references multiple versions of the tablet with changing hardware
* officially checked in code are 5, 6 and 7 to 9 but there could be others
* version <= 5
    * is this the N8000?
* version 6
    * confirmed N8010 on own hardware
    * for some reason the comment mentions 3G but that should be version 5?
    * what about N8013?
* version 7
    * reserved (see los kernel p4-input.c line 122)
* version 8
    * same as 0.7
* version 9
    * LTE model such as N8020 (does this also include the N8015?



# battery, charging, etc.

* adc = stmpe811-adc.c
* headphone jack = sec_jack.c (detection = adc channel 4)
* charger = smb347_charger.c
* battery = sec_battery_px.c (battery charge? = adc channel 6)
* fuel gauge = max17042_fuelgauge_px.c
* connector = 30pin_con.c (cable type = adc channel 7)
* max77686 = pmic + rtc
