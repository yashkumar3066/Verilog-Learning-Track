transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

asim +access +r +m+FFT  -L xpm -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.FFT xil_defaultlib.glbl

do {FFT.udo}

run 1000ns

endsim

quit -force
