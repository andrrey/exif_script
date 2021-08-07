#!/bin/bash

DIR="/home/andrey/pics"


process_coords(){
	echo "Processing coords file $1"
	echo "Before:"
	cat $1

	mv $1 $1.old
	echo "-gpslatitude-=" > $1
	cat $1.old >> $1
	rm -f $1.old
	sed -i "2 a -gpslongitude-=" $1
	sed -i "4 a -gpslatituderef-=" $1
	sed -i "6 a -gpslongituderef-=" $1
	#sed -i -f commands.sed $1

	echo "After:"
	cat $1
}


process_dir(){
	for entry in $1/*
	do
		if [ -d $entry ]
		then
			process_dir $entry
		fi
	done

	if [ -f $1/coords.txt ]
	then
		process_coords $1/coords.txt
	fi
}


process_dir $DIR

