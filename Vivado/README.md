## TCL files for creating Vivado projects

# To create a project
```
cd <MAXelerator>/Vivado/<proj_dir>
source <proj_name.tcl>
```

# To update a project
```
cd [get_property DIRECTORY [current_project]]
write_project_tcl -force -target_proj_dir . <proj_name.tcl>
```

