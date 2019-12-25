declare -a EmptyArray
declare -a AllArray

echo Hello. This code is 'for' showing you all the files in your path and 
echo delete the empty files 'if' you want. After you click \'y\' button,
echo the system will show you the empty txt files one by one.
echo 

i=0
b=0
# filling array with all files in that path
for file in *.*
do
        AllArray[$i]=$file
        i=$(($i+1))
done
p=0
j=0
#checking an empty text file and filling EmptyArray with these empty txt files.
for p in ${AllArray[@]}
do
	if [ ! -s ${p} ]
	then
		EmptyArray[$j]=$p
		j=$(($j+1))
	fi
done

echo These are all files:*********** 
# printing the AllArray=All files in that path
for b in ${AllArray[@]}
do 
	echo $b;
done
#printng the EmptyArray=All empty txt files in that path
echo These are empty text files:**** 
len=(${#EmptyArray[@]})

for k in ${EmptyArray[@]}
do 
	echo $k;
done
#erase part
echo Do you want to erase empty txt files? y,n 
read varname #take an answer 


if [ $varname == "y" ]
then
	if [ $len == 0 ]
	then 
		echo There was no file.
	else 	#if user wants to erase, unset the array.
		rm -i ${EmptyArray[*]}
		unset EmptyArray
	fi
else
	echo Failed to delete files!
fi

