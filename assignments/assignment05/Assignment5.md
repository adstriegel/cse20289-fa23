# Assignment 5 - JSON Data Analysis

**Assigned:** Sunday, October 1st

**Due Date**: Saturday, October 7th, 10 PM

**Early Submission:** Friday, October 6th, 10 PM

**Branch Name**: `NETID/assignment05`

In this assignment, we will be analyzing JSON files to identify Bluetooth beacons that need battery replacement.

## Task 1 - Set up Your Repo

For this assignment, you may be able to do much of your testing on your local machine and then be able to validate that your code runs correctly on the CSE student machines.   

> Remember: We will test your code on the student machine.  Always make sure to test your code there.  

As always, you will want to make sure that before you get started that everything is squared away.  

1. Look and see what is in your `main` branch on GitHub.  If that is not correct, try to fix it and as appropriate, reach out for help.  
2. Make sure your local repository is current via `git pull`.  
3. Confirm that you are in the `main` branch via `git status`.
4. Create and checkout your branch via `git checkout -b NETID/assignment04`
5. Confirm that you are in the correct branch via `git status`.

As needed, you may want to read up a bit on the [rebase](https://www.atlassian.com/git/tutorials/rewriting-history/git-rebase) command as well as how to [undo changes](https://www.atlassian.com/git/tutorials/undoing-changes) in git as well. Tagging via @ in the CSE Slack channel can also help with debugging git.    

## Task 2 - Understanding the Problem

For a project that Prof. Striegel's had a few years back named [Tesserae](https://tesserae.nd.edu), the crux of the project was to study the extent to which various ubiquitous computing devices could predict workplace performance. One of the components involved in the study were Bluetooth beacons, specifically a Bluetooth beacon from a company formerly named [Gimbal](https://infillion.com/commerce/beacons/).  

Bluetooth beacons take advantage of Bluetooth Low Energy (aka Bluetooth 4.0) and emit an advertisement several times per second.  For the purpose of the study, the beacons were used to note when individuals were potentially at certain relevant locations (e.g. work).  

Notably, Bluetooth beacons are made to be portable which means that the devices themselves are battery-powered.  Batteries of course run out which can make for fairly substantive challenges in a study where roughly 3,000+ beacons were passed out.  Gimbal did offer a JSON-based API that would allow one to query the status of all of the beacons.  That API was queried via a REST API and returned a set of JSONs with regards to the beacons and their respective states.

Unfortunately, that code has been lost for parsing the JSONs (not really but roll with it for the class purpose) and your task is to write a parser using Python to help take a set of JSONs and to figure out several key aspects including:

* What is the battery level for each and every beacon?
* Which beacons have a medium low or low battery level?  What are the respective factory ID, names, and hardware (model)?
* Which beacons have not been seen for more than N days from a particular input date (e.g. this beacon has not updated its battery level for more than N days so it might need a new battery)?

### Data Format

Each data request from the Gimbal API comes back as a JSON.  Those requests have already been done and are in the form of various `.json` files.  However, the API does not give back all of the data in one HTTP GET request, it gives back a certain number of beacons (a page of data) with each page saved as a number (e.g. `1.json`, `2.json`, `3.json`).  

All of the JSONs for a given day will be saved in a directory and it will be your task to write Python code that takes in a directory for parsing all of the respective JSON pieces of data.  

Each JSON file is essentially an array (list) of dictionaries where each dictionary is the data for a given beacon.  

` [ {Dictionary of Beacon 1}, {Dictionary for Beacon 2} ]`

### Example Files

You are provided with three ZIP files and an Examples directory that has several individual JSON files.  Use the individual JSON files for Task 3 and the zip files for Task 4.

All of the data files are available on Canvas.  

It may be helpful to look for a JSON viewer instead of simply trying to browse the JSON files themselves due to their lack of linefeeds.  

## Task 3 - Parse the Data

Write a Python script named `readBeacons.py` that does the following:

* Takes in an argument for the name of a beacon JSON file
* Validates that the file can be parsed as a JSON
* For each beacon present in the file
   * Display the `factory_id` field
   * Display the `name` field
   * Display the `Hardware` field
   * Display the `battery_level` field
   * Display the `battery_updated_date` field
* Display a count of the total number of beacons present in the file   

For testing, use individual JSON files for this task.

* There are two examples from Lecture 18 via the class repository that can also be used. You can find them in the class repository under lectures / Lecture18 and the files are named `Example-Single.json` and `Example-Double.json`.  You should start with these files.       
* The individual JSON files contain one particular sub-set of the JSON files from the various datasets.  You should work with these files next for validation.
 
## Task 4 - Do the Task

Write a Python script named `checkBeacons.py` that does the following:

* Take in an argument for the name of the directory to process
* Validate that the directory is valid and accessible
* Scan that directory for all JSON files
* Display the number of JSON files
* Display the number of beacons
* If the argument `-lowbat` is include:
  * Output a CSV friendly list containing `factory_id, name, Hardware, battery_level, battery_updated_date` to standard out
* Otherwise, output that same information for all beacons to standard out
   * If `-lowbat` is not an argument, show the information for all of the beacons 

The data files can be found on Canvas in the Files / Assignments / Assignment05 folder.  The `.zip` files contain a directory with 60 to 80 `.json` files.  Each of the `.zip` files is for a particular day.

### Extra Credit

Take in an additional argument as well with your code:

* If the argument `-notseen N RefDate` is given where `N` is the number of days to use and `RefDate` is a valid date, output several blank lines before outputting the same CSV friendly output as earlier, only including any beacons that have not been seen since `N` days prior to `RefDate`

## Submission

**REMEMBER:** We will only be testing your code on the CSE student machines.  If you choose to develop on your Mac or Windows machine, we will not attempt to replicate your same setup.  Your code will be graded as it runs on the student machine.  

The submission will be the same procedure as past assignments.  That means:

* Create and use the `NETID/assignment05` branch
* Commit early and often as part of the assignment
* When you are done, checkout `main` and merge your branch back into main
* Push your changes when you are absolutely done
* Submit the hash of your final commit via Canvas
* In your `README.md`, feel free to add any additional commentary about what works or does not work with your code. You should also note if you are attempting the extra credit

Your final submission should contain the following in the `assignment05` subdirectory:

* `README.md`
* `readBeacons.py`
* `checkBeacons.py`

## Rubric  

### General Mechanics - 10 points

* 2 pts - No intervention required for the submission
* 1 pt - Right information in `README.MD`
* 1 pt - Right information in Canvas (commit hash)
* 1 pt - Evidence of branching
   * Or an appropriate explanation in your README.md or on Canvas 
* 1 pt - More thane one commit visible on GitHub with appropriate commit messages
* 1 pt - Inclusion of only the relevant source code / correct usage as needed of `.gitignore` or selective inclusion of files
* 4 pts - Good / well-structured code

### Task 3 - `readBeacons.py` - 12 pts

* 1 pt - Runs correctly via the shebang
* 3 pts - Displays each of the requested pieces of data (0.5 pts each)
* 6 pts - Runs correctly across various good inputs
* 2 pts - Handles robustly various bad inputs

### Task 4 - `checkBeacons.py` - 14 pts

* 1 pt - Runs correctly via the shebang
* 2 pts - Correctly processes all JSON files in a directory
* 10 pts - Runs correctly across various good inputs
* 4 pts - Handles robustly various bad inputs / bad files
 