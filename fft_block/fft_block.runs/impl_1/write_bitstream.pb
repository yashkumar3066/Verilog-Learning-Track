
o
Command: %s
1870*	planAhead2:
&open_checkpoint top_wrapper_routed.dcp2default:defaultZ12-2866h px� 
^

Starting %s Task
103*constraints2#
open_checkpoint2default:defaultZ18-103h px� 
�

%s
*constraints2r
^Time (s): cpu = 00:00:00 ; elapsed = 00:00:00.063 . Memory (MB): peak = 306.223 ; gain = 7.3442default:defaulth px� 
W
Loading part %s157*device2$
xc7z007sclg400-12default:defaultZ21-403h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.2172default:default2
897.5552default:default2
0.0002default:defaultZ17-268h px� 
g
-Analyzing %s Unisim elements for replacement
17*netlist2
2732default:defaultZ29-17h px� 
j
2Unisim Transformation completed in %s CPU seconds
28*netlist2
02default:defaultZ29-28h px� 
x
Netlist was created with %s %s291*project2
Vivado2default:default2
2023.12default:defaultZ1-479h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
?
Reading XDEF placement.
206*designutilsZ20-206h px� 
D
Reading placer database...
1602*designutilsZ20-1892h px� 
=
Reading XDEF routing.
207*designutilsZ20-207h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2%
Read XDEF Files: 2default:default2
00:00:012default:default2
00:00:012default:default2
1041.5592default:default2
24.8442default:defaultZ17-268h px� 
�
7Restored from archive | CPU: %s secs | Memory: %s MB |
1612*designutils2
1.0000002default:default2
0.0000002default:defaultZ20-1924h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common20
Finished XDEF File Restore: 2default:default2
00:00:012default:default2
00:00:012default:default2
1041.5592default:default2
24.8442default:defaultZ17-268h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0062default:default2
1429.9342default:default2
0.0002default:defaultZ17-268h px� 
�
!Unisim Transformation Summary:
%s111*project2s
_  A total of 74 instances were transformed.
  RAM64X1D => RAM64X1D (RAMD64E(x2)): 74 instances
2default:defaultZ1-111h px� 
�
'Checkpoint was created with %s build %s378*project2+
Vivado v2023.1 (64-bit)2default:default2
38658092default:defaultZ1-604h px� 
�
�Critical violations of the methodology design rules detected. Critical violations may contribute to timing failures or cause functional issues in hardware. Run report_methodology for more information.10702*	planAheadZ12-23575h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2%
open_checkpoint: 2default:default2
00:00:192default:default2
00:00:202default:default2
1429.9342default:default2
1137.7422default:defaultZ17-268h px� 
k
Command: %s
53*	vivadotcl2:
&write_bitstream -force top_wrapper.bit2default:defaultZ4-113h px� 
�
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2"
Implementation2default:default2
xc7z007s2default:defaultZ17-347h px� 
�
0Got license for feature '%s' and/or device '%s'
310*common2"
Implementation2default:default2
xc7z007s2default:defaultZ17-349h px� 
x
,Running DRC as a precondition to command %s
1349*	planAhead2#
write_bitstream2default:defaultZ12-1349h px� 
>
Refreshing IP repositories
234*coregenZ19-234h px� 
G
"No user IP repositories specified
1154*coregenZ19-1704h px� 
|
"Loaded Vivado IP repository '%s'.
1332*coregen23
C:/Xilinx/Vivado/2023.1/data/ip2default:defaultZ19-2313h px� 
P
Running DRC with %s threads
24*drc2
22default:defaultZ23-27h px� 
�
�Unspecified I/O Standard: 74 out of 74 logical ports use I/O standard (IOSTANDARD) value 'DEFAULT', instead of a user assigned specific value. This may cause I/O contention or incompatibility with the board power or connectivity affecting performance, signal integrity or in extreme cases cause damage to the device or the components to which it is connected. To correct this violation, specify all I/O standards. This design will fail to generate a bitstream unless all logical ports have a user specified I/O standard value defined. To allow bitstream creation with unspecified I/O standard values (not recommended), use this command: set_property SEVERITY {Warning} [get_drc_checks NSTD-1].  NOTE: When using the Vivado Runs infrastructure (e.g. launch_runs Tcl command), add this command to a .tcl file and add that file as a pre-hook for write_bitstream step for the implementation run. Problem ports: %s.%s*DRC2�
 "(
