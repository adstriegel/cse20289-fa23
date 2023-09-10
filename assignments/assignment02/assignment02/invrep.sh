#!/bin/sh

#if less than 3 command line arguments don't run
if [ $# -lt 3 ]
then
  echo Needs 3 Arguments to run
  exit 1
fi

#making sure that the directory to clone into exists
if ! [ -e $2 ]
then
  echo Not correct name for directory to place repo
  exit 1
fi

#if the $3 argument does not exist then create it
if ! [ -e $3 ]
then
  echo $3
  mkdir $3
fi

#test to see if the scalebox file is already installed, if not, then install it
if ! [ -e $2/ScaleBox ] 
then
  git clone $1 > /dev/null
  mv ScaleBox $2
fi

#Placing all the source code files into their respective names
find $2/ScaleBox -name "*.o" > $3/src-inventory-o.txt
find $2/ScaleBox -name "*.cc" > $3/src-inventory-cc.txt
find $2/ScaleBox -name "*.h" > $3/src-inventory-h.txt

#These four lines send the total lines of code in every source code file and then send it into the src-summary.txt
echo ".o: " > $3/src-summary.txt

wc -l $3/src-inventory-o.txt >> $3/src-summary.txt

echo ".cc: " >> $3/src-summary.txt

wc -l $3/src-inventory-cc.txt >> $3/src-summary.txt

echo ".h: " >> $3/src-summary.txt

wc -l $3/src-inventory-h.txt >> $3/src-summary.txt

#Finding total lines of code for each source code file
echo "(LOC .o):" >> $3/src-summary.txt

find $2 -name '*.o' | xargs wc -l | tail -1 >> $3/src-summary.txt

echo "(LOC .cc):" >> $3/src-summary.txt

find $2 -name '*.cc' | xargs wc -l | tail -1 >> $3/src-summary.txt

echo "(LOC .h):" >> $3/src-summary.txt

find $2 -name '*.h' | xargs wc -l | tail -1 >> $3/src-summary.txt
