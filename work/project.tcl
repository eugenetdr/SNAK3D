set projDir "C:/Users/eugen/Desktop/Comp Struct/Mojo/SNAK3D/work/planAhead"
set projName "SNAK3D"
set topName top
set device xc6slx9-2tqg144
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "C:/Users/eugen/Desktop/Comp Struct/Mojo/SNAK3D/work/verilog/mojo_top_0.v" "C:/Users/eugen/Desktop/Comp Struct/Mojo/SNAK3D/work/verilog/alu16_1.v" "C:/Users/eugen/Desktop/Comp Struct/Mojo/SNAK3D/work/verilog/sel4_2.v" "C:/Users/eugen/Desktop/Comp Struct/Mojo/SNAK3D/work/verilog/sel4_2.v" "C:/Users/eugen/Desktop/Comp Struct/Mojo/SNAK3D/work/verilog/controllogic_4.v" "C:/Users/eugen/Desktop/Comp Struct/Mojo/SNAK3D/work/verilog/reset_conditioner_5.v" "C:/Users/eugen/Desktop/Comp Struct/Mojo/SNAK3D/work/verilog/gameengine_6.v" "C:/Users/eugen/Desktop/Comp Struct/Mojo/SNAK3D/work/verilog/controls_7.v" "C:/Users/eugen/Desktop/Comp Struct/Mojo/SNAK3D/work/verilog/snake_8.v" "C:/Users/eugen/Desktop/Comp Struct/Mojo/SNAK3D/work/verilog/score_9.v" "C:/Users/eugen/Desktop/Comp Struct/Mojo/SNAK3D/work/verilog/timer_10.v" "C:/Users/eugen/Desktop/Comp Struct/Mojo/SNAK3D/work/verilog/food_11.v" "C:/Users/eugen/Desktop/Comp Struct/Mojo/SNAK3D/work/verilog/render_12.v" "C:/Users/eugen/Desktop/Comp Struct/Mojo/SNAK3D/work/verilog/adder16_13.v" "C:/Users/eugen/Desktop/Comp Struct/Mojo/SNAK3D/work/verilog/compare16_14.v" "C:/Users/eugen/Desktop/Comp Struct/Mojo/SNAK3D/work/verilog/boolean16_15.v" "C:/Users/eugen/Desktop/Comp Struct/Mojo/SNAK3D/work/verilog/shift16_16.v" "C:/Users/eugen/Desktop/Comp Struct/Mojo/SNAK3D/work/verilog/counter_17.v"]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set ucfSources [list "C:/Users/eugen/Desktop/Comp\ Struct/Mojo/SNAK3D/constraint/controls.ucf" "C:/Users/eugen/Desktop/Comp\ Struct/Mojo/SNAK3D/constraint/io_shield.ucf" "C:/Program\ Files/Mojo\ IDE/library/components/mojo.ucf"]
import_files -fileset [get_filesets constrs_1] -force -norecurse $ucfSources
set_property -name {steps.bitgen.args.More Options} -value {-g Binary:Yes -g Compress} -objects [get_runs impl_1]
set_property steps.map.args.mt on [get_runs impl_1]
set_property steps.map.args.pr b [get_runs impl_1]
set_property steps.par.args.mt on [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1
wait_on_run synth_1
launch_runs -runs impl_1
wait_on_run impl_1
launch_runs impl_1 -to_step Bitgen
wait_on_run impl_1
