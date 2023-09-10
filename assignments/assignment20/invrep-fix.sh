#!/bin/sh

#Setting variable names
Location=~/repos/
Inventory=inventory

#If ScaleBox is not installed, then install it
if ! [ -e $Location/ScaleBox ] 
then
  git clone https://github.com/adstriegel/ScaleBox.git
  mv ScaleBox $Location
fi

#Redirects the total source code files into their respective files
find $Location/ScaleBox -name "*.o" > $Inventory/src-inventory-o.txt
find $Location/ScaleBox -name "*.cc" > $Inventory/src-inventory-cc.txt
find $Location/ScaleBox -name "*.h" > $Inventory/src-inventory-h.txt

#Seeing how many lines of code each source code file contains
echo ".cc: " > $Inventory/src-summary.txt

wc -l $Inventory/src-inventory-cc.txt >> $Inventory/src-summary.txt

echo ".o: " >> $Inventory/src-summary.txt

wc -l $Inventory/src-inventory-o.txt >> $Inventory/src-summary.txt

echo ".h: " >> $Inventory/src-summary.txt

wc -l $Inventory/src-inventory-h.txt >> $Inventory/src-summary.txt


#Finding total lines of code for each source code file
echo "(LOC .cc):" >> $Inventory/src-summary.txt

find $Location -name '*.cc' | xargs wc -l | tail -1 >> $Inventory/src-summary.txt

echo "(LOC .o):" >> $Inventory/src-summary.txt

find $Location -name '*.o' | xargs wc -l | tail -1 >> $Inventory/src-summary.txt

echo "(LOC .h):" >> $Inventory/src-summary.txt

find $Location -name '*.h' | xargs wc -l | tail -1 >> $Inventory/src-summary.txt
