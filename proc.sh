#!/bin/bash
while [ true ]
do
echo "please enter the number of your selection below"
echo ""
echo "1. show all process"
echo "2. Kill a process"
echo "3. Bring up top"
echo "4. Return to Main Menu"
echo "Enter your choice [ 1 -4 ]"
read A
case $A in 
1)
 ps -f
 ;;
2)
echo "Please enter the PID of the process yoy would like to kill:"
read pid
kill -9 $pid
;;
3)
top
;;
4)
break
;;
*)
;;
esac

read input
if [ $input = "q"  ]
 then 
  continue;
 fi
done
 
