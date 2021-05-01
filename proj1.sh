#!/bin/bash


indent_print()
{
	for (( i = 0; i<$1; i++)) 
	do
		printf "\t" >> $2;
	done
}

main()
{
    echo > $2;	
    if [ $# -eq 2 ] 
    then
    map $1 $2 0;
    else
    echo "invalid argument"
    fi
}

map()	
{
        echo -n '<ul>' >> $2;
	local level=$3;
	for x in `find $1 -maxdepth 1 `
	do 
	      if [ -r $x ] 
	      then
		if [ -d $x ]
		then
			if [ $x != $1 ] 
			then
				echo -n '<li>' >> $2;
				indent_print $3 $2;
				echo $x >> $2;
				map $x $2 $((level+1));
			fi
		elif [ -f $x ]
		then
			echo -n '<li>' >> $2;
			indent_print $3 $2;
			repath=`realpath --relative-to=$1 $x`;
			echo \<a href=\"$x'">'$repath'</a>' >> $2;
		fi
	      fi
	done
	echo -n '</ul>' >> $2;
}

main $1 $2;
