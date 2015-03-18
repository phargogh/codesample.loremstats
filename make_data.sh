#!/bin/bash
#
# Generate a randomized, nested directory tree with files filled with
# random selections of words.



# Make a file folder with 7 files filled with random words from /usr/share/dict/web2
# There's a 33% chance that this folder will contain another folder with
# the same number of randomly generated text files.
# 
# Arg1: the folder name to write files to.
#
# Returns: nothing.
function makeFileDir {
    dirname=$1
    mkdir $dirname
    for filenum in {0..7}
    do
        filename=$dirname/$filenum.txt
        ruby -e 'a=STDIN.readlines;50.times do;b=[];20.times do; b << a[rand(a.size)].chomp end; puts b.join(" "); end' < /usr/share/dict/web2 > $filename

        md5 $filename
    done

    # 20% chance to make a nested folder with more files in it.
    if [ "`echo $[ 1 + $[ RANDOM % 3 ]]`" == "1" ]
    then
        makeFileDir $dirname/`pwgen`
    fi
}

# Put the data in a known foldername.
$DATADIR=lorem-data
mkdir $DATADIR
for dirnum in {0..7}
do
    dirname="$DATADIR/`pwgen`"
    makeFileDir $dirname
done

# show the disk size of the output folder
du -h -d 0 $DATADIR
