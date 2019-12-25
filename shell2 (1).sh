declare -a paranArr # keeping paranthesis in an array
declare -a bracketArr # keeping bracket in an array
declare -a ifArr # keeping if in an array
declare -a doArr # keeping do in an array

echo Hello. This code controls the parantheses in a text file.
echo Enter path
read path #taking a path from user

input="$path"

#these are the counters that we will use. 
paranCount=0
bracketCount=0
ifCount=0
doCount=0

#checking if there is any [, {
while IFS= read -n1 line
do
	if [[   "$line" == "[" ]]
	then
		paranArr[$paranCount]=$line
		paranCount=$(($paranCount+1))
	elif [[ "$line" == "{" ]]
	then 
		bracketArr[$bracketCount]=$line
		bracketCount=$(($bracketCount+1))
	
	fi

done < "$input"

# checking if-do 
while read -ra line; 
do
        if [[ "$line" == "if" ]]
	then
		ifArr[$ifCount]=$line
		ifCount=$(($ifCount+1))
	elif [[ "$line" == "do" ]]
	then
		doArr[$doCount]=$line
		doCount=$(($doCount+1))
	fi
   
done < "$input"
y=0
n=0
g=0
h=0

#shows the [, {, id and do arrays for add the array successfully
echo Parantheses Array**********

for y in ${paranArr[@]}
do 
	echo Before**** $y;
done

echo Curly Brackets************* 

for n in ${bracketArr[@]}
do 
	echo Before**** $n;
done

echo If-Fi Statements********** 

for g in ${ifArr[@]}
do 
	echo Before**** $g;
done

echo Do-Done Statements**********
 
for h in ${doArr[@]}
do 
	echo Before**** $h;
done

t=0
h=0
x=0
v=0

#unset the array of that index, when it sees de close
#parantheses against open parantheses. And same for the others.
while IFS= read -n1 line
do
	if [[   "$line" == "]" ]]
	then
		unset paranArr[$t]
		t=$(($t+1))
		
	elif [[ "$line" == "}" ]]
	then 
		unset bracketArr[$h]
		h=$(($h+1))
	
	fi

done < "$input"

while read -ra line; 
do
    
        if [[ "$line" == "fi" ]]
	then
		unset ifArr[$x]
		x=$(($x+1))	
	elif [[ "$line" == "done" ]]
	then
		unset doArr[$v]
		v=$(($v+1))
	fi
     
  
done < "$input"

# Showing after situations of arrays to check whether the opening situations
# closed or not. If matching is true, we will see empty.
echo After Parantheses**********

for y in ${paranArr[@]}
do 
	echo After**** $y;
done

echo After Curly Brackets*************


for n in ${bracketArr[@]}
do 
	echo After**** $n;
done

echo After If-Fi Statements***********

for g in ${ifArr[@]}
do 
	echo After**** $g;
done

echo After Do-Done Statements***********

for h in ${doArr[@]}
do 
	echo After**** $h;
done

#check if file exist
if [ ! -e $path ] 
then
  echo "file doesnt exists"
fi
