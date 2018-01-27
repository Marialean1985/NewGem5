[ -e build/X86/gem5.opt ] && rm build/X86/gem5.opt
scons build/X86/gem5.opt
cwd=$(pwd)

RangeFilePath=${cwd}/MarziehTests/fftRangefiles/
RangeFilePath1=${RangeFilePath}1.txt
RangeFilePath2=${RangeFilePath}2.txt
[ -e ${RangeFilePath1}_0 ] && rm ${RangeFilePath1}_0
[ -e ${RangeFilePath2}_0 ] && rm ${RangeFilePath2}_0
#rm ${RangeFilePath1}
#rm ${RangeFilePath2}

fftoptiont1="262144 ${RangeFilePath1}_0" 
fftoptiont2="262144 ${RangeFilePath2}_0"
#fftoptiont1="2048 ${RangeFilePath1}_0" 
#fftoptiont2="2048 ${RangeFilePath2}_0"
echo $fftoptiont
#echo test with hello
#build/X86/gem5.opt    configs/example/se.py  --rangeFileName=Alaki.txt --cpu-type=detailed --caches  --l2cache --l3cache --l1d_size=32kB --l2_size=256kB --l3_size=2MB --ratio=8.5 -c tests/test-progs/hello/bin/x86/linux/hello
#echo testing with fft with 
#--debug-flags=SALAM,TLB,Cache
#build/X86/gem5.opt --debug-flags=SALAM  -d ${cwd}/MarziehTests/fftStatistcRatio8  configs/example/se.py  --rangeFileName=${RangeFilePath1} --cpu-type=detailed --caches  --l2cache  --l3cache --l1d_size=32kB --l2_size=512kB --l3_size=2MB --reducedVarSize1=4  --mem-size=8GB -c MarziehTests/fftRange --options="${fftoptiont1}"
#echo testing with fft with 8.5
#build/X86/gem5.opt --debug-flags=SALAM  -d ${cwd}/MarziehTests/fftStatistcRatio1  configs/example/se.py  --rangeFileName=${RangeFilePath2} --cpu-type=detailed --caches  --l2cache --l3cache  --l1d_size=32kB --l2_size=512kB --l3_size=2MB --ratio=1 --mem-size=8GB -c MarziehTests/fftRange --options="${fftoptiont2}" 
#--debug-flags=Cache


#--standard-switch --warmup-insts=50984
#--mem-type=SimpleMemory
#--mem-type=LPDDR3_1600_x32
#--l3cache --l3_size=2MB
#--mem-channels=2
build/X86/gem5.opt  -d ${cwd}/MarziehTests/fftStatist32KBL1  configs/example/se.py  --ConversionLocation=L2  --num-cpus=1 --rangeFileName=${RangeFilePath1}  --warmup-insts=50984 --cpu-type=detailed  --mem-type=DDR3_1600_x64 --caches  --l2cache   --l1d_size=32kB --l2_size=256kB  --l3cache --l3_size=8MB  --ratio=1 --L3Latency=54 --mem-size=8GB -c MarziehTests/fftRange --options="${fftoptiont1}" & 
#echo testing with fft with 8.5

build/X86/gem5.opt  -d ${cwd}/MarziehTests/fftStatistc64KBL1  configs/example/se.py  --ConversionLocation=L2  --num-cpus=1 --rangeFileName=${RangeFilePath2}   --warmup-insts=50984 --cpu-type=detailed --mem-type=DDR3_1600_x64 --caches  --l2cache   --l1d_size=64kB --l2_size=256kB  --l3cache --l3_size=8MB --ratio=1 --mem-size=8GB -c MarziehTests/fftRange --options="${fftoptiont2}" & 
#--debug-flags=Cache
