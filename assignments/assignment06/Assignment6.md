# Assignment 6 - Parallelizing Python

**Assigned:** Sunday, October 22nd

**Due Date**: Saturday, October 28th, 10 PM

**Early Submission:** Friday, October 27th, 10 PM

**Branch Name**: `NETID/assignment06`

In this assignment, we will be parallelizing your code from [Assignment 5](https://github.com/adstriegel/cse20289-fa23/blob/main/assignments/assignment05/Assignment5.md).

## Task 1 - Confirm up Your Repo Status

By now, you know the drill.  You should make sure of the following:

* Your `main` branch should contain all of the code from your respective assignments.  
* Your `main` branch should be fully up to date.
* You should be able to see your various commits in the history for your `main` branch.

As with the earlier Python assignments, you may be able to do much of your testing on your local machine and then be able to validate that your code runs correctly on the CSE student machines.   

> Remember: We will test your code on the student machine.  Always make sure to test your code there.  

Make sure that before you get started that everything is squared away.  

1. Look and see what is in your `main` branch on GitHub.  If that is not correct, try to fix it and as appropriate, reach out for help.  
2. Make sure your local repository is current via `git pull`.  
3. Confirm that you are in the `main` branch via `git status`.
4. Create and checkout your branch via `git checkout -b NETID/assignment06`
5. Confirm that you are in the correct branch via `git status`.

## Task 2 - Understanding the Problem

With the last version of the assignment, we did everything sequentially.  On this version of the assignment, we are going to do two things:

* We are going to split our code across two Python files. We are going to put our analysis code in one Python file (`analyze.py`) and the other code for parallelization in a different Python file (`parbeacon.py`). The `parbeacon.py` file is going to invoke code from `analyze.py`.    
* We will also add in mechanisms to capture and measure performance using both shell scripting as well as Python.

### Analyze 

The analysis code (`analyze.py`) should provide support for the following tests:

* Determine if the battery level for a given beacon is low or soon to be low (e.g. anything in the battery level contains low).
* Determine if a beacon has not been seen in the last week (via the last battery update date):
   * Note that the name of the directory effectively tells you the date to use as a reference
   * For instance, if the directory name is 2018-07-11, look to see if the beacon has only been seen more than 7 days prior.
   * You may focus only on the date and ignore the hours / minutes for the purpose of this determination.     

For the purposes of the analysis code, presume that your functions will be called as part of a `map` invocation, e.g. each will only return True or False depending on the item being evaluated.

### Parallelize

The parallization code (`parbeacon.py`) will use the analysis code as part of a process pool. The parallelization code will take in one or more directories as input arguments and provide a list of all beacons for each directory that have a low battery, have not been seen in a week, or satisfy both conditions.

Since we are going to bring in code from a different Python script, you will need to read up on how to bring in a local file.  

The syntax for parallelization will take in at least three arguments:

    ./parbeacon.py N S D0 D1 D2 ...
    
where `N` is the number of processes to use, `S` is the setting for processing the data:

   * `lowbat`: Check for low battery levels only
   * `missing`: Check if a beacon has not been seen for a week or more
   * `missinglow`: Check if a beacons has not been for a week and has a low battery

`D0`, `D1`, `D2` are directories of JSON files in a similar arrangement to the directories that you analyzed in Assignment 5.  There must be at least one directory present with a limit of **ten** directories. Note that the directory name must be formatted as a date (YYYY-MM-DD) to be considered valid.      

Your code should use `map` for the determination of the three processing options and it should call the functions that you wrote for analysis.        

### Measure

The final part will be measure the performance of your Python code.  You will measure the code from two perspectives:

* The total run-time from start to finish.  This will be measured using a shell script (`measure.sh`) and the UNIX `time` command. 
* The time for the three major parts of your code: loading the data, processing the data, and displaying the results. This will be code within your Python script.  

You will need to look up how to measure time in Python for the second part.

## Task 3: Write the Scripts

You should write the two Python scripts and the measurement shell script.

* `analyze.py`: This code should have at least two functions to determine if a beacons has a low battery or has been missing for more than a week.  
   * Note that you may have more than two functions
* `parbeacon.py `: This code should take in the arguments as noted above and should use the `map` function to invoke the functions as appropriate from `analyze.py`.  
   * This code should have a shebang to enable running via `./parbeacon.py`
   * The code should have three parts: loading the data, processing the data via `map`, and reporting the results to stdout. 
   * The code should measure how long each of the three parts take as well.
* `measure.sh`: A shell script that uses the UNIX `time` command.  The script should measure the performance of `parbeacon.py` taking in four full directories (your choice) with 1, 2, or 4 processes. 
   * The script should take in two arguments: the name of the Python script to test and input file with the four directories to process  
   * Put the directories for testing in a file named `measure-in.txt`
   * Discuss and make a small table or list of results in your README.md
   * Note: Do not put the actual data in your repository

Your `parbeacon.py` should also be reasonably robust to bad / improper inputs.

## Extra Credit

Write an alternative version of `parbeacon.py` named `lambeacon.py` that uses lambdas rather than calling the functions from the other file.  Compare and contrast the performance of using lambdas versus `parbeacon.py`.

## Submission

**REMEMBER:** We will only be testing your code on the CSE student machines.  If you choose to develop on your Mac or Windows machine, we will not attempt to replicate your same setup.  Your code will be graded as it runs on the student machine.  

The submission will be the same procedure as past assignments.  That means:

* Create and use the `NETID/assignment06` branch
* Commit early and often as part of the assignment
* When you are done, checkout `main` and merge your branch back into main
* Push your changes when you are absolutely done
* Submit the hash of your final commit via Canvas
* In your `README.md`, feel free to add any additional commentary about what works or does not work with your code. 

Your final submission should contain the following in the `assignment06` subdirectory:

* `README.md`: This includes the results of how fast your code runs under 1, 2, and 4 processes.  That includes the breakout for the total run-time as well as the sub-components of your code (loading, processing, output).  
* `analyze.py`: Your analysis code
* `parbeacon.py`: A Python script that can be run directly via the command prompt and takes in the arguments as noted earlier
   * This should be directly excecutable courtesy of the shebang
* `measure.sh`: Shell script that runs a specific set of measurement cases
   * This should take in two input arguments - the name of the script to test and the file with the data directories for testing 
* `measure-in.txt`: A file containing four directories for usage in testing

## Rubric 

To be added
              



