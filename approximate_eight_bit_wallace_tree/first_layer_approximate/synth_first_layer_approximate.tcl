# specify top-level design
set DESIGN_NAME "papprox_eight_bit_wallace_tree"

# list of source files
set RTL_SOURCE_FILES "./SRC/papprox_eight_bit_wallace_tree.v \
./SRC/approx_eight_bit_wallace_tree_reduc_layer_1.v \
./SRC/eight_bit_wallace_tree_reduc_layer_2.v \
./SRC/eight_bit_wallace_tree_reduc_layer_3.v \
./SRC/eight_bit_wallace_tree_reduc_layer_4.v \
./SRC/eight_bit_wallace_tree_reduc_layer_5.v \
./SRC/eight_bit_wallace_tree_reduc_layer_6.v \
./SRC/eight_bit_wallace_tree_reduc_layer_7.v \
./SRC/one_bit_half_adder.v \
./SRC/one_bit_full_adder.v \
./SRC/approximate_full_adder.v"

# set directories for output files
set LOG "log"
file mkdir ${LOG}

# read in the RTL design
define_design_lib WORK -path ./work
analyze -format verilog ${RTL_SOURCE_FILES}
elaborate ${DESIGN_NAME}

# resolve references by linking design to logical libraries
link

# use multiple cores
set_host_options -max_cores 8

# preserve all hierarchy
set NO_UNGROUP true

# minimize area
set_max_area 0

# power optimization
set_dynamic_optimization true
set_leakage_optimization true

# prevent assignment statement in verilog netlist
set_fix_multiple_port_nets -all -buffer_constants

# write out all unconnected pins in verilog netlist
set verilogout_show_unconnected_pins true

# compile
compile
# optimize_netlist -area
