# Assignment 4 - Dual Scripting

**Assigned:** Sunday, September 25th

**Due Date**: Saturday, September 30th, 10 PM

**Early Submission:** Friday, September 29th, 10 PM

**Branch Name**: `NETID/assignment04`

In this assignment, we will be comparing shell scripts versus Python.  We will iterate on the same malicious URL file that we saw earlier, writing one version via shell script and the same code in Python.  You will also be using shell scripting to test both versions of your code.

## Task 1 - Set up Your Repo

Similar to the last assignment, it is strongly recommended to use the student machines for development and testing.   

> Remember: We will test your code on the student machine.  As we are doing both shell scripting and Python programming, this assignment is probably best done on the student machines.  

As always, you will want to make sure that before you get started that everything is squared away.  

1. Look and see what is in your `main` branch on GitHub.  If that is not correct, try to fix it and as appropriate, reach out for help.  
2. Make sure your local repository is current via `git pull`.  
3. Confirm that you are in the `main` branch via `git status`.
4. Create and checkout your branch via `git checkout -b NETID/assignment04`
5. Confirm that you are in the correct branch via `git status`.

As needed, you may want to read up a bit on the [rebase](https://www.atlassian.com/git/tutorials/rewriting-history/git-rebase) command as well as how to [undo changes](https://www.atlassian.com/git/tutorials/undoing-changes) in git as well. Tagging via @ in the CSE Slack channel can also help with debugging git.    

## Task 2 - Understanding the Problem

In this assignment, our primary focus is on comparing and quantifying the attributes in files using both shell scripts as well as Python.  Since we are using shell scripts, that implies we will be working with text files.

Your task in this assignment is to use the [full list of malicious URLs](https://urlhaus.abuse.ch/api/) from URLHaus.  For the purpose of this assignment, use the CSV as placed in the class repository in the Assignment 4 directory.  

If you have not done so already, go to your clone of class public repository and do a fresh `git pull` to make sure everything is current.  Use the `BadURL-Full.csv` file as your reference file.  

Your task is to count how many of the malicious URLs contain either an IP address (68.3.2.9) as part of the URL or a domain name (bitbucket.org).  In addition, you should determine the top server with malicious content (IP addresses, domain names) that occur the most in the list (e.g. 68.9.6.3, not http://68.9.6.3/baditem.zip).      

> In the event of a tie, you need only print out one of the top entries.

> You need not distinguish between domain names or IP addresses when determining the top source.       

Your script should be placed in your `assignment04` directory in your repository (e.g. `assignments/assignment04`).  You will also probably want to place the various example CSV files from the public class repository in your repository as well. There are three files in the public repository, a file with 20 entries, a file with 100 entries, and the full file with all malicious URLs.    

Each script should take in either one or two arguments, the file to process and an option to print out the top server name.

    $ ls
    evalbad.sh evalbad.py BadURL-First20.csv
    $ ./evalbad.sh BadURL-First20.csv
    Evaluating bad URL file BadURL-First20.csv
    IP Addresses: 20
    Domain Names: 0
    $ ./evalbad.py BadURL-First20.csv top
    IP Addresses: 20
    Domain Names: 0
    
    Top Malicious Site
    98.9.6.3
    
Note that the above examples are for referece of the output and are not drawn from the files.

Your code should also handle / assist with incorrect input.

    $ ./evalbad.sh
    Need at least one input - file to process
    $ ./evalbad.sh BadURL-NoFile.csv
    Error - BadURL-NoFile.csv does not exist
    
## Task 3 - Write the Scripts

### Task 3a - Shell

Write the solution via shell scripting with your script named `evalbad.sh`.

### Task 3b - Python

Write the solution via Python with your script named `evalbad.py`.

## Task 4 - Test Scripts

Write a test script for evaluating your code.  Your code should show the same results regardless of whether you run the shell script version or the Python version.

Think about what you might want to test:

* What is the correct output across each of the files?
* Could you make a few variations on the files as provided for testing?
* What about errors or incorrect arguments?

Create sub-directory in your `assignment04` directory named `test`.  Write a shell script named `test.sh` takes in as an argument the script to test and run (e.g. `evalbad.sh` or `evalbad.py`).  Put any test files that you might create (e.g. CSVs for input).  

Your test script should test at least five different cases.  

Document your testing script with a `README.md` file in the `test` sub-directory that describes each of the tests that your script conducts.  

> For this part, you do not need to explicitly test the output from your scripts but rather can just echo the output to the screen.  

### Extra Credit

Add in to your testing confirmation of the correct output.  

Tally and present a summary of the number of tests and the number of tests that were passed successfully.  

## Submission

**REMEMBER:** We will only be testing your code on the CSE student machines.  If you choose to develop on your Mac or Windows machine, we will not attempt to replicate your same setup.  Your code will be graded as it runs on the student machine.  

The submission will be the same procedure as with Assignments 2 and 3.  That means:

* Create and use the `NETID/assignment04` branch
* Commit early and often as part of the assignment
* When you are done, checkout `main` and merge your branch back into main
* Push your changes when you are absolutely done
* Submit the hash of your final commit via Canvas
* In your `README.md`, feel free to add any additional commentary about what works or does not work with your code. You should also note if you are attempting the extra credit  

## Rubric  

### General Mechanics - 12 points

* 2 pts - No intervention required for the submission
* 1 pt - Right information in `README.MD`
* 1 pt - Right information in Canvas (commit hash)
* 1 pt - Evidence of branching
* 1 pt - Three or more commits visible on GitHub
* 2 pts - Inclusion of only the relevant source code / correct usage as needed of `.gitignore` or selective inclusion of files
* 4 pts - Good / well-structured code

### Task 3a - Shell - 10 pts

* 6 pts - Runs correctly across various good inputs
* 2 pts - Handles robustly various bad inputs
* 2 pts - Correctly states top site across a variety of inputs

### Task 3b - Python - 10 pts

* 6 pts - Runs correctly across various good inputs
* 2 pts - Handles robustly various bad inputs
* 2 pts - Correctly states top site across a variety of inputs

### Task 4 - Test Scripts - 11 pts

* 1 pt - Located in the test sub-directory
* 5 pts - Five different test cases
* 3 pts - Testing sufficiently described
* 1 pt - Works on the shell script
* 1 pt - Works on the Python script

### Task 4 - Extra Credit - Up to 6 pts

* 5 pts - Test script correctly tests / checks for output
* 1 pt - Summation of results


 