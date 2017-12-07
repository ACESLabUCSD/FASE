MAC without privacy
=======
## Run through TinyGarble for privacy

To compile the Verilog files 
```
  $ ./compile.sh <1 for MAC, 2 for MxM>
```

To generate the TinyGarble netlists
```
  $ ./V2SCD.sh
```

To run through TinyGarble
```
  $ ./run_TG.sh <bit-width> <port_number>
```
Example
```
  $ ./run_TG.sh 32 1123
```
