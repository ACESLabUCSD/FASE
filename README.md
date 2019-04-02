# FASE: FPGA Acceleration of Secure Function Evaluation

This is the implementation of FASE [1], an FPGA accelerator for Secure Function Evaluation (SFE) 
by employing the well-known cryptographic protocol named 
[Yao’s Garbled Circuit (GC)](https://en.wikipedia.org/wiki/Garbled_circuit).
The FPGA acclerator generates the garbled tables for Alice, the garbler.
This is complemented by the [`FASE_HostCPU`](https://github.com/siamumar/FASE_HostCPU) repo
which contains the implementaion of the host CPU.
The host CPU reads the generated garbled tables and executes Yao's protocol with Bob, the evaluator. 
`FASE_HostCPU` also contains the code to generate the netlists of the function to be securely evaluated. 

## Set up
- Set up the host CPU. 
- Set up the Vivado project for `GarbledCircuit` inside the [Vivado](/Vivado) directory.
```
  $ cd XilinxIPs/
  $ tar -xvzf IPs.tar.gz 
  $ cd ../Vivado/GarbledCircuit/
  $ vivado [-mode tcl]
  Vivado% source GarbledCircuit.tcl
```

## Steps to securely evaluate a function through FASE (through Vivado Simulation)
1. Set the number of netlist cycles and the directory of the function's netlist
in [HSCD](https://github.com/siamumar/FASE_HostCPU/tree/before_skipgate/scd) format
in the [Header/TEMP_H.vh](/Header/TEMP_H.vh) file 
(the sample location set by default assumes that this repo and the repo for the host CPU
are located at the same level; update the relative location if needed).
2. Run simulation until it comes to an stop.
This will generate the garbled tables for the given function
inside the directory of the HSCD file set at the previous step.  
```
  $ cd Vivado/GarbledCircuit/
  $ vivado [-mode tcl]
  Vivado% open_project GarbledCircuit.xpr
  Vivado% launch_simulation
  Vivado% run all
```

3. Execute Yao's protocol between Alice and Bob
by following the intructions in `FASE_HostCPU`.

## References
[1] Siam U. Hussain and Farinaz Koushanfar, 
"[FASE: FPGA Acceleration of Secure Function Evaluation](http://aceslab.org/sites/default/files/FASE.pdf)",
<i>Field-Programmable Custom Computing Machines (FCCM)</i>, April, 2019.
