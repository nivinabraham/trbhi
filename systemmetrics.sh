!/bin/bash
Network=$(sudo iftop -t -s 1 -n -N 2>/dev/null | grep 'Cumulative (sent/received/total):' | awk '{print $(NF)}')
DISK=$(df -h | awk '$NF=="/"{printf "%s\t\t", $5}')
CPU=$(top -bn1 | grep load | awk '{printf "%.2f%%\t\t\n", $(NF-2)}')
printf "CPU\t\tDisk\t\tNetwork\n"
echo "$CPU$DISK$Network"
