# Assignment 2 - Shell Scripting++

**Assigned:** Sunday, September 3rd

**Due Date**: Saturday, September 9th, 10 PM

**Early Submission:** Friday, September 10th, 10 PM

**Branch Name**: `NETID/assignment02`

In this assignment, we will move a bit beyond entering a set of commands and start to move into creating "useful" commands towards a specific purpose.  For this assignment, that purpose will be to evaluate an actual git repository previously used by Prof. Striegel's research group.

## Task 1 - Set up Your Repo

For this assignment, it is strongly recommended to use your machine.  We will be writing some basic shell scripts so it will generally be a good idea to run the commands and script(s) on the machines where it will be tested.  

It will also likely be a good idea to have more than terminal open as well.  You can login multiple times to the same student machine (or even different ones for that matter) or use the `tmux` tool that we discussed earlier.  

Make sure before you get started that everything is squared away.  

1. Make sure your repository is current via `git pull`.  
2. Confirm that you are in the `main` branch via `git status`.
3. Create and checkout your branch via `git checkout -b NETID/assignment02`
4. Confirm that you are in the correct branch via `git status`.

You may want to read up a bit on the [rebase](https://www.atlassian.com/git/tutorials/rewriting-history/git-rebase) command as well as how to [undo changes](https://www.atlassian.com/git/tutorials/undoing-changes) in git as well. Tagging via @ in the CSE Slack channel can also help with debugging git.    

## Task 2 - Grab the Target Repo

Clone the ScaleBox repository to an appropriate directory, e.g. not in the `assignment02` sub-directory.  

    cd repos
    git clone https://github.com/adstriegel/ScaleBox.git
    cd ScaleBox
    ls

## Task 3 - Inventory the Source Code

Your next task is to figure out how many source code files are present. Do a bit of browsing in the directory manually.  

> You may find it easier to clone the repo to your laptop for this step.  That is OK.  

Write down the different extensions of files that contain source code.  Note that `.xml` and `.txt` files would not be considered source code files.  For the purpose of this assignment, we will not consider a `Makefile` to be source code.  

All of the files created in this step should be in your `assignment02` directory.  

1. Create a file named `src-inventory-TYPE.txt` where type is the source code file type (e.g. `.c`) that contains all of the file names (and the appropriate path) of that type.  For instance, `src-inventory-c.txt` would contain all files of the `.c` type.
2. Create a file in your assignment directory named `src-summary.txt` and list each file type (e.g. `.c`) and a count.    
3. Count the number of lines of code (LOC) present in each type of source code.  Append lines within the `src-summary.txt` file that lists each file type and the number of lines of code, e.g. `LOC (.c): 20481`. 

## Task 4 - Some of These Things Do Not Belong

To borrow a bit from the Sesame Street song, [One of These Things is Not Like the Other One](https://www.youtube.com/watch?v=rsRjQDrDnY8), the repository contains more than source code.  In particular, it contains a couple of things that generally would not be included in a source code repository such as object files and even potentially executables.  

1. Create a sub-directory off of `assignment02` named `inventory` where all of these files will be placed.  
2. Figure out how many object files (`.o`) are present amongst all of the various sub-directories. 
3. Use the same pattern from earlier to create an inventory of all of the object files and create a file named `src-inventory-o.txt` with all of those files.
4. Figure out how to delete all files with the `.o` extension contained within the repository.
5. Using what you applied in Step 1 and Step 2, make sure that your command from Step 3 worked correctly.
6. Read up on the [.gitignore](https://git-scm.com/docs/gitignore) documentation.  Write a proper `.gitignore` file in your repository that would avoid including object files.
7. Copy over the `Makefile` fronm the `ScaleBox` repository to your `assignment02` subdirectory in your repository.  Revise the `clean` label in `Makefile` to use what you did in Step 3.  
8. Look at the `Makefile` and see what is created on a successful compilation.  Are there any outputs from the `Makefile` that should not be present in the repository?  Add that as appropriate to the `.gitignore`.

## Checkpoint

At this point, you should several things in your `assignment02` sub-directory in your `NETID/assignment02` branch that includes:

Your `inventory` sub-directory off of `assignment02` should contain:

* Files named `src-inventory-cc.txt` and `src-inventory-h.txt` containing a list of all files with that type in any of the various sub-directories.   
* A file named `src-count.txt` that contains the number of each type of source code (.cc, .h) and the number of lines of code present in each type.  
* A file named `src-inventory-o.txt` that contains a list of all object files from the ScaleBox repository (prior to you deleting the files)

> If you need to revert things, just do another `git pull` 

Your `assignment02` sub-directory should contain:

* A `.gitignore` that excludes object files and anything else that should be appropriately excluded  
* Modified `Makefile` with a better `clean` label                          

At this point, a commit is probably a good thing if you have not done it already.

# Task 5 - Automate It - Fixed Setting

Write a script named `invrep-fix.sh` that brings together all of the various commands that you did in Tasks 1-4 with a few accommodations and requirements. 

* Your code should have a pre-determined location where to put the repo as downloaded.  Use `~/repos/` as that location.  You may assume that directory (`repos`) already exists.  
* Your code should use the `ScaleBox` repo as its target to clone.
* Place the inventory files (`src-inventory-X.txt`) into a directory off of the `repos` directory named `inventory`. You may also assume that the directory already exists.   
* You can assume that we are only doing an inventory of `.cc`, `.h`, and `.o` files.
* The `src-summary.txt` file may be less elegant than what you created manually earlier.  It is OK if you have multiple lines.  
* You need only count the lines of code of the `.cc` and `.h` files.
* You do not need to do anything with the `Makefile` or `.gitignore`.

This is also a great point to do a `git commit`.  

# Task 6 - Automate It - Variable

Create a copy of your working `invrep-fix.sh` script and name it `invrep.sh`.  Instead of working on a fixed setting, it should take in three arguments that include: (1) The URL of a public GitHub repository, (2) The location where to place the cloned repo, (3) The location where to place the inventory.

Run your script in the following manner:

    sh invrep.sh https://github.com/adstriegel/ScaleBox.git ~/repos ~/inventory

* Your code should operate in the same manner as in Task 5 but now should take in the respective inputs as arguments to the script itself.
* Ideally, your code should make sure that all of the arguments are present.  If the arguments are not present, your script should exit with an error and help message.  
* Your code should make sure that the directory to place the cloned repo is valid. Your script should not run if it is not present.  
* Your code should create the location to place the inventory if it is not already present.    

The code should be quite similar to what you created in Task 5 but now it will operate on the arguments along with additional error checking. 

## Submission

**REMEMBER:** We will only be testing your code on the CSE student machines.  If you choose to develop on your Mac or Windows machine, we will not attempt to replicate your same setup.  Your code will be graded as it runs on the student machine.  

The submission will be the same procedure as with Assignment 1.  That means:

* Create and use the `NETID/assignment02` branch
* Commit early and often as part of the assignment
* When you are done, checkout the main and merge your branch back into main
* Push your changes when you are absolutely done
* Submit the hash of your final commit via Canvas
* In your `README.md`, feel free to add any additional commentary about what works or does not work with your code.  

## Rubric

**Total**: 40 points

### General Mechanics - 6 points

* 2 pts - No intervention required for the submission
* 1 pt - Right information in `README.MD`
* 1 pt - Right information in Canvas
* 1 pt - Correct use of branchin
* 1 pt - Three or more commits

### Manual Operation - 9 points

* 1.5 pts - `.cc` inventory
* 1.5 pts - `.h` inventory
* 1.5 pts - `.o` inventory
* 0.5 pts - `src-count.txt` is present
* 1 pt - Correct LOC for `.cc` files
* 1 pt - Correct LOC for `.h` files
* 1 pt - Correct `.gitignore`    
* 1 pt - Correct modified `Makefile` 


### Automation - Fixed Setting - 16.5 pts

* 1.5 pts - Well commented and structured
* 3 pts - Runs without errors
* 1 pt - Uses `~/repos`
* 1 pt - Uses `inventory`
* 6 pts - Inventories `.cc`, `.h`, `.o` files correctly
* 4 pts - Counts LOC for `.cc` and `.h` files and places result in `src-summary.txt`

### Automation - Variable Inputs - 18.5 pts

* 1.5 pts - Well-commented and structured
* 3 pts - Runs without errors with valid inputs
* 1 pt - Catches missing argument
* 1 pt - Catches repo location being invalid
* 2 pts - Makes / checks inventory location
* 5 pts - LOC / Inventory is correct
* 5 pts - Operates correctly on other public repositories
 


         