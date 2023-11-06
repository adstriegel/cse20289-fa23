# Assignment EC - All the Speed

**Assigned:** Sunday, November 5th

**Due Date**: Friday, November 17th, 10 PM

**Early Submission:** None - it is extra credit

**Branch Name**: `NETID/assignmentEC`

In this assignment, you will be attempting to maximize parallelization speed with a fixed allocation of resources (e.g. processors).  We will take a page out of your favorite data (the beacon data) to determine any changes within the block of data.

## Task 1 - Square Away Your Repo

## Task 1 - Confirm up Your Repo Status

By now, you know the drill.  You should make sure of the following:

* Your `main` branch should contain all of the code from your respective assignments.  
* Your `main` branch should be fully up to date.
* You should be able to see your various commits in the history for your `main` branch.

Unlike the past Python assignments and due to the fact that this assignment leans heavily on gcc, gdb, and valgrind, this assignment will best be done directly on the student machines.

Make sure that before you get started that everything is squared away.  

1. Look and see what is in your `main` branch on GitHub.  If that is not correct, try to fix it and as appropriate, reach out for help.  
2. Make sure your local repository is current via `git pull`.  
3. Confirm that you are in the `main` branch via `git status`.
4. Create and checkout your branch via `git checkout -b NETID/assignmentEC`
5. Confirm that you are in the correct branch via `git status`.

## Task 2 - Understanding the Assignment

In Assignment 6, we explored parallelization and multiple Python files in a bit of a contrived scenario.  For this extra credit assignment, we will be doing a much more interesting and real problem.  In short, we want to do the following:

* Take in a regular expression that dictates which directories should be included
* For any given beacon that is present (via the factory ID), determine if any of the values change across any of the directories (e.g. does beacon X have the same battery level on 2018-01-21, 2018-01-22, and 2018-01-24).
   * This will be done for all of the fields that are present in the beacon JSON
* Report out any changes on a per-beacon basis
   * List the field that changed (e.g. latitude) and the unique values that were detected (e.g. Med-LOW, LOW)
   * If a field does not change, it should not be listed under a beacon
   * If none of the fields for a beacon change, you should appropriately note that 
* Do this in a highly parallelized manner using 1, 2, 4, or 8 processors

In short, compute a per-beacon `diff` for any field across any particular date where the selection of directories is done via regular expression.

## Task 3 - Solving the Assignment

Outside of delivering the core output, there are no restrictions on how you load the data, how you store the data, and how you output the result.  Your code should take in as an input the regular expression to use and the maximum number of processors.

Your code probably should use `map` to take advantage of the `concurrent.futures` for scaling to multiple processes.  You do not need to have multiple Python files present.

## Task 4 - Measure It

Once you have your code written, write a test script to measure the speed of your code on at least four directories and with the process count ranging from 1 to 8 processes.  

Share those observations in your README.md.

## Submission

**REMEMBER:** We will only be testing your code on the CSE student machines.  If you choose to develop on your Mac or Windows machine, we will not attempt to replicate your same setup.  Your code will be graded as it runs on the student machine.  

The submission will be the same procedure as past assignments.  That means:

* Create and use the `NETID/assignmentEC` branch
* Commit early and often as part of the assignment
* When you are done, checkout `main` and merge your branch back into main
* Push your changes when you are absolutely done
* Submit the hash of your final commit via Canvas
* In your `README.md`, feel free to add any additional commentary about what works or does not work with your code. 

## Rubric - 25 points

The extra credit assignment is worth up to 25 points of extra credit.  The sophistication of your code, speedup, and documentation in your README will determine the number of awarded extra credit points.    

