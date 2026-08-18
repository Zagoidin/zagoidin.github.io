lst="$PWD    $(date +%H:%M)    $(bash /home/z/mygit/statusbat.bash)"  
if git branch --show-current &> /dev/null; then rst="($(git branch --show-current))"; else rst=""; fi
llst=$(echo -e "$lst" | sed 's/\x1b[[0-9;]*m//g')
sst=$(( $COLUMNS - $((${#llst} + ${#rst})) ))
echo -e "\n\033[2m$lst\033[0m\033[${sst}C$rst"
