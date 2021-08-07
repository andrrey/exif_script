#!/bin/bash

DIR="/home/andrey/pics"
MASKS=("*.jpg" "*.mp4")

# This is old method processing by one file. It is not used now, use bulk method below instead
#process_file(){
#	if [ -f $1 ]
#	then
#		DIRNAME="$(dirname $1)"
#		if [ -f $DIRNAME/coords.txt ]
#		then
#			exiftool $1 -@ $DIRNAME/coords.txt
#		else
#			echo "!!! No coords.txt in $DIRNAME"
#		fi	
#	fi
#}

process_file_bulk(){
	for thisIsHowWeCheckThatThereIsAtLeastOneFileInWildCard in $2/$1
	do
		if [ -f $thisIsHowWeCheckThatThereIsAtLeastOneFileInWildCard ]
		then	
			if [ -f $2/coords.txt ]
			then
				echo "Working bulk $2/$1"
				exiftool $2/$1 -@ $2/coords.txt
				rm $2/*_original
			else
				echo "!!! No coords.txt in $2"
			fi
		else
			# No file - do nothing
			break
		fi

		# We need just one iteraton of this loop, because it is how we check that
		# at least one file exist for a wildcard
		break
	done
}

process_dir(){
	#echo "Processing directory $1"
	for direntry in $1/*
	do
		if [ -d "$direntry" ]
		then
			process_dir $direntry
		fi
	done

	for mask in "${MASKS[@]}"
	do
		#echo "*** Working with mask $mask ***"
		#for file in $1/$mask
		#do
		#	process_file $file
		#done
		process_file_bulk $mask $1
	done


}

process_dir $DIR

