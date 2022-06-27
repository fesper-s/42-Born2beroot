#!/usr/bin/env bash

ARCH=$(uname -a)
CPUP=$(lscpu | grep 'Core(s)' | awk '{ printf("%d", $4) }')
VCPU=$(lscpu | grep -m1 'CPU(s)' | awk '{ printf("%d", $2) }')
MEMP=$(free -m | grep 'Mem' | awk '{ printf("%.2f\n", $3/$2*100) }')
MEMU=$(free -m | grep 'Mem' | awk '{ printf("%s", $3) }')
MEMT=$(free -m | grep 'Mem' | awk '{ printf("%s", $2) }')
DISU=$(df -m | grep 'root' | awk '{ printf("%s", $3) }')
DIST=$(df -h | grep 'root' | awk '{ printf("%s", $4) }' | sed 's/\...//')
DISP=$(df -m | grep 'root' | awk '{ printf("%s", $5) }')
CPUL=$(top -bn1 | grep '%Cpu' | awk '{ printf("%.1f", $2 + $6) }')
BOOT=$(who -b | awk '{ printf("%s %s", $3, $4) }')
SLVM=$(lsblk | grep 'lvm' | wc -l)
DLVM=$([ ${SLVM} -ne 0 ] && echo "yes" || echo "no")
CTCP=$(ss -t | grep 'ESTAB' | wc -l)
ULOG=$(w | grep 'user' | awk '{ printf("%s", $5) }')
IPAD=$(ip a | grep -m1 'inet.*global' | awk '{ printf("%s", $2) }' | sed 's/\/.*//')
MACA=$(ip a | grep 'link/ether' | awk '{ printf("%s", $2) }')
CMDS=$(journalctl _COMM=sudo | grep COMMAND | wc -l)

wall "#Architeture: ${ARCH}
#CPU physical : ${CPUP}
#vCPU : ${VCPU}
#Memory Usage: ${MEMU}/${MEMT}MB (${MEMP}%)
#Disk Usage: ${DISU}/${DIST}Gb (${DISP})
#CPU load: ${CPUL}%
#Last boot: ${BOOT}
#LVM use: ${DLVM}
#Connections TCP : ${CTCP} ESTABLISHED
#User log: ${ULOG}
#Network: IP ${IPAD} (${MACA})
#Sudo : ${CMDS} cmd"
