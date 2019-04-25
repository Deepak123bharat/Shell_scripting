# all tutorial for bash or exicute with ./filename.sh
# first of all change the mode of bash file
# ->> chmode +x test.sh
#you can see mode of all file using ->>ls -al
#and run 
# ./test.sh
#How to append output to the end of text file
	echo -e "enter file name: \c"
	read file_name

	if [ -f $file_name ]
	then 
	    if [ -w $file_name ]
	    then
		echo "write some date and press ^d for exit"
		cat >> $file_name
	    else
		echo "$file_name does not have write permition."
	    fi
	else
	echo "$file_name does not exists"
	fi

#Logical 'AND' Operator
	age=25 		#don't give space between "age" and "="
	if [ $age -gt 18  -a  $age -lt 30 ]
	then
	echo "condition satsified"
	fi
        
	# or
        
	age=25 
	if [ $age -gt 18 ]  &&  [ $age -lt 30 ]
	then
	echo "condition satsified"
	fi

#Logical 'OR' Operator
	age=20
	if [ $age -gt 18 ]  ||  [ $age -lt 30 ]
	then
	echo "condition satsified"
	fi
        
	#or
        
	age=17
	if [ $age -lt 18 -o $age -gt 30 ]
	then
	echo "condition satsified"
	fi

# Perform arithmetic operations
	num1=20
	num2=5
	echo $(( num1 + num2 ))
	echo $(( num1 - num2 ))
	echo $(( num1 * num2 ))
	echo $(( num1 / num2 ))
	echo $(( num1 % num2 ))
	
	#or
	
	num1=20
	num2=5
	echo $(expr $num1 + $num2 )
	echo $(expr $num1 - $num2 )
	echo $(expr $num1 \* $num2 )
	echo $(expr $num1 / $num2 )
	echo $(expr $num1 % $num2 )

	#or
	
	num1=20
	num2=5
	echo `expr $num1 + $num2 `
	echo `expr $num1 - $num2 `
	echo `expr $num1 \* $num2 `
	echo `expr $num1 / $num2 `
	echo `expr $num1 % $num2 `


# flot number or desimal numbers

	num1=10.25
	num2=2.5

	echo "$num1+$num2" | bc
	echo "$num1-$num2" | bc
	echo "11.25*2.5" | bc
	echo "scale=2;11.25/2.5" | bc
	echo "11.25%2.5" | bc
	num=5

	echo "scale=2;sqrt($num)" | bc -l #l for mathlibrary, run -> man bc for more
	echo "scale=2;3^3" | bc -l

# The case statement
             
	team=$1 # you have to pass argument's  -> sh test.sh mi or -> sh test.sh cks etc

	case $team in
	    "mi" )
	    echo "$team is govind's favourite";;
	    "rcb" )
	    echo "$team is favourite of kapil and nakul shriOm";;
	    "cks" )
	    echo "$team is Deepak's favourite";;
	    * )
	    echo "NO one like $team , in my friend circule";;

	esac

	#or

	echo -e "entere any string : \c"
	read str

	case $str in
	    [a-z] )
	    echo "$str is b/w a to z";;
	    [A-Z] )
	    echo "$team is b/w A to Z";;
	    ? )
	    echo "$team is a charactor";;
	    * )
	    echo "enter some specific value";;

	esac

#array variable

	#use ./test.sh to run 
	os=('ubuntu' 'kali' 'windows')
	os[3]='mac'

	echo "${os[@]}" # to pring all elements of array
	echo "${os[0]}"
	echo "${!os[@]}" #index of array
	echo "${#os[@]}" # length of array
	
	#OR

	os=('ubuntu' 'kali' 'windows')
	os[5]='mac'  #add element at index 5

	unset os[2]  # to remove element
	echo "${os[@]}" # to pring all elements of array
	echo "${os[5]}"
	echo "${os[3]}"  #it gives nothing 
	echo "${!os[@]}" #index of array
	echo "${#os[@]}" # length of array

	str=abcdefgh
	echo "${str[@]}" 
	echo "${str[0]}" #same string
	echo "${str[1]}" #it gives nothing

#while loop

	n=1
	while [ $n -le 10 ] 
	do 
	    echo "$n"
	    n=$(($n+1))
	done

	#or Use -> ./test.sh to run 

	n=1
	while (( $n <= 10 ))   
	do 
	    echo "$n"
	    n=$(($n+1))
	done 

	# to sleep use -> ./test.sh and also change mode of file -> chmod +x test.sh

        n=1
	while (( $n <= 10 ))   
	do 
	    echo "$n"
	    (( n++ ))
	    sleep 1   #to sleep for one second 
	done 

# To open terminal

	n=1
	while (( $n <= 3 ))   
	do 
	    echo "$n"
	    (( n++ ))
	    sleep 1   #to sleep for one second
	    gnome-terminal & 
	done 
        
        # To open xterm which is also a terminal

        
        
        n=1
	while (( $n <= 3 ))   
	do 
	    echo "$n"
	    (( n++ ))
	    sleep 1   #to sleep for one second
	    xterm & 
	done 
