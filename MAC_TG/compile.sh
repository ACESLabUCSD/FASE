#!/bin/bash
mkdir -p syn
if [ $1 == "1" ]; then
	design_vision -no_gui -f mac.dcsh
fi
if [ $1 == "2" ]; then
	design_vision -no_gui -f mxm.dcsh
fi 

rm *.pvl *.syn *.mr *.log *.svf