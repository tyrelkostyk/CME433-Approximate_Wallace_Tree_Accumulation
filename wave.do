onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /testbench/clk
add wave -noupdate -radix binary /testbench/A
add wave -noupdate -radix binary /testbench/B
add wave -noupdate -radix binary /testbench/S_tree_Fapprox
add wave -noupdate -radix binary /testbench/S_tree_Papprox
add wave -noupdate -radix binary /testbench/S_tree_Exact
add wave -noupdate -radix binary /testbench/S_array
add wave -noupdate -divider {Layer Connections}
add wave -noupdate -radix binary /testbench/L_12
add wave -noupdate -radix binary /testbench/L_23
add wave -noupdate -radix binary /testbench/L_34
add wave -noupdate -radix binary /testbench/L_45
add wave -noupdate -radix binary /testbench/L_56
add wave -noupdate -radix binary /testbench/L_67
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {127 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 135
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits us
update
WaveRestoreZoom {124 ns} {132 ns}
