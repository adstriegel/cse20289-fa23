#!/bin/sh
# Example Base: https://www.cyberciti.biz/faq/unix-howto-read-line-by-line-from-file/

# How To Run
#
#  sh getrepos.sh REPOFILE
#
# Run this script where you wish to fetch all of the student repositories

# Pre-Requsities
#
# This script assumes that you have password-less login setup via your ssh config file
# and that all repositories have been shared with you as a collaborator

printf 'Checking for missing %s\n' "$2"
printf '\n'

#
# Each input line divided into fields separated by a colon (,) character  
# 
while IFS=, read -r FldFN FldLN FldNetID FldGitID FldURL; 
do
    # Example on how to output the ID and stringt length
    # printf 'ID: %s has a URL of length %s\n' "$FldNetID" "${#FldURL}"

    # If the length is greater than or equal to two, that means that this is
    # likely a valid URL
    if [ "${#FldURL}" -ge 2 ]; 
    then
        #printf 'Repository URL: %s\n' "$FldURL"

        # Skip the first line
        if [ "$FldNetID" = "NetID" ];
        then
            continue
        fi

        DirCorrect="student-cse20289-fa23-$FldNetID"
        #echo $DirCorrect
        
        if [ ! -d "$DirCorrect" ];
        then
            printf ' No repository yet for %s\n' "$FldNetID"
            FetchURL="git@github.com:$FldGitID/$DirCorrect"
            printf ' Git Fetch: %s\n' "$FetchURL"
            git clone $FetchURL
        else
            cd $DirCorrect
            git pull > /dev/null
            cd ..
        fi

        if [ ! -d $DirCorrect/assignments/$2 ];
        then
            printf 'No %s directory for %s\n' "$2" "$FldNetID"
        fi 
    fi
#    fi

done < "$1"

