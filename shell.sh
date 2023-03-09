#!/bin/bash



delete() {
    echo "Enter the biggest file size:\c"
    read fileSize
    for i in $(find $dirr -type f); do
        SIZE=$(cat $i | wc -c)
        if [ $SIZE -ge $fileSize ]; then
            rm $i
        fi
    done
}

analysis() {
    echo "Enter regex:"
    read rege
    counter=0
    for i in $(find $dirr -type f); do
        counter=$((counter + $(grep -o -E "$rege" $i | wc -l)))
    done
    echo "Number of occurrence: $counter"
}

arrangement() {
    echo "Enter file extension for arrangement:\c"
    read exe
    echo "Enter a name for the folder to be created"
    read folderName
    mkdir $dirr/$folderName

    for i in $(find $dirr -type f); do
        if [ "${i##*.}" = "$exe" ]; then
            mv $i $dirr/$folderName
        fi
    done
}




echo "Enter directory name:\c"
read dirr
echo "Enter one of the operations you would like to use ("ana","del","arr"):\c"
read input
input=$(echo $input | tr '[:upper:]' '[:lower:]')

if [ $input = 'del' ]; then

    delete

elif [ $input = 'arr' ]; then

    arrangement

elif [ $input = 'ana' ]; then

    analysis

else
    echo "Wrong entry format"
fi