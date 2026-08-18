if [ -e '/sys/class/power_supply/BAT0' ]; then dir='/sys/class/power_supply/BAT0';bat=$(cat /sys/class/power_supply/BAT0/capacity); elif  [ -e '/sys/class/power_supply/BAT1' ]; then dir='/sys/class/power_supply/BAT1';bat=$(cat /sys/class/power_supply/BAT1/capacity); else echo "!!!"; exit; fi
if [ $bat -le 20 ]; then col="1"; elif [ $bat -le 60 ]; then col="3"; elif [ $bat -le 99 ]; then col="2"; elif [ $bat -eq 100 ]; then col="6"; fi
ufos="$(cat $dir/status) at $bat%"; while (( ${#ufos} < 28 )); do if (($((${#ufos} % 2)) == 1)); then ufos="$ufos."; else ufos=".$ufos."; fi; done; ufos="[$ufos]" 
if (($(($bat % 10)) < 2));  then subpos=0; elif (($(($bat % 10)) < 5)); then subpos=1; elif (($(($bat % 10)) < 8)); then subpos=2; else subpos=3; fi
pos=$(($((${#ufos} / 10))*$(($bat/10)) + $subpos))
fos="\033[7;3${col}m${ufos:0:$pos}\033[27m${ufos:$pos}"
echo -e "\033[1m"$fos
