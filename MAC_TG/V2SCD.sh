#!/bin/bash
../../TinyGarbled/bin/scd/V2SCD_Main --log2std -i syn/MAC_TG_16bit.v -o syn/MAC_TG_16bit.scd
../../TinyGarbled/bin/scd/V2SCD_Main --log2std -i syn/MAC_TG_32bit.v -o syn/MAC_TG_32bit.scd
../../TinyGarbled/bin/scd/V2SCD_Main --log2std -i syn/MAC_TG_8bit.v -o  syn/MAC_TG_8bit.scd

rm syn/*.map
