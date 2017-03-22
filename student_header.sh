#!/bin/bash

NAME="Joseph Morgan"
CLASS="CISP 400 MoWe 3:00pm"
ASSIGNMENT=$1
DATE=$(date -I)

if [[ $# -eq 0 ]] ; then
	echo 'Name of project is required'
	exit 0
fi

if [ $1 == "d" ] ; then
	echo 'Deleting header - Be careful! If no header is present, the first five lines of your files will be deleted'
	read -p "Are you sure?" -n 1 -r
	echo
	if [[ $REPLY =~ ^[Yy]$ ]]
	then
		for f in ./*.cpp ;
		do
			echo "$(tail -n +6 $f)" > $f
		done
		for f in ./*.h ;
		do
			echo "$(tail -n +6 $f)" > $f
		done
	fi
	exit 0
fi

for f in ./*.cpp ;
do
	echo -e "// $NAME\n// $CLASS\n// $ASSIGNMENT\n// $DATE\n\n$(cat $f)" > $f
done

for f in ./*.h ; 
do
	echo -e "// $NAME\n// $CLASS\n// $ASSIGNMENT\n// $DATE\n\n$(cat $f)" > $f
done
