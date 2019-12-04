set projDir "/home/mooselliot/Desktop/Projects/v2/SNAK3D/work/planAhead"
set projName "SNAK3D"
set topName top
set device xc6slx9-2tqg144
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "/home/mooselliot/Desktop/Projects/v2/SNAK3D/work/verilog/mojo_top_0.v" "/home/mooselliot/Desktop/Projects/v2/SNAK3D/work/verilog/alu16_1.v" "/home/mooselliot/Desktop/Projects/v2/SNAK3D/work/verilog/sel4_2.v" "/home/mooselliot/Desktop/Projects/v2/SNAK3D/work/verilog/sel4_2.v" "/home/mooselliot/Desktop/Projects/v2/SNAK3D/work/verilog/controllogic_4.v" "/home/mooselliot/Desktop/Projects/v2/SNAK3D/work/verilog/reset_conditioner_5.v" "/home/mooselliot/Desktop/Projects/v2/SNAK3D/work/verilog/gameengine_6.v" "/home/mooselliot/Desktop/Projects/v2/SNAK3D/work/verilog/controls_7.v" "/home/mooselliot/Desktop/Projects/v2/SNAK3D/work/verilog/snake_8.v" "/home/mooselliot/Desktop/Projects/v2/SNAK3D/work/verilog/score_9.v" "/home/mooselliot/Desktop/Projects/v2/SNAK3D/work/verilog/timer_10.v" "/home/mooselliot/Desktop/Projects/v2/SNAK3D/work/verilog/food_11.v" "/home/mooselliot/Desktop/Projects/v2/SNAK3D/work/verilog/render_12.v" "/home/mooselliot/Desktop/Projects/v2/SNAK3D/work/verilog/sevenseg_13.v" "/home/mooselliot/Desktop/Projects/v2/SNAK3D/work/verilog/sevenseg_13.v" "/home/mooselliot/Desktop/Projects/v2/SNAK3D/work/verilog/adder16_15.v" "/home/mooselliot/Desktop/Projects/v2/SNAK3D/work/verilog/compare16_16.v" "/home/mooselliot/Desktop/Projects/v2/SNAK3D/work/verilog/boolean16_17.v" "/home/mooselliot/Desktop/Projects/v2/SNAK3D/work/verilog/shift16_18.v" "/home/mooselliot/Desktop/Projects/v2/SNAK3D/work/verilog/counter_19.v"]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set ucfSources [list "/home/mooselliot/Desktop/Projects/v2/SNAK3D/constraint/controls.ucf" "/home/mooselliot/Desktop/mojo-ide-B1.3.6/library/components/mojo.ucf"]
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
