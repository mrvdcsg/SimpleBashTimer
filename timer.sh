#!/usr/bin/env bash
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[0;33m'
RESET='\033[0m'
hour='0'
min='0'
sec='0'
ann="Timer Complete"
while getopts "h:m:s:pbda:" flag; do
  case ${flag} in
    h ) hour=$OPTARG ;;
    m ) min=$OPTARG  ;;
    s ) sec=$OPTARG  ;;
    p ) min=25 
        ann="Pomodoro Complete" ;;
    b ) min=5 
        ann="Break Complete" ;;
    a ) ann=$OPTARG ;;
    d ) printf "Available Options: \n -d View this help file \n -h) Specify hours for timer \n -m) Specify Minutes for timer \n -s) Specify Seconds for timer \n -p) Standard pomodoro (25 minutes timer) \n -r) Standard Pomodoro Break \n -a) Timer Completion Announcement (should be quoted) \n"
        exit 0 ;;
  esac
done
if [ $OPTIND -eq 1 ]; then printf "Available Options: \n -d View this help file \n -h) Specify hours for timer \n -m) Specify Minutes for timer \n -s) Specify Seconds for timer \n -p) Standard pomodoro (25 minutes timer) \n -r) Standard Pomodoro Break \n -a) (MacOS Only)Timer Completion Announcement (should be quoted) \n";
exit 0 
fi

begin=`date +%s`
alarm=$(( $hour*3600 + $min*60 + $sec + $begin ))
timeleft=$(( $alarm-$begin ))
tput civis
  while [ $timeleft -ge 1 ]; do
    printf ${GREEN}
    if [ "$timeleft" -le "60" ]; then
      printf ${YELLOW}
    fi
    if [ "$timeleft" -le "10" ]; then
      printf ${RED} 
    fi
    let "now=`date +%s`"
    timeleft=$(( $alarm-$now ))
    printf '%02d:%02d:%02d\r' $((timeleft/3600)) $((timeleft%3600/60)) $((timeleft%60))
    printf "${RESET}"
    if [ "$timeleft" -ge "3" ]; then
      sleep 1
    fi
    if [ "$timeleft" -eq "0" ]; then
      printf ${GREEN}
      printf " *****************  Timer For $hour:$min:$sec Compete  *****************"
      printf ${RESET}
      break
    fi
  done
printf "\n ${RESET}"
if [ "$(uname)" == "Darwin" ]
then
  terminal-notifier -title "Terminal" -message "$ann"
  say -v samantha $ann
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]
then
  printf Timer Complete
elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]
then
  printf Timer Complete
elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW64_NT" ]
then
  printf Timer Complete
fi
tput cnorm