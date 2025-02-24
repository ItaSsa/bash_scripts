#!/usr/bin/env bash
#she bang to take the patern bash from your variable $PATH.

# This file create a project folder with the informed name and create subfolders

# If the project name is missing
if [ "$#" -ne 1 ]; then
    echo "Inform  the path for the new project: like this $0 project_path"
    exit 1
fi

projdir="$PWD/$1"
#echo $projedir

# Check if the directory exists
if [ -d "$projdir" ]; then
   echo "The directory '$projdir' already exists"
   read -p "Do you want recreate the folder?(Y/N)" option
   # Uppercasing
   option=$(echo "$option"| tr "a-z" "A-Z")
   if [ "$option" == "N" ]; then
      echo "Nothing to do.Exiting!"
      exit  1
   else
      # Deleting directory
      rm -r $projdir	  
   fi

fi

# Creating the project scaffolding:
# 1. Project folder and subfoders
mkdir -p "$projdir" "$projdir/app" "$projdir/docs" "$projdir/tests"
# 2. The main.py
touch "$projdir/main.py"
# 3. The readme.md
touch "$projdir/README.md"
echo "Scaffolding for $0 is ok! :) "
 
read -p "Do you want to open VSCode pointing out for the new project?(Y/N)" option
#Uppercasing
option=$(echo "$option"| tr "a-z" "A-Z")
if [ "$option" == "N" ]; then
   echo "Ok. Finishing with success!"
   exit  1
else
   echo "Opening in the VSCODE" 
   #Moving to the project folder
   code $projedir   
fi


