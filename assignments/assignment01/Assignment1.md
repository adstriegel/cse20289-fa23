# Assignment 1 - Shell Basics

**Assigned:** Saturday, August 26th

**Due Date**: Saturday, September 2nd, 10 PM

**Early Submission:** Friday, September 1st, 10 PM

**Branch Name**: `NETID/assignment01`

The focus of this assignment is to work a bit with the shell as to gain experience using `git` as the submission mechanism for the course.  

## Reminders

* As you get started on an assignment, make sure to check what branch you are in.  Ideally, you should be in the `main` branch. Check which branch you are in via the `git status` command.
* Use the naming convention for your branch for the assignment.  Your branch should be named `NETID/assignment01`.  One you have confirmed that you are in the `main` branch, create and check out your branch.  The `git checkout -b NETID/assignment01` command creates a branch and checks out that branch.
* Remember to add files and to make frequent commits. 

## Assignment 1 

1. Create the `assignment01` sub-directory under the `assignments` folder in your private repository.  
    
   You can either copy in from the class repository (which just contains this file) or simply create the directory yourself.  

2. Using `echo`, create a file named `NETID` and put your NetID into that file.  

3. Copy over the `Out-Dump.txt` file from the class repository that is in `assignment01`. 

   > It is up to you if you want to include `Out-Dump.txt` in your repository.  

3. Using `wc -l`, count the number of lines present in `Out-Dump.txt`.  Write that value in a file named `linecount.txt`.

    > You may use a text editor of your choice to populate that particular file.    
   
4. Using re-direction, place the first 10 lines of the `Out-Dump.txt` into a file named `output-startFile.txt`.  

5. Using re-direction, place the last 20 lines of the `Out-Dump.txt` into a file named `output-endFile.txt`.  

6. Copy over the `Test-Small.pcap` file from the class repository.  

   > See above with respect to the file needing to be checked in as part of your repository.  
   
7. Browse the `man` page for `xxd`.  Try to view the first 100 bytes from the `Test-Small.pcap` file.  

8. Using `xxd` with re-direction, place the output of the first 100 bytes into a file named `output-xxd.txt`.     

9. Figure out the IP address for one of the student machines (e.g. `student10.cse.nd.edu`) using `nslookup`.  

10. Do a reverse DNS lookup using `nslookup` on the IP address that you learned about from the previous step.  Place the output of that command into a file named `output-reverse.txt`.

11. While logged into a student machine, run the `ifconfig` command.  Find the MAC address for the machine that is used for Internet access (find the IP address you just looked up, find the hex address after `ether`).  
12. Create a file named `host-ip-mac.csv` where the first line contains the string `host,ip,mac`.  Add two lines with values from **two** of the student machines using a text editor of your choice.

   > Note that you will need to login in to those respective students machines.  `Student10.cse.nd.edu` and `Student11.cse.nd.edu` are two of the machines.     
14. On the student machine, using `ls -l`, determine the name of the group that is associated with all of your files. Re-direct the output of the command to a file named `out-ls`.
15. On the student machine, use the `id` command via `id --group --name` to list the group name that is associated with your username. Create a file named `mygroup` that contains the output from that same command. 
16. Populate the `README.md` in your `assignment01` to contain your name (e.g. Aaron Striegel) and e-mail address.  Add in a note reflecting whether or not you believe you have submitted in time for the extra credit (Friday by 10 PM).

   > There is not a particular format for the `README.md`.  This is entirely up to you.     

That is it for this first assignment.  At this point, you should have multiple files in your `assignment01` sub-directory in your private repository and multiple commits completed.

## Submission

When you are done, switch back to the main branch via `git checkout main` and then merge in your branch via `git merge NETID\assignment01`.  Push your changes out to GitHub. 

> Don't forget to commit prior to doing your merge.  `git` will thankfully remind you.

For the Canvas side of the submission, submit the hash of your last git commit. Use `git log` to get that hash and copy / paste it as the accompanying text for Canvas.  

## Rubric

Note that the rubrics will vary in terms of the level of detail.  For this rubric, most of the files and tasks are relatively straightforward (e.g. the files are either present or not and either contain the right content or not).  

14 points total

* 2 pts - No intervention required for the submission
* 1 pt - `README.md` present and contains the right information    
* 1 pt - Canvas contains the right information
* 1 pt - Correct usage of branching
* 1 pt - Three or more commits are present
* 8 pts - All requested files present and correct

There are no provided test files for this assignment.            