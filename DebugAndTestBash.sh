[ -e build/X86/gem5.debug ] && rm build/X86/gem5.debug
scons build/X86/gem5.debug

RangeFilePath="/if22/ml2au/gem5/BetaGem/MarziehTests/fftRangefiles/"
RangeFilePath1=${RangeFilePath}1.txt
RangeFilePath2=${RangeFilePath}2.txt
[ -e ${RangeFilePath1} ] && rm ${RangeFilePath2}
#rm ${RangeFilePath1}
#rm ${RangeFilePath2}

#fftoptiont1="262144 ${RangeFilePath1}" 
#fftoptiont2="262144 ${RangeFilePath2}"
fftoptiont1="2048 ${RangeFilePath1}" 
fftoptiont2="2048 ${RangeFilePath2}"
echo $fftoptiont

gdb ./build/X86/gem5.debug
run --debug-flags=SALAM -d ~/gem5/BetaGem/MarziehTests/fftStatistcRatio8  configs/example/se.py  --rangeFileName=${RangeFilePath1} --cpu-type=detailed --caches  --l2cache  --l1d_size=32kB --l2_size=512kB  --ratio=8 -c MarziehTests/fftRange --options="${fftoptiont1}"



