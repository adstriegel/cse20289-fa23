# Assignment 3 - Protect the Castle

**Assigned:** Sunday, September 10th

**Due Date**: Saturday, September 16th, 10 PM

**Early Submission:** Friday, September 15th, 10 PM

**Branch Name**: `NETID/assignment03`

In this assignment, we will create an automated scanner for detecting malicious URLs as well as exfiltrated sensitive data.  You will write a tool that continuously scans a particular directory and evaluates outbound content before it is allowed to be attached to an outbound e-mail.  

## Task 1 - Set up Your Repo

Similar to the last assignment, it is strongly recommended to use the student machines for development and testing.   

As always, you will want to make sure that before you get started that everything is squared away.  

1. Make sure your repository is current via `git pull`.  
2. Confirm that you are in the `main` branch via `git status`.
3. Create and checkout your branch via `git checkout -b NETID/assignment03`
4. Confirm that you are in the correct branch via `git status`.

As needed, you may want to read up a bit on the [rebase](https://www.atlassian.com/git/tutorials/rewriting-history/git-rebase) command as well as how to [undo changes](https://www.atlassian.com/git/tutorials/undoing-changes) in git as well. Tagging via @ in the CSE Slack channel can also help with debugging git.    

## Task 2 - Understanding the Problem

Similar to Assignment 2, we will start out with some manual commands in the terminal as well as smaller test scripts as we begin to understand the problem.

The issue brought to you is that your employer is having issues with archives coming in with malicious URLs (e.g. malware sites) as well as employees still sending sensitive information out via e-mail.  While there are a large number of vendors that provide such services, funding is tight and your boss would like you to help out with a stopgap solution until a contract can be approved for a security gateway.  Your e-mail provider (obviously not Google) has worked out a way to copy all inbound e-mails with archived attachments to a pre-defined set of directories as well as to read a separate set of directories as to whether or not an e-mail is approved (or denied).  

Your assigned task is to build up a proof of concept to do cursory e-mail protection of archived attachmenets on both inbound as well as outbound e-mails.  E-mail attachments will be copied into a `toscan` directory. Attachments that are approved to be received or sent should be placed into an `approved` directory whereas e-mail attachments that should be reviewed should be placed into a `quarantined` directory.  

The e-mail provider will "automatically" copy files into the `toscan` directory.  The extensions for the files are assumed to be marked accurately.          

Your script should do the following:

* Monitor the `toscan` directory for new archives
* If a new archive is detected, extract the archive somewhere  
* Scan any files inside of the archive for any occurrences of malicious sites 
* Scan any files for any occurrences of markings that would deem the content sensitive
* Place the original archive either into the `approved` or `quarantined` directory with the same name
   * For any attachments that are marked to be quarantined, you should include an accompanying `.reason` file (keeping the same original name) that contains the reason for quarantine.  
* Continue to the next archive or if there are no archives for the moment, sleep for one second and repeat the process

### Task 3 - Tinkering

For this part, create a sub-directory named `tinker`.  This is where your code for Task 3 will go.  

### Task 3a - Archive Extraction

Look in the `examples/archives` directory for Assignment 3. There are several example archives present there.  Your code should support the following archives: `.tar`, `.tar.gz`, `.zip`, and `.bz2`.  Figure out the correct tools and their respective invocations.  

> You will not need to handle the case of nested archives, e.g. a `.zip` inside of a `.tar`.  That will be an extra-credit option.  

Write a script named `ae.sh` (Archive Extract) that takes in a filename as its argument and appropriately extracts the content of the file.  It should make sure to do this in a sub-directory named `archive` (creating the directory if necessary).         

> We make a separate sub-directory to extract our files so that it does not clobber any of our scripts that we wish to keep.  For instance, what is the zip file contained a file named `ae.sh` or `sbs.sh` and overwrote our code?  In that case, hopefully you did some `git commit` invocations prior.  

In your later code, you will need to handle the fact that multiple sub-directories may be created as part of the archive extraction process.  In the last project, you got a listing of all of a specific type of file contained within a given path.   

For now, just make sure that you appropriately interpet the extension that is present and extract the file in a sub-directory named `archive`.

You might run your code like this:

    $ pwd
    $ /escnfs/home/striegel/repos/student-cse20289-fa23-striegel/assignments/assignment03/tinker
    $ ls
    ae.sh example-zip.zip
    $ sh ae.sh example-zip.zip
    archive directory is not present .. creating!
    Extracting a zip file via unzip
    $ ls
    ae.sh archive example-zip.zip
    $ cd archive
    $ ls
    Lecture09.pdf
    
A second invocation after copying `example-tar.tar` over might look like this:

    $ ls
    ae.sh archive example-zip.zip example-tar.tar
    $ sh ae.sh example-tar.tar
    archive directory already present - no need to create
    Extract a tar file
    $ ls
    ae.sh archive example-zip.zip example-tar.tar
    $ cd archive
    $ ls
    Lecture09.pdf badsites
    $ cd badsites
    $ ls
    bad-file.eml bad-file2.eml clean-file.eml

The exact specifics of the output are up to you on this command.  We will be checking that your code does the right thing, not so much what you display to the user.  

### Task 3b - Bad Sites

There are several example files placed on-line in the `examples/badsites`  directory.  The files are as follows:

* `badsite-nocmnt-10.csv` : This contains a list of the first 10 bad sites from [URLHaus](https://urlhaus.abuse.ch/) in CSV format without leading comments.
* `badsite-10.csv` : This contains a list of the first 10 bad sites from [URLHaus](https://urlhaus.abuse.ch/) in CSV format with the leading comments as denoted by #.
* `badsite-100.csv` : This contains a list of the first 100 bad sites from [URLHaus](https://urlhaus.abuse.ch/) in CSV format with the leading comments as denoted by #.
* `clean-file.eml` : A clean file that should pass.
* `bad-file.eml` : A file containing a malicious URL.
* `bad-file2.eml` : A second file containing a malicious URL.

Write a script named `sbs.sh` (Search Bad Sites) that takes in the list of bad sites as an argument and the file to search for any of the bad URLs (e.g. http://xxxx).  If no bad URLs are detected, the script should echo CLEAN.  If a bad URL is detected, you should echo out MALICIOUSURL followed by the malicious URL, e.g. MALICIOUSURL, http://xxx.yyy.zzz/.

### Task 3c - Sensitive Files

There are several example files placed on-line in the `examples/sensitive` directory.  The files are as follows:

* `good.txt` : A clean file that does not contain any sensitive information.
* `bad-marking.txt` : A file that trips the `*SENSITIVE*` marker.
* `bad-SSN.txt` : A file that trips the social security number (recall that SSNs have the format of XXX-XX-XXXX).

Write a script named `sf.sh` (Sensitive Finder) that scans a file for sensitive information.  If no sensitive information is detected, the script should echo CLEAN.  If sensitive information is detected, you should echo out SENSITIVE followed by the reason (MARKED SENSITIVE or SSN), e.g. SENSITIVE, MARKED SENSITIVE.

### Task 3d - Bring it Together

Using your existing scripts (`ae.sh`, `sbs.sh`, `sf.sh`), write a script named `aa.sh` (Archive Analyzer) that extracts an archive and then checks any of the files within the respective archive.  It should also appropriately clean up any files extracted (e.g. you should delete the extracted files).    

If everything is good, echo CLEAN.  Otherwise, echo out the first reason that causes the archive to be noted as potentially bad.  Note that only one reason is sufficient and that only need to identify one violation.     

### Task 3 - Wrapping Up

At this point, you should have created the following code in the `tinker` sub-directory:

* `ae.sh` : A script to extract a variety of archives to an `archive` sub-directory (creating the directory if necessary).
* `sbs.sh` : A script to search any file to see if it contains the list of bad sites as specified as one of the input arguments.
* `sf.sh` : A script that checks for potentially sensitive information.
* `aa.sh` : A script that analyzes archives for both bad sites as well as sensitive information.  

You should make sure that you have fully committed all of your respective modifications. 

## Task 4 - Scanning 

Create a sub-directory named `scanner` in your `assignment03`.  

### Task 4a - Feeding the Scanner

Since we do not have the ability to easily feed in files, you will need to write test scripts to copy in files.  Your test scripts should do something like the following:

    Copy an archive to the toscan directory 
    Sleep for a brief period of time (e.g. 1 or 2 seconds)
    Copy the next archive to the toscan directory
    Repeat until done
    
You should write several scripts that copy in files that are both fully good, fully bad, as well as various mixes of files.  Put these support scripts into a `test` directory underneath `scanner`.  

### Task 4b - Automating the Scanner

The final step is to bring everything together to realize the functionality described earlier in the assignment.  

Expanding upon the earlier description, your script named `scanner.sh` should do the following:

* Take in as an argument the following:
   * The directory where content (archives) to scan will be placed (typically `toscan`)
   * The directory to place approved content (typically `approved`)
   * The directory to place quarantined content (typically `quarantined`)
   * A location for a log that appends any decisions made by your script, creating the log if needed
   * The file containing the list of malicious URLs
* Verify that each of the input arguments are correct / viable
* Loop (forever)
   * Look for new files in the directory where new content is placed
   * If there is no new content
      * Sleep for one second and repeat the loop
   * If there is new content
      * Extract the archive in an appropriate location of your choosing
         * If the extraction files, the archive should be quarantined with the reason of `CANNOTEXTRACT`.   
      * Scan the underlying files for malicious URLs
      * Scan the underlying files for sensitive content
      * If either the malicious URL or sensitive content is violated, place the archive into the quarantine location.  Add in a file with the `.reason` extension that contains the reason for quarantine (e.g. if `FA34ECA4.tar.gz` trips an issue, there should be a file named `FA34ECA4.tar.gz.reason` created with the reason.   
      * If the archive passes, place the archive in the `approved` location.         

Your code should continue to loop until exited via Control-C.

A `.reason` file should have the following format:

    Filename
    Reason    
    Trigger

The `Filename` is the file within the archive that triggered your scanner.  The list of reasons are: `CANNOTEXTRACT`, `MALICIOUSURL`, `SENSITIVE`.  The `Trigger` should be the specific triger (the specific URL detected, MARKED SENSITIVE, SSN).    

The log functionality should operate in the following manner:

* Operate in an append manner
* All log entries should be a single line. 
* All entries should have an appropriate date and time.
* Note when the script is started
* Note when the script is exited (you will need to catch the Control-C signal and handle it)
* Note when any archive is processed and the result (APPROVE or QUARANTINE). Include the archive name and the result. 
   * For a clean entry, that should just be DateTime, ArchiveName, APPROVE.
   * For a bad entry, that should echo the reason file together with the clean information on a single line, e.g. DateTime, ArchiveName, QUARANTINE, SENSITIVE, SSN.    

### Task 4c - Extra Credit

If an optional argument of `-ad X` is provided (archive depth), allow for the processing of nested archives. Note that the default value for archive depth is zero and may go up to three deep.  

## Submission

**REMEMBER:** We will only be testing your code on the CSE student machines.  If you choose to develop on your Mac or Windows machine, we will not attempt to replicate your same setup.  Your code will be graded as it runs on the student machine.  

The submission will be the same procedure as with Assignment 2.  That means:

* Create and use the `NETID/assignment03` branch
* Commit early and often as part of the assignment
* When you are done, checkout the main and merge your branch back into main
* Push your changes when you are absolutely done
* Submit the hash of your final commit via Canvas
* In your `README.md`, feel free to add any additional commentary about what works or does not work with your code. You should also note if you are attempting the extra credit.  

## Rubric  

To be added by mid-week 


 
      




      
