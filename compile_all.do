onbreak {resume}
if [file exists work] { vdel -all }
vlib work
vmap work work

vlog approximate_eight_bit_wallace_tree/first_layer_approximate/*.v
vlog approximate_eight_bit_wallace_tree/fully_approximate/*.v
vlog approximate_eight_bit_wallace_tree/one_adder_approximate/*.v
vlog array_multiplier/*.v
vlog eight_bit_wallace_tree/*.v
vlog testbench/*.sv

vopt +acc testbench -o testbench_opt
vsim testbench_opt

add log -r /*
run -all
if [file exists wave.do] { do wave.do }
