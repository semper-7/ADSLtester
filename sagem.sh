P="/sdcard/ADSLtester/"
A="192.168.1.1"
[ -e $P"sagem.log" ] && rm $P"sagem.log"
if ping -c 1 -W 1 $A > /dev/null
then
sh $P"sagem.nc" | nc $A 23 >$P"sagem.log" 2> /dev/null
sed -ne "s/^.*, Ups.*= \(.*Kbps\),.*= \(.*\) Link.*L0 Mode: \(.*\): ATM.*SNR (dB): \(.*\..\) \(.*\\..\) Attn(dB): \(.*\..\) \(.*\\..\) Pwr.*/\3\nRate: \2 \/ \1\nSNR: \4dB \/ \5dB\nAttn: \6dB \/ \7dB/p" < $P"sagem.log"
else
echo Error: No ping modem!
fi
