#!/bin/bash
mkdir -p syn
if [ $1 == "1" ]; then
	design_vision -no_gui -f mac.dcsh
	rm *.pvl *.syn *.mr *.log *.svf
elif [ $1 == "2" ]; then
	design_vision -no_gui -f mxm.dcsh
	rm *.pvl *.syn *.mr *.log *.svf
else 
	echo put 1 to compile MAC, 2 to conpile MxM
fi 

