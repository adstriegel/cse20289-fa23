#!/bin/sh

# Simple shell script for checking the homework for Assignment 01

# Arguments:
#    checkit.sh NETID  

if [[ $# -ne 1 ]]; then
    echo "Usage: checkit.sh NETID"
    exit 1
fi

# Extract the NetID from the argument
NetID=$1

DirRepo="student-cse20289-fa23-$NetID"

# Check if the NETID exists
if [[ ! -d $DirRepo ]]; then
    echo "NETID $1 repository does not exist"
    echo "  Expecting $DirRepo"
    exit 1
fi

# Check that the assignments directory is present
if [[ ! -d $DirRepo/assignments ]]; then
    echo "assignments directory is missing"
    exit 1
fi

# Check that the assignment01 directory is present
if [[ ! -d $DirRepo/assignments/assignment01 ]]; then
    echo "assignment01 directory is missing"
    exit 1
fi

Score=0

echo "* NETID"

# Check that the assignment01 directory contains the required files
if [[ ! -f $DirRepo/assignments/assignment01/NETID ]]; then
    echo " -> NETID is missing"
else
    echo " +0.5 pt -> NETID is present"    
    Score=$((Score+5))

    if [[ $(cat $DirRepo/assignments/assignment01/NETID) != $NetID ]]; then
        echo " -> NETID does not match"
    else
        echo " +0.5 pt -> NETID matches"    
        Score=$((Score+5))
    fi
fi

if [[ -f $DirRepo/assignments/assignment01/NETID.txt ]]; then
    echo " +0.4 pt -> NETID.txt is present (should be NETID)"    
    Score=$((Score+4))

    if [[ $(cat $DirRepo/assignments/assignment01/NETID.txt) != $NetID ]]; then
        echo " -> NETID does not match"
    else
        echo " +0.5 pt -> NETID matches"    
        Score=$((Score+5))
    fi
fi



echo "* linecount.txt"

if [[ ! -f $DirRepo/assignments/assignment01/linecount.txt ]]; then
    echo " -> linecount.txt is missing"
    Score=$((Score-10))
else
    echo " +0.5 pt -> linecount.txt is present"    
    Score=$((Score+5))

    if [[ -z $(grep -E '429' $DirRepo/assignments/assignment01/linecount.txt)  ]]; then
        echo " -> linecount.txt does not contain 429"
    else
        echo " +0.5 pt -> linecount.txt contains 429"    
    fi
fi

echo "* output-startFile.txt"

if [[ ! -f $DirRepo/assignments/assignment01/output-startFile.txt ]]; then
    echo " -> output-startFile.txt is missing"
else 
    echo " +0.5 pt -> output-startFile.txt is present"    
    Score=$((Score+5))

    # Check if there are 10 lines in the file
    if [[ $(wc -l < $DirRepo/assignments/assignment01/output-startFile.txt) -ne 10 ]]; then
        echo " -> Does not have 10 lines"
    else
        echo " +0.5 pt -> output-startFile.txt contains 10 lines"    
        Score=$((Score+5))        
    fi
fi

echo "* output-endFile.txt"

if [[ ! -f $DirRepo/assignments/assignment01/output-endFile.txt ]]; then
    echo " -> output-endFile.txt is missing"
    Score=$((Score-1))
else 
    echo " +0.5 pt -> output-endFile.txt is present"    
    Score=$((Score+5))

    if [[ $(wc -l < $DirRepo/assignments/assignment01/output-endFile.txt) -ne 20 ]]; then
        echo " -> Does not have 20 lines"
    else
        echo " +0.5 pt -> output-endFile.txt contains 20 lines"    
        Score=$((Score+5))        
    fi
fi

# output-xxd.txt
echo "* output-xxd.txt"

if [[ ! -f $DirRepo/assignments/assignment01/output-xxd.txt ]]; then
    echo " -> output-xxd.txt is missing"
else 
    echo " +0.5 pt -> output-xxd.txt is present"    
    Score=$((Score+5))

    DiffXXD=$(diff $DirRepo/assignments/assignment01/output-xxd.txt key-xxd.txt)

    if [[ -z $DiffXXD ]]; then
        echo " +0.5 pt -> No difference between output-xxd.txt and key-xxd.txt"
        Score=$((Score+5))
    else 
        echo " -> output-xxd.txt did not match"
    fi
fi


# output-reverse.txt
echo "* output-reverse.txt"

if [[ ! -f $DirRepo/assignments/assignment01/output-reverse.txt ]]; then
    echo " -> output-reverse.txt is missing"
else 
    echo " +0.5 pt -> output-reverse.txt is present"    
    Score=$((Score+5))

    # Use grep -c to count the number of lines that match - non-zero means is present
    if [[ -z $(grep -E "student1[0-9].cse.nd.edu" $DirRepo/assignments/assignment01/output-reverse.txt) ]]; then
        echo " -> Does not contain results of reverse lookup"
    else
        echo " +0.5 pt -> output-reverse.txt contains expected value"    
        Score=$((Score+5))        
    fi
fi

echo "* host-ip-mac.csv"

if [[ ! -f $DirRepo/assignments/assignment01/host-ip-mac.csv ]]; then
    echo " -> host-ip-mac.csv is missing"
else 
    echo " +0.5 pt -> host-ip-mac.csv is present"    
    Score=$((Score+5))

    echo "== host-ip-mac.csv =="
    cat $DirRepo/assignments/assignment01/host-ip-mac.csv    
    echo "== end host-ip-mac.csv =="
fi


# out-ls or out-ls.txt
echo "* out-ls"

if [[ ! -f $DirRepo/assignments/assignment01/out-ls ]]; then
    echo " -> out-ls is missing"
else 
    echo " +0.5 pt -> out-ls is present"    
    Score=$((Score+5))

    # Use grep -c to count the number of lines that match - non-zero means is present
    if [[ $(grep -c "$NetID" $DirRepo/assignments/assignment01/out-ls) -eq 0 ]]; then
        echo " -> out-ls does not contain expected values"
    else
        echo " +0.5 pt -> out-ls contains expected values"    
        Score=$((Score+5))        
    fi    
fi

if [[ -f $DirRepo/assignments/assignment01/out-ls.txt ]]; then
    echo " +0.4 pt -> out-ls.txt is present (should be out-ls)"    
    Score=$((Score+4))

    # Use grep -c to count the number of lines that match - non-zero means is present
    if [[ $(grep -c "$NetID" $DirRepo/assignments/assignment01/out-ls.txt) ]]; then
        echo " -> out-ls.txt does not contain expected values"
    else
        echo " +0.5 pt -> out-ls.txt contains expected values"    
        Score=$((Score+5))        
    fi    
    

fi


# mygroup
echo "* mygroup"

if [[ ! -f $DirRepo/assignments/assignment01/mygroup ]]; then
    echo " -> mygroup is missing"
else 
    echo " +0.5 pt -> mygroup is present"    
    Score=$((Score+5))

    if [[ $(cat $DirRepo/assignments/assignment01/mygroup) -ne "notre-dame" ]]; then
        echo " -> mygroup does not contain the right value"
    else
        echo " +0.5 pt -> mygroup contains the correct value"    
        Score=$((Score+5))
    fi
fi


# README.md
echo "* README.md"

if [[ ! -f $DirRepo/assignments/assignment01/README.md ]]; then
    echo " -> README.md is missing"
else 
    echo " +0.5 pt -> README.md is present"    
    Score=$((Score+5))

    if [[ $(grep -c "$NetID@nd.edu" $DirRepo/assignments/assignment01/README.md) -eq 0 ]]; then
        echo " -> README.md does not contain an e-mail address"
    else
        echo " +0.5 pt -> README.md contains e-mail address of $NetID@nd.edu"    
        Score=$((Score+5))
    fi
fi

# Determine if there was branching
#Log=$(git log --graph)

echo "* Git branch named $NetID/assignment01"

cd $DirRepo

if [[ $(git log --graph | grep -c "$NetID/assignment01") -eq 0 ]]; then
    echo " -> No branch detected of $NetID/assignment01"
else
    echo " +1 pt -> Found evidence of branch of $NetID/assignment01"
    Score=$((Score+10))
fi

cd .. 

echo "Submission Score: $Score/10 out of 10.5 points from script grading"

echo ""

echo "Manually Scored Items:"
echo "  No intervention (2 pts)"
echo "  Canvas has right info (1 pt)"
echo "  Host file content (0.5 pt)"






