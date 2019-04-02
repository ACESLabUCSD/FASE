## TCL files for creating Vivado projects

### To create a project
``` 
  $ vivado [-mode tcl]
  Vivado% cd <proj_dir>
  Vivado% source <proj_name>.tcl
```

### To update a project
```
  Vivado% cd [get_property DIRECTORY [current_project]]
  Vivado% write_project_tcl -force -target_proj_dir . <proj_name>.tcl
```

