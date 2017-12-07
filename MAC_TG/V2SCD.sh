#!/bin/bash
for v in syn/*.v; do
	echo "${v%.*}"
	../../TinyGarbled/bin/scd/V2SCD_Main --log2std -i "$v" -o "${v%.*}".scd
done
rm syn/*.map
