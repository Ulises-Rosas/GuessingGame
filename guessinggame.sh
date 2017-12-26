#!/usr/bin/env bash
#File: guessinggame.sh

##files_number stores current number of files, including directories.
files_number=$(ls | wc -l)

##assessment function  will be located into the while loop and 
##only assess if the a input number is lower or greater than the current number of files.
##The equality of both input number and current number of files is assessed by the 
##while loop later on.
function assessment {
	if [[ $1 -gt files_number ]]
	then
		##printf function is used to couple with read function on same line 
		printf "Too high. Please, try it again: "
	else
		###Since this is a two-way function, complete statement (i.e. -lt) 
		##not needed.
		printf "Too low. Please, try it again: "
	fi
}

##program starts by asking this:
echo "How many files are in the current directory? "

##then, a response is expected
##it thereof is become a variable.
read response

while [[ ! $response -eq files_number ]] ##this while loop doesn't stop till 
					 ##statement of equality is reached
do
	##assessment function is used right here and uses the response variable
	assessment $response
	## -r flag is included to request a new guess on same line
	read -r value
	##a new value for response variable is assigned 
	let response=$value
done 

echo "Congratulations! $files_number is the correct one"
