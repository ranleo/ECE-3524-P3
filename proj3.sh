#!/bin/bash


while [ true ]
do
#display data and menu
echo "$(date)"
echo "-------------------------------------------------"
echo "Main Menu"
echo "-------------------------------------------------"
echo "1. Operating system info"
echo "2. Hostname and DNS info"
echo "3. Network info"
echo "4. Who is online"
echo "5. Last logged in users"
echo "6. My IP address"
echo "7. My disk usage"
echo "8. My home file-tree"
echo "9. Process operations"
echo "10. Exit"
echo "Enter your choice [ 1 -10 ]"
read A
case $A in 
1)
 echo "-----------------------------------------------"
 echo " System information "
 echo "-----------------------------------------------"
 echo "Operating system : $(uname)"
 lsb_release -a
 ;;
2) 
 echo "-----------------------------------------------"
 echo " Hostname and DNS information "
 echo "-----------------------------------------------"
 echo "Hostname : $(hostname)"
 echo "DNS domain : $(domainname)"
 echo "Fully qualified domain name : $(hostname -f)"
 echo "Network address (IP) : $(hostname -i)"
 echo "DNS name servers (DNS IP) : $(hostname -id)"
 ;;
 3)
 echo "-----------------------------------------------"
 echo "Network information"
 echo "-----------------------------------------------"
 echo "Total network interfaces found: $(ls -l /sys/class/net | wc -l)"
 echo "*** IP Address Information ***"
 ip addr
 echo "*******************************"
 echo "******Network routing**********"
 echo "*******************************"
 netstat -rn
 echo "*******************************"
 echo "**Interface traffic information*"
 echo "*******************************"
 netstat -i
 ;;
 4)
 echo "----------------------------------------------"
 echo " Who is online "
 echo "----------------------------------------------"
 echo "NAME    LINE             TIME           COMMENT"
 who
 ;;
 5)
 echo "----------------------------------------------"
 echo " List of last logged in users "
 echo "----------------------------------------------"
 last
 ;;
 6)
 echo "----------------------------------------------"
 echo " Public IP information "
 echo "----------------------------------------------"
 dig TXT +short o-o.myaddr.l.google.com@ns1.google.com
 ;;
 7)
 echo "----------------------------------------------"
 echo " Disk Usage Info "
 echo "----------------------------------------------"
 df -h
 ;;
 8)
 echo "----------------------------------------------"
 echo " Home file-tree "
 echo "----------------------------------------------"
 sh ./proj1.sh ./$home ~/filetree.html
 ;;
 9)
 sh ./proc.sh 
 
 ;;
 10)
 exit
 ;;
 
 esac
 
 if [ $A -ne 9 ]
 then 
 read -p "Press [Enter] key to continue..."
 fi
 
 done

