#!/bin/bash
echo MAC_TG_$1bit.scd
../../TinyGarbled/bin/garbled_circuit/TinyGarble -a --log2std -i syn/MAC_TG_$1bit.scd -p $2 &
../../TinyGarbled/bin/garbled_circuit/TinyGarble -b --log2std -i syn/MAC_TG_$1bit.scd -p $2 
