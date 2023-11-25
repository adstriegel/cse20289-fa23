# Assignment 9 - Summarizing the Captures

**Assigned:** Sunday, November 26th

**Due Date**: Wednesday, December 6th, 10 PM

**Early Submission:** Saturday, December 2nd, 10 PM

**Branch Name**: `NETID/assignment09`

On this final assignment, we will look at how we can launch sub-processes via both Python as well as C.  Rather than using ZMQ to send messages, your Python code will directly a system command as well as invoke your C code.  The Python code will be responsible for extracting the archive and then invoking your C code for each potential network capture file.  The C code will be doing the binary analysis on the file to determine if one of two specific binary sequences are present at the start of the potential network file.        

In keeping with the last assignment, the files that we want to check though are stored on a remote web server.  We will use Python code to determine what files are present on the web server, download the archives present in the list, and then to launch our C code to process each of the respective potential network capture files.   

*Note that it is highly recommended that you complete the assignment before the last week - hence the early submission deadline is extended to Saturday, December 2nd*

## Task 1 - Square Away Your Repo

You know the drill.  If you need a quick recap, see [Assignment 7](https://github.com/adstriegel/cse20289-fa23/blob/main/assignments/assignment07/Assignment7.md).

## Task 2 - Understanding the Assignment

For this task, a past student built up a network capture tool that would capture and save packets for one of our *special* network analysis efforts.  The tool create network captures each and every hour and then turn the files into an compressed archive (`.tar.gz`).  Unfortunately, the tool has some bugs so not all of the files are created successfully.  The files are helpfully hosted on a web server and your task is to figure out just how much *good* data is present.

In short, you are responsible for writing a tool suite that visits the archival website and then checks to see if the recorded data is good and if so, just how much of it (how many packets) were captured.  

### Task 2a - The Approach

Python can be quite nifty for operating on text-based files but can sometimes struggle when it comes to operating on binary files.  It is possible to do so but when it comes to interacting with binary files, it is tough to beat C.  

Thus, much like with Assignment 8, we are going to be using a joint Python and C approach.  However, rather than passing messages like we did with ZMQ, we are going to have our Python code orchestrate the effort by taking in a URL and doing the requested analyses.  The C code will be focused on the binary analysis and the good news is, you have already seen that code back in Assignment 7.  This time you will be given a version without bugs focused on the task at hand.   

At a high level, we will be writing a Python script that will access a website to scan for archived / compressed files (`.tar.gz`). For each file that is a potential compressed archive, your Python code will download each of the file(s). Your Python code will then uncompress and extract the archive to a temporary sub-directory and invoke your C code on each of the respective files from the archive.

Your C code will be responsible for two tasks: (1) Checking if the file is a network capture file by having either a big Endian or little Endian version of the magic number at the start of a file; and (2) If the file has that magic number in little Endian format, counting and displaying the number of packets.  If the file is not a network capture, your code should note that fact that the capture went bad.  

## Task 2b - Implementation Efforts

In this assignment, we are going to be building on the following functionalities:

* In your Python code, query a web server URL given as an argument to the Python script
   * The respective URLs for the web server are at `http://ns-mn1.cse.nd.edu/sysprogfa23/assignment09/setNN/` where NN is a number such as `00`, `01`, `02`, etc.  
* In your Python code, scan the list of files provided from the website 
* In your Python code, for each file that is an archive (`.tar.gz`), download the file to a temporary sub-directory of your choosing
   * Note that this is probably a great name to include in your `.gitignore`
* In your Python code, uncompress and extract the archive using the appropriate commands to extract a `.tar.gz` file
   * You will be invoking a UNIX system command   
* In your Python code, pass the name of each file from the archive as an argument and execute your C code
   * You may assume that you only need to analyze one level deep in from the archive  
* Your C code will then need to do the following
   * Determine if a magic number is present
   * If the magic number is present in little endian format, count the number of packets present in the file 
* Once all of the respective files have been analyzed by your C code, clean everything up from your temporary sub-directory
   * Be careful with this one 

## Task 3 - Write the Components

In Task 3, you will the four major parts of the code: (1) Scanning the text from a website for specific sub-strings; (2) Uncompressing and extracting an archive; (3) Scanning a sub-directory for all files present; and (4) Opening a file to look for a specific byte string and counting packets.  

Create a directory named `task3` where you will put your various files for Task 3. A commit after each sub-task is an excellent choice.  Note that for Task 4, you are welcome to reuse as little or as much of the code as you want.  

One way to make your life easier is to put the heavy lifting for your Python code into a function for each sub-task.  

### Task 3a - Scan a URL that Lists Files

By default, the Apache server will return a list of files if there is not a file named `index.html` present or a specific file is not requested. Try it out by opening your web browser to the following URL:

`http://ns-mn1.cse.nd.edu/sysprogfa23/assignment08/test/`

You should see several files present in a list of file names, somewhat similar to the result of a `ls -l` minus various file properties.  

Write a Python test script named `fetcharchive.py` that does the following:

* Take a URL in as the first argument
   * Use `http://ns-mn1.cse.nd.edu/sysprogfa23/assignment09/test/` as your test URL.  Alternatively, you can substitute any of the viable `setNN` values for `test` 
   * You can manually open your browser to those URLs to see what comes back and your code should produce
* Attempt to fetch the content at that particular URL
* Scan the result for any files that end in `.tar.gz`

Once you have this working, add in the following behavior:

* Attempt to download any of the files that end in `.tar.gz` into a sub-directory named `analyze`
   * If necessary, create the sub-directory named `analyze`

Since the `analyze` directory is part of your dynamic or run-time behavior, it makes sense to include that as part of your `.gitignore`.

### Task 3b - Extracting an Archive   

Write a Python script named `extract.py` that does the following:

* Take a file name (`.tar.gz`) in as an argument 
* Uncompress the file using the appropriate tool (e.g. `gunzip`)
   * You will need to run a [system command inside of your Python script](https://www.python-engineer.com/posts/python-execute-system-command/). 
* Extract the resulting archive using the appropriate system tool
   * Note that you may combine uncompressing and extraction depending on which tool invocation you do

The extracted directory should be in the same directory as where the archive was located (e.g. if the archive was in the `analyze` sub-directory, make sure that the archive contents are extracted to a directory located in that same sub-directory).

*Note that there is a fair amount of similarity here to Assignment 3 but this code is only supporting `.tar.gz` files only*

### Task 3c - Enumerating a Directory

Write a Python script named `scanfiles.py` that does the following:

* Take in a directory as an input argument
* List all files present in that directory
* Invoke the system command `stat` on each file

That's it.  

### Task 3d - Scan the Network Capture File

In the class repository under Assignment 9, there is an `example/` sub-directory that contains code for processing a network capture file.  You might recognize much of this code from Assignment 7.  Copy over this code from the class repository to your private repository.  

The code runs without segfaults but you will need to modify it for several aspects that include:

* Have the code expect only a single input - the name of the file including the path to analyze
* Check to see if the file starts with the magic number - if it does not - appropriately display an error
   * `Error: XXXX.txt is not a network capture file.`
   * Note that your error message should only show the file, not the entire path of the file itself.   
* Display the number of packets present in the file
   * Note that the populated `struct FilePcapInfo` likely has what you want 

### Task 3e - Status Check

At this point, you should have the following:

* Three Python files: `fetcharchive.py`, `extract.py`, and `scanfiles.py`
* One C executable: `scanpcap`

## Task 4 - Put it Together

In Task 4, your goal is to put this together.  You should make a new directory named `task4` in your repo where you will put the code.  The code will have both C code as well as one Python script.

Your Python script named `scansite.py` should do the following:

* Take in a URL as an input
* Scan the list of files at the URL to see which ones are `.tar.gz` files
* For each compressed archive present, do the following:
   * Download the compressed archive
   * Uncompress and extract the archive to a sub-directory of your choosing
   * Index the files present in the archive as extracted
   * Invoke your C code on each of the files
   * Clean up the downloaded / extracted archive once analysis is complete

For the purposes of this assignment, you should do each file sequentially.

Your C code should be the code as written in Task 3d and can simply be copied over.  Your C code (Makefile, source files) should be in the same directory.     
     
There are a set of five total examples provided on the website enumerated from `set00` through `set04`.  `set00` contains only a single archive, `set01` contains no archives, `set02` contains two archives, `set03` contains a mix of files, and `set04` contains a mix of files along with invalid packet captures.  There is also a `test` sub-directory present as well.

Make sure your code is appropriately documented, particularly on the Python side.  Your code should also be reasonably robust, tolerating incorrect inputs and displaying appropriate error messages. 

## Submission

**REMEMBER:** We will only be testing your code on the CSE student machines.  If you choose to develop on your Mac or Windows machine, we will not attempt to replicate your same setup.  Your code will be graded as it runs on the student machine.  

The submission will be the same procedure as past assignments.  That means:

* Create and use the `NETID/assignment09` branch
* Commit early and often as part of the assignment
* When you are done, checkout `main` and merge your branch back into main
* Push your changes when you are absolutely done
* Submit the hash of your final commit via Canvas
* In your `README.md`, feel free to add any additional commentary about what works or does not work with your code. 

## Extra Credit

You may add two pieces of functionality for extra credit to your submission.  The extra credit is due at the normal due date.  Note that extra credit will not be graded on late submissions.

### Extra Credit - Use fork / exec - 15 points

Rather than having your Python code do the work of uncompressing, extraction, and invocation on the respective files, move that work to your C code such that the following occurs:

* An additional / optional argument is provided to your Python code where the `-fork` argument is specified in the list of arguments.  
* Modify your C code such that if it is passed in a `.tar.gz` file instead of a directory, it is then responsible for doing the uncompressing and extraction steps. 
   * Use the [following code](https://github.com/remzi-arpacidusseau/ostep-code/blob/master/cpu-api/p4.c) as an example of how to use `fork` and `exec` 

Note that this code should not break your original submission. Denote in your `README.md` that you have completed this extra credit.  

### Extra Credit - Parallelize It - 10 points

Make your code parallelization friendly such that you can use `concurrent.futures` with up to four processes to accomplish the respective tasks.  Note that you may want to make specific sub-directories such that each archive processing is separated.  Also note that controlling output does get a bit more challenging to avoid different efforts clobbering each other.  

You may receive up to five points of extra credit for parallelization and five points of extra credit if you can keep the output reasonably clean while doing four processes. It is up to you as to how best to handle the respective parallelization.    
 
## Rubric

