#!/bin/bash

# Solution generation code + timing for Assignment 4

echo > OutData.txt

echo '===================' >> OutData.txt
echo 'Output - test-0.csv' >> OutData.txt
{ time python3 eval04.py test-0.csv >> OutData.txt ; } 2>> OutData.txt
echo ' ' >> OutData.txt

echo '===================' >> OutData.txt
echo 'Output - test-1.csv' >> OutData.txt
{ time python3 eval04.py test-1.csv >> OutData.txt ; } 2>> OutData.txt
echo ' ' >> OutData.txt

echo '===================' >> OutData.txt
echo 'Output - test-2.csv' >> OutData.txt
{ time python3 eval04.py test-2.csv >> OutData.txt ; } 2>> OutData.txt
echo ' ' >> OutData.txt

echo '===================' >> OutData.txt
echo 'Output - test-3.csv' >> OutData.txt
{ time python3 eval04.py test-3.csv >> OutData.txt ; } 2>> OutData.txt
echo ' ' >> OutData.txt

echo '===================' >> OutData.txt
echo 'Output - test-4.csv' >> OutData.txt
{ time python3 eval04.py test-4.csv >> OutData.txt ; } 2>> OutData.txt
echo ' ' >> OutData.txt
