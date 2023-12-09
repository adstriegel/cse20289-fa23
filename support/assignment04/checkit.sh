# !/bin/sh

# Grading script for Assignment 4

# Arguments:
#    checkit.sh NETID  

if [[ $# -ne 1 ]]; then
    echo "Usage: checkit.sh NETID"
    exit 1
fi

# Any second argument disables shell script testing
if [[ $# -ne 2 ]]; then 
    TestShell=1
else
    TestShell=0
fi

# Extract the NetID from the argument
NetID=$1

DirRepo="student-cse20289-fa23-$NetID"

InData=input/assignment04

OutFile=scoring/assignment04/$NetID-Score.txt
OutputFile=scoring/assignment04/$NetID-Output.txt

RelPathStudent=$DirRepo/assignments/assignment04


# Check if the NETID exists
if [[ ! -d $DirRepo ]]; then
    echo "NETID $1 repository does not exist"
    echo "  Expecting $DirRepo"
    exit 1
fi

# Reset the scoring file for this grading
echo "Assignment 4 - Grading" > $OutFile
echo "Assignment 4 - Grading ($NetID)" > $OutputFile

# Create the top matter
echo "" >> $OutFile
echo "Net ID: $NetID" >> $OutFile   

echo "" >> $OutFile
echo "Base Points: 50" >> $OutFile



# Check that the assignments directory is present
if [[ ! -d $DirRepo/assignments ]]; then
    echo "assignments directory is missing"
    exit 1
fi

# Check that the assignment04 directory is present
if [[ ! -d $DirRepo/assignments/assignment04 ]]; then
    echo "assignment04 directory is missing"
    exit 1
fi

# Check that the scoring directory exists
if [[ ! -d scoring ]]; then
    echo "Scoring directory does not exist - creating"
    mkdir scoring 
fi

# Check that the scoring/assignment04 directory exists
if [[ ! -d scoring/assignment04 ]]; then
    echo "Assignment scoring directory does not exist - creating"
    mkdir scoring/assignment04 
fi



echo "" >> $OutFile
echo "=== Manual Inspection ===" >> $OutFile 
echo "" >> $OutFile

echo "X / 2 pts - No intervention required for the submission" >> $OutFile

echo "X / 1 pt - Right information in README.MD" >> $OutFile

echo "" >> $OutputFile
echo "== README.md ==" >> $OutputFile
echo "" >> $OutputFile

if [[ ! -e $RelPathStudent/README.md ]]; then
    echo "* NO README is present *" >> $OutputFile    
else
    cat $RelPathStudent/README.md >> $OutputFile
fi

echo "X / 1 pt - Right information in Canvas (commit hash)" >> $OutFile
echo "X / 1 pt - Evidence of branching" >> $OutFile
echo "X / 1 pt - Three or more commits visible on GitHub" >> $OutFile
echo "X / 2 pts - Inclusion of only the relevant source code / correct usage as needed of .gitignore or selective inclusion of files" >> $OutFile

echo "" >> $OutputFile
echo "== Assignment04 Directory ==" >> $OutputFile
echo "" >> $OutputFile

ls -R -l $RelPathStudent >> $OutputFile

echo "X / 4 pts - Good / well-structured code" >> $OutFile

echo "" >> $OutputFile
echo "== evalbad.sh ==" >> $OutputFile
echo "" >> $OutputFile

if [[ ! -e $RelPathStudent/evalbad.sh ]]; then
    echo "* NO evalbad.sh is present *" >> $OutputFile    
else
    cat $RelPathStudent/evalbad.sh >> $OutputFile
fi

echo "" >> $OutputFile
echo "== evalbad.py ==" >> $OutputFile
echo "" >> $OutputFile

if [[ ! -e $RelPathStudent/evalbad.sh ]]; then
    echo "* NO evalbad.py is present *" >> $OutputFile    
else
    cat $RelPathStudent/evalbad.py >> $OutputFile
fi

echo "" >> $OutFile
echo "=== Task 3a - Shell Script ===" >> $OutFile 
echo "" >> $OutFile

echo "X / 6 pts - Runs correctly across various good inputs" >> $OutFile
echo "X / 2 pts - Handles robustly various bad inputs" >> $OutFile
echo "X / 2 pts - Correctly states top site across a variety of inputs" >> $OutFile

echo "" >> $OutputFile
echo "=== Task 3a - Shell Script ===" >> $OutputFile 
echo "" >> $OutputFile

if [[ ! -e $RelPathStudent/evalbad.sh ]]; then
    echo "* NO evalbad.sh is present *" >> $OutputFile    
else
    chmod +x $RelPathStudent/evalbad.sh
    echo "Test 0" >> $OutputFile
    ./$RelPathStudent/evalbad.sh $InData/test-0.csv >> $OutputFile 2>&1

    echo "Test 1" >> $OutputFile
    ./$RelPathStudent/evalbad.sh $InData/test-1.csv >> $OutputFile 2>&1

    echo "Test 2" >> $OutputFile
    ./$RelPathStudent/evalbad.sh $InData/test-2.csv >> $OutputFile 2>&1

    echo "Test 3" >> $OutputFile
    ./$RelPathStudent/evalbad.sh $InData/test-3.csv >> $OutputFile 2>&1

    echo "Test 4" >> $OutputFile
    ./$RelPathStudent/evalbad.sh $InData/test-4.csv >> $OutputFile 2>&1

    echo "Test 0 (top)" >> $OutputFile
    ./$RelPathStudent/evalbad.sh $InData/test-0.csv top >> $OutputFile 2>&1

    echo "Test 3 (top)" >> $OutputFile
    ./$RelPathStudent/evalbad.sh $InData/test-3.csv top >> $OutputFile 2>&1

    echo "Test 4 (top)" >> $OutputFile
    ./$RelPathStudent/evalbad.sh $InData/test-4.csv top >> $OutputFile 2>&1

    echo "" >> $OutputFile
    echo "* Bad Inputs" >> $OutputFile 2>&1

    echo "No Argument" >> $OutputFile 2>&1
    ./$RelPathStudent/evalbad.sh >> $OutputFile 2>&1

    echo "No File" >> $OutputFile
    ./$RelPathStudent/evalbad.sh $InData/test-5.csv >> $OutputFile 2>&1
fi

echo "" >> $OutFile
echo "=== Task 3b - Python Script ===" >> $OutFile 
echo "" >> $OutFile

echo "X / 6 pts - Runs correctly across various good inputs" >> $OutFile
echo "X / 2 pts - Handles robustly various bad inputs" >> $OutFile
echo "X / 2 pts - Correctly states top site across a variety of inputs" >> $OutFile

echo "" >> $OutputFile
echo "=== Task 3b - Python Script ===" >> $OutputFile 
echo "" >> $OutputFile

if [[ ! -e $RelPathStudent/evalbad.py ]]; then
    echo "* NO evalbad.py is present *" >> $OutputFile    
else
    echo "Test 0" >> $OutputFile
    python3 $RelPathStudent/evalbad.py $InData/test-0.csv >> $OutputFile 2>&1

    echo "Test 1" >> $OutputFile
    python3 $RelPathStudent/evalbad.py $InData/test-1.csv >> $OutputFile 2>&1

    echo "Test 2" >> $OutputFile
    python3 $RelPathStudent/evalbad.py $InData/test-2.csv >> $OutputFile 2>&1

    echo "Test 3" >> $OutputFile
    python3 $RelPathStudent/evalbad.py $InData/test-3.csv >> $OutputFile 2>&1

    echo "Test 4" >> $OutputFile
    python3 $RelPathStudent/evalbad.py $InData/test-4.csv >> $OutputFile 2>&1

    echo "Test 0 (top)" >> $OutputFile
    python3 $RelPathStudent/evalbad.py $InData/test-0.csv top >> $OutputFile 2>&1

    echo "Test 3 (top)" >> $OutputFile
    python3 $RelPathStudent/evalbad.py $InData/test-3.csv top >> $OutputFile 2>&1

    echo "Test 4 (top)" >> $OutputFile
    python3 $RelPathStudent/evalbad.py $InData/test-4.csv top >> $OutputFile 2>&1

    echo "" >> $OutputFile
    echo "* Bad Inputs" >> $OutputFile

    echo "No Argument" >> $OutputFile
    python3 $RelPathStudent/evalbad.py >> $OutputFile 2>&1

    echo "No File" >> $OutputFile
    python3 $RelPathStudent/evalbad.py $InData/test-5.csv >> $OutputFile 2>&1
fi

echo "" >> $OutFile
echo "=== Task 4 - Test Scripts ===" >> $OutFile 
echo "" >> $OutFile

if [[ ! -e $RelPathStudent/test ]]; then
    echo "* NO test directory is present *" >> $OutputFile    
else
    echo "= test directory contents =" >> $OutFile
    ls -R -l $RelPathStudent/test >> $OutputFile 
    echo "" >> $OutFile
fi

echo "= test.sh =" >> $OutputFile

if [[ ! -e $RelPathStudent/test/test.sh ]]; then
    echo "* NO test.sh is present *" >> $OutputFile    
else
    echo "" >> $OutFile
    cat $RelPathStudent/test/test.sh >> $OutputFile
    echo "" >> $OutFile
fi

echo "X / 1 pt - Located in the test sub-directory" >> $OutFile
echo "X / 5 pts - Five different test cases" >> $OutFile
echo "X / 3 pts - Testing sufficiently described" >> $OutFile
echo "X / 1 pt - Works on the shell script" >> $OutFile
echo "X / 1 pt - Works on the Python script" >> $OutFile