# Read a file content in Bash

	while read p
	do 
	      echo "this is content of file"
	      echo $p
	done < test.sh # content of test.sh will goto while loop as an input

	#OR

	cat test.sh | while read p  # content of test.sh will goto while loop as an input using pipeline
	do 
	    echo $p
	done
        
        #OR

        while IFS= read -r p  # we are assign space to ifs, it is internal field separator
	do 
        echo "this is content of file"
        echo $p
        done < /etc/locale.gen

#until loop

	n=1
	until [ $n -ge 11 ]
	do
	   echo $n
	   n=$(($n+1))
	done

# for loop

	for i in 1 2 3 4 5 6
	do
	    echo $i
	done

	#OR

	for i in {1..13} # don't use variable like {1..$n}
	do 
	echo $i
	done

	#OR

	echo $BASH_VERSION
	for i in {1..13..2} # {start..end..increment} but bash version should be greater then 4.0
	do 
	echo $i
	done

	#OR

	for (( i=0; i<10; i++))
	do 
	    echo $i
	done

# for loop with more example

	for command in cal pwd ls date
	do
	   echo "----------$command-----------"
	   $command
	done

	# OR

	for item in *
	do
	    if [ -d $item ]
	    then
	    echo $item
	    fi
	done

# select loop

	select char in apple boy cat dog
	do
	   echo $char "is selected"
	done

	#OR

	select char in apple boy cat dog
	do
	    case $char in 
	    a )
	    echo "$char is selected";;
	    b )
	    echo "$char is selected" ;;
	    c )
	    echo "$char is selected" ;;
	    d )
	    echo "$char is selected" ;;
	    * )
	    echo "please selected correct value"
	    esac
	done

# break and continue

	echo -ne "enter the length of array : "
	read n
	echo -e "enter an array element:\c"
	read -a array
	echo -e "enter element which you want to find \c"
	read x

	for (( i=0; i<n; i++))
	do  
	    if [ ${array[i]} -eq 0 ]
	    then 
		echo "value is zero"
		continue
	    fi
	    
	    if [ ${array[i]} -eq $x ]
	    then 
		echo "elemnt found at index $i"
		break
		
	    fi
	    echo $i
	done

# function 

        #to find factorial
	echo -ne "enter the number  : "
	read n
	ans=1
	function fact(){
	    temp=$1
	    if [ $temp -eq 0 ]
	    then 
		echo $ans
		exit
	    fi
	    ans=$(($ans*$temp))
	    temp=$(($temp-1))
	    fact $temp
	}
	fact $n

# local variable

	function printf(){
	    name=$1
	    echo "$name in function"
	}
	name="Deepak"

	echo "$name before function call"

	printf bep

	echo "$name after function call"

	# in previous bep overwritten on Deepak so we have to declare name variable as local in function printf

	function printf(){
	    local name=$1
	    echo "$name in function"
	}
	name="Deepak"

	echo "$name before function call"

	printf bep

	echo "$name after function call"

# readonly command

	printf()
	{
	    echo "hello"
	}
	var=10
	readonly -f printf
	readonly var
	var=50
	echo $var
	printf() 
	{
	    echo "world"
	}

#trap and singal

	trap "echo Exit singal is detected" SIGINT # we can use 2 in place of Sigint. sigint use for interupt when ctrl+c is pressed, for more run -> man 7 signal

	echo "processID is $$"

	while (( COUTN < 10 ))
	do 
	    sleep 4
	    (( COUNT ++ ))
	    echo $COUNT
	done
	exit 0

	#OR

	trap "echo Exit singal is detected" SIGKILL #trap can't catch sigkill and sigstop command 
        #use ctrl+z to stop it
	echo "processID is $$"

	while (( COUTN < 10 ))
	do 
	    sleep 4
	    (( COUNT ++ ))
	    echo $COUNT
	done
	exit 0

	#OR

	trap "mkdir tes.txt && echo directory is created" 0 2 15 # 2 sitint ,15 sigterm for more ->> man 7 signal
	echo "processID is $$"

	while (( COUTN < 10 ))
	do 
	    sleep 4
	    (( COUNT ++ ))
	    echo $COUNT
	done
	exit 0     # to remove trap use ->> trap - 0 2 15

#How to debug a bash script 
	# there are three way to debug a bash script
	# 1st
	# run your script using this command ->>>bash -x ./test.sh
        # 2nd
	# in the first line of cod write
	#  '''#!/bin/bash -x'''
        
	#!/bin/bash -x
	trap "mkdir tes.txt && echo directory is created" 0 2 15 
	echo "processID is $$"

	while (( COUTN < 10 ))
	do 
	    sleep 4
	    (( COUNT ++ ))
	    echo $COUNT
	done
	exit 0 
        
        #3rd use 'set -x' and 'set +x'

	trap "mkdir tes.txt && echo directory is created" 0 2 15 # 2 sitint ,15 sigterm for more ->> man 7 signal
	echo "processID is $$"


	while (( COUTN < 10 ))
	do  
	    set -x
	    sleep 4
	    (( COUNT ++ ))
	    set +x
	    echo $COUNT
	done
	exit 0     # to remove trap use ->> trap - 0 2 15

