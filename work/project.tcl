set projDir "D:/Gitclones/SNAK3D2/work/planAhead"
set projName "SNAK3D"
set topName top
set device xc6slx9-2tqg144
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "D:/Gitclones/SNAK3D2/work/verilog/mojo_top_0.v" "D:/Gitclones/SNAK3D2/work/verilog/alu16_1.v" "D:/Gitclones/SNAK3D2/work/verilog/sel4_2.v" "D:/Gitclones/SNAK3D2/work/verilog/sel4_2.v" "D:/Gitclones/SNAK3D2/work/verilog/sevenseg_4.v" "D:/Gitclones/SNAK3D2/work/verilog/sevenseg_4.v" "D:/Gitclones/SNAK3D2/work/verilog/controllogic_6.v" "D:/Gitclones/SNAK3D2/work/verilog/reset_conditioner_7.v" "D:/Gitclones/SNAK3D2/work/verilog/gameengine_8.v" "D:/Gitclones/SNAK3D2/work/verilog/controls_9.v" "D:/Gitclones/SNAK3D2/work/verilog/snake_10.v" "D:/Gitclones/SNAK3D2/work/verilog/score_11.v" "D:/Gitclones/SNAK3D2/work/verilog/timer_12.v" "D:/Gitclones/SNAK3D2/work/verilog/food_13.v" "D:/Gitclones/SNAK3D2/work/verilog/render_14.v" "D:/Gitclones/SNAK3D2/work/verilog/adder16_15.v" "D:/Gitclones/SNAK3D2/work/verilog/compare16_16.v" "D:/Gitclones/SNAK3D2/work/verilog/boolean16_17.v" "D:/Gitclones/SNAK3D2/work/verilog/shift16_18.v" "D:/Gitclones/SNAK3D2/work/verilog/counter_19.v"]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set ucfSources [list "D:/Gitclones/SNAK3D2/constraint/controls.ucf" "D:/Gitclones/SNAK3D2/constraint/io_shield.ucf" "C:/Program\ Files/Mojo\ IDE/library/components/mojo.ucf"]
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
