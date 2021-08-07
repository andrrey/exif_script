bulk_exif_script.sh
-------------------

bulk_exif_script.sh is used to run through a directory tree and run exiftool on every file corresponding to given
wildcard (see variable MASKS in script), assuming that there is coords.txt file in every subdirectory, which will be
used as a parameter file when calling exiftool. There may be any parameters in there, but as initially it was used to
update a position, it was called coords.txt


fix_coords_list.sh
------------------

fix_coords_list.sh was used to update set of coords.txt in a directory tree, when bulk update was needed.
  
