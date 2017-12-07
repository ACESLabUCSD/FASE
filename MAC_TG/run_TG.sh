#!/bin/bash
if [ $1 == "1" ]; then
	echo MAC_TG_$2bit.scd
	../../TinyGarbled/bin/garbled_circuit/TinyGarble -a --log2std -i syn/MAC_TG_$2bit.scd -c $3 -p $4 &
	../../TinyGarbled/bin/garbled_circuit/TinyGarble -b --log2std -i syn/MAC_TG_$2bit.scd -c $3 -p $4 
elif [ $1 == "2" ]; then
	echo MxM_$2_$3.scd
	../../TinyGarbled/bin/garbled_circuit/TinyGarble -a --log2std -i syn/MxM_$2_$3.scd -c $4 -p $5 &
	../../TinyGarbled/bin/garbled_circuit/TinyGarble -b --log2std -i syn/MxM_$2_$3.scd -c $4 -p $5
else 
	echo put 1 to run MAC, 2 to run MxM
fi 