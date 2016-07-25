
ghdl.exe -a helpfunc.vhdl logarithmierer.vhdl logarithmierertb.vhdl

ghdl.exe -e logarithmiererTB


ghdl.exe -r logarithmiererTB --vcd=vcdOut.vcd
pause