in_readyin_ready2default:default"0
config_readyconfig_ready2default:default"4
config_data[0]config_data[0]2default:default"0
config_validconfig_valid2default:default",
in_data[31:0]in_data2default:default"(
in_validin_valid2default:default"&
aresetnaresetn2default:default".
out_data[31:0]out_data2default:default"(
out_lastout_last2default:default"*
	out_ready	out_ready2default:default"*
	out_valid	out_valid2default:default" 
aclkaclk2default:default2default:default2(
 DRC|Pin Planning2default:default8ZNSTD-1h px� 
�
�Unconstrained Logical Port: 74 out of 74 logical ports have no user assigned specific location constraint (LOC). This may cause I/O contention or incompatibility with the board power or connectivity affecting performance, signal integrity or in extreme cases cause damage to the device or the components to which it is connected. To correct this violation, specify all pin locations. This design will fail to generate a bitstream unless all logical ports have a user specified site LOC constraint defined.  To allow bitstream creation with unspecified pin locations (not recommended), use this command: set_property SEVERITY {Warning} [get_drc_checks UCIO-1].  NOTE: When using the Vivado Runs infrastructure (e.g. launch_runs Tcl command), add this command to a .tcl file and add that file as a pre-hook for write_bitstream step for the implementation run.  Problem ports: %s.%s*DRC2�
 "(
in_readyin_ready2default:default"0
config_readyconfig_ready2default:default"4
config_data[0]config_data[0]2default:default"0
config_validconfig_valid2default:default",
in_data[31:0]in_data2default:default"(
in_validin_valid2default:default"&
aresetnaresetn2default:default".
out_data[31:0]out_data2default:default"(
out_lastout_last2default:default"*
	out_ready	out_ready2default:default"*
	out_valid	out_valid2default:default" 
aclkaclk2default:default2default:default2(
 DRC|Pin Planning2default:default8ZUCIO-1h px� 
�
uPS7 block required: The PS7 cell must be used in this Zynq design in order to enable correct default configuration.%s*DRC2;
 #DRC|PS7|Zynq requires PS7 block|PS72default:default8ZZPS7-1h px� 
�
�enum_USE_DPORT_FALSE_enum_DREG_ADREG_0_connects_CED_CEAD_RSTD_GND: %s: DSP48E1 is not using the D port (USE_DPORT = FALSE). For improved power characteristics, set DREG and ADREG to '1', tie CED, CEAD, and RSTD to logic '0'.%s*DRC2�
 "�
�FFT/U0/i_synth/xfft_inst/floating_point.xfft_inst/fft/non_floating_point.arch_d.xfft_inst/pe_gen[0].natural_order_input.PE/has_TW_mult.MULT/i_cmpy/four_mult_structure.use_dsp.i_dsp/re_im/use_DSP48.qDSP[0].appDSP[0].bppDSP[0].u_l[0].use_dsp48e1.dsp	�FFT/U0/i_synth/xfft_inst/floating_point.xfft_inst/fft/non_floating_point.arch_d.xfft_inst/pe_gen[0].natural_order_input.PE/has_TW_mult.MULT/i_cmpy/four_mult_structure.use_dsp.i_dsp/re_im/use_DSP48.qDSP[0].appDSP[0].bppDSP[0].u_l[0].use_dsp48e1.dsp2default:default2default:default2L
 4DRC|Netlist|Instance|Invalid attribute value|DSP48E12default:default8ZAVAL-4h px� 
�
�enum_USE_DPORT_FALSE_enum_DREG_ADREG_0_connects_CED_CEAD_RSTD_GND: %s: DSP48E1 is not using the D port (USE_DPORT = FALSE). For improved power characteristics, set DREG and ADREG to '1', tie CED, CEAD, and RSTD to logic '0'.%s*DRC2�
 "�
�FFT/U0/i_synth/xfft_inst/floating_point.xfft_inst/fft/non_floating_point.arch_d.xfft_inst/pe_gen[0].natural_order_input.PE/has_TW_mult.MULT/i_cmpy/four_mult_structure.use_dsp.i_dsp/re_im/use_DSP48.qDSP[0].appDSP[0].bppDSP[0].u_l[1].use_dsp48e1.dsp	�FFT/U0/i_synth/xfft_inst/floating_point.xfft_inst/fft/non_floating_point.arch_d.xfft_inst/pe_gen[0].natural_order_input.PE/has_TW_mult.MULT/i_cmpy/four_mult_structure.use_dsp.i_dsp/re_im/use_DSP48.qDSP[0].appDSP[0].bppDSP[0].u_l[1].use_dsp48e1.dsp2default:default2default:default2L
 4DRC|Netlist|Instance|Invalid attribute value|DSP48E12default:default8ZAVAL-4h px� 
�
�enum_USE_DPORT_FALSE_enum_DREG_ADREG_0_connects_CED_CEAD_RSTD_GND: %s: DSP48E1 is not using the D port (USE_DPORT = FALSE). For improved power characteristics, set DREG and ADREG to '1', tie CED, CEAD, and RSTD to logic '0'.%s*DRC2�
 "�
�FFT/U0/i_synth/xfft_inst/floating_point.xfft_inst/fft/non_floating_point.arch_d.xfft_inst/pe_gen[0].natural_order_input.PE/has_TW_mult.MULT/i_cmpy/four_mult_structure.use_dsp.i_dsp/re_im/use_DSP48.qDSP[0].appDSP[0].bppDSP[1].u_l[0].use_dsp48e1.dsp	�FFT/U0/i_synth/xfft_inst/floating_point.xfft_inst/fft/non_floating_point.arch_d.xfft_inst/pe_gen[0].natural_order_input.PE/has_TW_mult.MULT/i_cmpy/four_mult_structure.use_dsp.i_dsp/re_im/use_DSP48.qDSP[0].appDSP[0].bppDSP[1].u_l[0].use_dsp48e1.dsp2default:default2default:default2L
 4DRC|Netlist|Instance|Invalid attribute value|DSP48E12default:default8ZAVAL-4h px� 
�
�enum_USE_DPORT_FALSE_enum_DREG_ADREG_0_connects_CED_CEAD_RSTD_GND: %s: DSP48E1 is not using the D port (USE_DPORT = FALSE). For improved power characteristics, set DREG and ADREG to '1', tie CED, CEAD, and RSTD to logic '0'.%s*DRC2�
 "�
�FFT/U0/i_synth/xfft_inst/floating_point.xfft_inst/fft/non_floating_point.arch_d.xfft_inst/pe_gen[0].natural_order_input.PE/has_TW_mult.MULT/i_cmpy/four_mult_structure.use_dsp.i_dsp/re_im/use_DSP48.qDSP[1].appDSP[0].bppDSP[0].u_l[0].use_dsp48e1.dsp	�FFT/U0/i_synth/xfft_inst/floating_point.xfft_inst/fft/non_floating_point.arch_d.xfft_inst/pe_gen[0].natural_order_input.PE/has_TW_mult.MULT/i_cmpy/four_mult_structure.use_dsp.i_dsp/re_im/use_DSP48.qDSP[1].appDSP[0].bppDSP[0].u_l[0].use_dsp48e1.dsp2default:default2default:default2L
 4DRC|Netlist|Instance|Invalid attribute value|DSP48E12default:default8ZAVAL-4h px� 
�
�enum_USE_DPORT_FALSE_enum_DREG_ADREG_0_connects_CED_CEAD_RSTD_GND: %s: DSP48E1 is not using the D port (USE_DPORT = FALSE). For improved power characteristics, set DREG and ADREG to '1', tie CED, CEAD, and RSTD to logic '0'.%s*DRC2�
 "�
�FFT/U0/i_synth/xfft_inst/floating_point.xfft_inst/fft/non_floating_point.arch_d.xfft_inst/pe_gen[0].natural_order_input.PE/has_TW_mult.MULT/i_cmpy/four_mult_structure.use_dsp.i_dsp/re_im/use_DSP48.qDSP[1].appDSP[0].bppDSP[0].u_l[1].use_dsp48e1.dsp	�FFT/U0/i_synth/xfft_inst/floating_point.xfft_inst/fft/non_floating_point.arch_d.xfft_inst/pe_gen[0].natural_order_input.PE/has_TW_mult.MULT/i_cmpy/four_mult_structure.use_dsp.i_dsp/re_im/use_DSP48.qDSP[1].appDSP[0].bppDSP[0].u_l[1].use_dsp48e1.dsp2default:default2default:default2L
 4DRC|Netlist|Instance|Invalid attribute value|DSP48E12default:default8ZAVAL-4h px� 
�
�enum_USE_DPORT_FALSE_enum_DREG_ADREG_0_connects_CED_CEAD_RSTD_GND: %s: DSP48E1 is not using the D port (USE_DPORT = FALSE). For improved power characteristics, set DREG and ADREG to '1', tie CED, CEAD, and RSTD to logic '0'.%s*DRC2�
 "�
�FFT/U0/i_synth/xfft_inst/floating_point.xfft_inst/fft/non_floating_point.arch_d.xfft_inst/pe_gen[0].natural_order_input.PE/has_TW_mult.MULT/i_cmpy/four_mult_structure.use_dsp.i_dsp/re_im/use_DSP48.qDSP[1].appDSP[0].bppDSP[1].u_l[0].use_dsp48e1.dsp	�FFT/U0/i_synth/xfft_inst/floating_point.xfft_inst/fft/non_floating_point.arch_d.xfft_inst/pe_gen[0].natural_order_input.PE/has_TW_mult.MULT/i_cmpy/four_mult_structure.use_dsp.i_dsp/re_im/use_DSP48.qDSP[1].appDSP[0].bppDSP[1].u_l[0].use_dsp48e1.dsp2default:default2default:default2L
 4DRC|Netlist|Instance|Invalid attribute value|DSP48E12default:default8ZAVAL-4h px� 
�	
�writefirst: Synchronous clocking is detected for BRAM (%s) in SDP mode with WRITE_FIRST write-mode. This is the preferred mode for best power characteristics, however it may exhibit address collisions if the same address appears on both read and write ports resulting in unknown or corrupted read data. It is suggested to confirm via simulation that an address collision never occurs and if so it is suggested to try and avoid this situation. If address collisions cannot be avoided, the write-mode may be set to READ_FIRST which guarantees that the read data is the prior contents of the memory at the cost of additional power in the design. See the FPGA Memory Resources User Guide for additional information.%s*DRC2�
 "�
�FFT/U0/i_synth/xfft_inst/floating_point.xfft_inst/fft/non_floating_point.arch_d.xfft_inst/has_bit_reverse.dig_rev_mem/blk_ram.use_bram_only.mem/depths_3to9.ram_loop[0].use_RAMB18.SDP_RAMB18E1_36x512	�FFT/U0/i_synth/xfft_inst/floating_point.xfft_inst/fft/non_floating_point.arch_d.xfft_inst/has_bit_reverse.dig_rev_mem/blk_ram.use_bram_only.mem/depths_3to9.ram_loop[0].use_RAMB18.SDP_RAMB18E1_36x5122default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB18E12default:default8ZREQP-165h px� 
�	
�writefirst: Synchronous clocking is detected for BRAM (%s) in SDP mode with WRITE_FIRST write-mode. This is the preferred mode for best power characteristics, however it may exhibit address collisions if the same address appears on both read and write ports resulting in unknown or corrupted read data. It is suggested to confirm via simulation that an address collision never occurs and if so it is suggested to try and avoid this situation. If address collisions cannot be avoided, the write-mode may be set to READ_FIRST which guarantees that the read data is the prior contents of the memory at the cost of additional power in the design. See the FPGA Memory Resources User Guide for additional information.%s*DRC2�
 "�
�FFT/U0/i_synth/xfft_inst/floating_point.xfft_inst/fft/non_floating_point.arch_d.xfft_inst/has_bit_reverse.dig_rev_mem/blk_ram.use_bram_only.mem/depths_3to9.ram_loop[1].use_RAMB18.SDP_RAMB18E1_36x512	�FFT/U0/i_synth/xfft_inst/floating_point.xfft_inst/fft/non_floating_point.arch_d.xfft_inst/has_bit_reverse.dig_rev_mem/blk_ram.use_bram_only.mem/depths_3to9.ram_loop[1].use_RAMB18.SDP_RAMB18E1_36x5122default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB18E12default:default8ZREQP-165h px� 
t
DRC finished with %s
1905*	planAhead26
"2 Errors, 1 Warnings, 8 Advisories2default:defaultZ12-3199h px� 
i
BPlease refer to the DRC report (report_drc) for more information.
1906*	planAheadZ12-3200h px� 
R
+Error(s) found during DRC. Bitgen not run.
1345*	planAheadZ12-1345h px� 
Z
Releasing license: %s
83*common2"
Implementation2default:defaultZ17-83h px� 
�
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
232default:default2
22default:default2
02default:default2
32default:defaultZ4-41h px� 
Q

%s failed
30*	vivadotcl2#
write_bitstream2default:defaultZ4-43h px� 
�
Exiting %s at %s...
206*common2
Vivado2default:default2,
Tue Dec  5 12:35:01 20232default:defaultZ17-206h px� 


End Record