# FASE: FPGA Acceleration of Secure Function Evaluation

This is the implementation of FASE [1], an FPGA accelerator for Secure Function Evaluation (SFE) 
by employing the well-known cryptographic protocol named 
[Yao’s Garbled Circuit (GC)](https://en.wikipedia.org/wiki/Garbled_circuit). 

To run FASE, first set up the 
[host CPU](https://github.com/siamumar/FASE_HostCPU) for Alice, the garbler.
This repo also contains the code for Bob, the evaluator. 
Moreover, it contains the code to generate the netlists of the function to be securely evaluated. 

FASE uses the Vivado Design Suite from Xilinx.
Set up the Vivado project for `GarbledCircuit` by following the instructions
inside the [Vivado](/Vivado) directory.
To garble a certain function, set the location of its netlist
in [HSCD](https://github.com/siamumar/FASE_HostCPU/tree/before_skipgate/scd)
format and the number of netlist cycles in the [Header/TEMP_H.vh](/Header/TEMP_H.vh) file 
(the sample location set by default assumes this repo and the repo for the host CPU
are located at the same level; update the relative location if needed).
Then run simulation until it comes to an stop.
This will generate the garbled tables for the given function. 
To complete the garbling and evaluation operations,
run the run the code for Alice and Bob by following the intructions in the repo for host CPU.

## References
[1] Siam U. Hussain and Farinaz Koushanfar, 
"[FASE: FPGA Acceleration of Secure Function Evaluation](http://aceslab.org/sites/default/files/FASE.pdf)",
<i>Field-Programmable Custom Computing Machines (FCCM)</i>, April, 2019.
