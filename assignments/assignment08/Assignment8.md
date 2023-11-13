# Assignment 8 - Will it Blend?

**Assigned:** Monday, November 6th

**Due Date**: Saturday, November 18th, 10 PM

**Early Submission:** Friday, November 17th, 10 PM

**Branch Name**: `NETID/assignment08`

In this assignment, we will be bringing together multiple components that we have discussed in class.  Specifically, we will be doing a blend of Python and C programming whereby we have one process written in Python connected via the network via an approach called ZMQ (Zero Message Queuing) to our C code.  Furthermore, we will also add in requests from a remote web server for the data that will be processed by Python.  

## Task 0 - Update Your Path

We will be adding Prof. Bui's `pythin` installation to your path.  Do this either by modifying your profile script with the following line:

`export PATH=/escnfs/home/pbui/pub/pkgsrc/bin:$PATH`

Alternatively, you can just type this manually:

`PATH=/escnfs/home/pbui/pub/pkgsrc/bin:$PATH`

Check your environmental variables by using `env`.  You will know this works by running the Python code in the examples directory.  If it runs, you are good to go.  

## Task 1 - Square Away Your Repo

You know the drill.  If you need a quick recap, see [Assignment 7](https://github.com/adstriegel/cse20289-fa23/blob/main/assignments/assignment07/Assignment7.md).

## Task 2 - Understanding the Assignment

Up until now, we have written various one off scripts but have yet to try to put things together into a bigger "system".  With Assignment 8 and Assignment 9, we are now going to bring multiple parts together across multiple sets of code.

The challenge when we try to bring multiple sets of code together, particularly across languages, is how we connect the two code bases together.  For that purpose, we will be using a simplified messaging protocol that allows us to communicate between two processes using network sockets.  Whereas socket-based programming can be challenging, we will be using a particular package called [ZMQ - Zero Message Queuing](https://zeromq.org). ZMQ takes away many of the "hard" parts of network programming allowing us to easily send messages back and forth between processes.

### The Bigger Picture

Much of the heavy lifting for our system will be done in Python.  We do this because Python has much nicer libraries to help out with processing JSON files and fetching data via web requests (HTTP).  

However, we cannot always work in our language of choice and sometimes need to handle various ugly / edge cases.  In that case, we are going be bringing the uglier side using C.

At a high level, we are going to be doing the following.  A user will run the C program.  This C program will take input from the user with regards to what queries to make with respect our set of beacon data.  Since C is not terribly great at parsing JSON, the C code will send the query request via ZMQ to the Python code.

Our Python code will be our "server" that will largely sit and wait for requests from our C client.  Upon receiving a request from the C program, the Python code will either directly answer the query and / or fetch new data from a remote web server.  Requests can include picking which dataset to use (e.g. 2018-01-21), asking for the information for a specific beacon, asking for beacons that have a low battery, or asking for which beacons appear to be missing.  *Hmmm, this seems familiar*

When the Python code resolves the specific request, it will send the data back in a C friendly format (e.g. CSV).  The C code will then display that data back to the user.

So what skills will we be learning on this assignment:

* ZMQ - We will be using ZMQ and network communications to cross between two different processes (one in Python, one in C)
* HTTP - We will be using Python to request data from a remote web server
* JSON - We will be doing more JSON processing for data that comes back from the web server
* CSV - We will once again be converting to a CSV from a JSON but doing this in a way to send from Python to C
* Testing - We will write more automated testing where we will bring in a testing sequence of commands for our C client

### Python Code

As described in lecture, the Python code will effectively do the following in a loop:

1. Wait for a request from the C client via ZMQ
2. Process the request from the C client that asks for one of the following:
   * beacon XXXX - The relevant information for the beacon with factory ID XXXXX
   * lowbat - Get all beacons with low batteries
   * missing - Get all beacons that appear to be missing
3. Send a reply to the C client based on the requested operation that is either `SUCCESS` or `FAILURE - Error Message` or the requested data in a CSV format.
4. Repeat the loop

### C Code

The C code will do something fairly similar:

1. Wait for input from the user
2. Check that the input is valid and send it to the Python code via ZMQ
3. Wait for the response from the Python code
4. Display the result
5. Repeat the loop

The C code is much simpler than the Python code but you will have some freedom to add functionality of your choosing for the code.  

## Task 3 - Small Scale Testing

To start, copy over the contents of Assignment 8 to your private repository.  Remember to use `cp -R`.  

### Task 3a - Get It Working

There are two examples of code in the `example` directory, one that is a client in C and another that is a server in Python.  

You should do the following:

1. Pick a port to use for both of the pieces of code.  Right now, the code uses port 40000.  Offset the 40000 by an appropriate number, e.g. say by 2 or 3 digits from your 900 number.  Make sure to change both the Python code and the C code to use the same port number.
2. Build the C code via `make`
3. In one SSH session, run the Python server.
4. In a different SSH session on the same student machine, run the C client. 

Confirm that a familiar message (`GO`, `IRISH`) properly appears.  

### Task 3b - Add in a Twist

The first time that the Python server gets a request, make a HTTP request to the following address:

`http://ns-mn1.cse.nd.edu/sysprogfa23/assignment08/test/data.json`

You can also see a copy of that data file in the `data` sub-directory.  

Modify the example code to remember that result and use the `Receive` field to send an answer back instead of the hard-coded value.

Confirm that the server is working correctly.

### Task 3c - Twist Again

Modify the code to do the following:

* Confirm that the request contains the text as listed in the `Receive` field.  
   * If it does, send the text in the `Send` field
   * If not, send `Error - Wrong Text - Expected XXX` where `XXX` is what was expected per the `Receive` field
* If the request contains the word `switch`, use the following URL for the data:

`http://ns-mn1.cse.nd.edu/sysprogfa23/assignment08/test/data-switch.json`

* If the request contains the word `switch` again, go back and forth.
* Modify the C code to rely on reading user input
* Run your code directing input from a file containing the following (contained in `input.txt`):

```
GO
switch
GO IRISH GO
switch
GO IRISH GO
switch
GO
GO
switch
GO IRISH GO
exit
```

For instance, you would run the C client as:

`% ./czmq < input.txt`

The challenge is how to know when things are done. In this case, the `exit` command denotes when the client should wrap things up.  `exit` should not be sent but rather should cause the client to correctly unwind and gracefully exit.
    
At this point, you should be able to confirm the following working:

* Starting up a Python ZMQ server
* Running a C ZMQ client
* Sending messages back and forth in the request-reply paradigm
* Fetching web content
* Using that web content in logic
* Processing different commands from the C client that affect the state of the Python server (e.g. `switch`)

## Task 4 - Make It Go

For Task 4, your task is then to make this all go using the information from Task 2 as your guide along with the following information:

* Put your code in a directory named `solution`.  In the `solution` directory, create two sub-directories, `server` for your Python code and `client` for your C code.
* Use a similar port number to the one that you picked for Task 3.  Make sure that the port number is the same for both the server as well as the client, e.g. the client connects to the port on the server.  

When you are finished, you should have the following directory setup:

```
# Your README.md goes here
assignment08/
assignment08/data/
assignment08/example/
assignment08/solution/
# Your Python server
assignment08/solution/server/
# Your C client (.c, Makefile, etc.)
assignment08/solution/client/
```

### Task 4a - Server Behavior (Basic)

* All data for the server can be found underneath:

`http://ns-mn1.cse.nd.edu/sysprogfa23/assignment08/data`

* Your default directory should be `2019-01-21`. This directory contains only one JSON file (`0.json`).
   * Your URL will be: `http://ns-mn1.cse.nd.edu/sysprogfa23/assignment08/data/2019-01-21/0.json`
   * The file is also present in the `data` sub-directory to assist with testing and inspection.   
* The server by default should load the default information on startup.
* The server should process and respond to commands from the client.  All data should be sent in a CSV friendly format and include:
  * `numleft, factory_id, name, battery_level, battery_updated_date, hardware` 
  * `numleft` contains the number of records to go after this record.  With a `beacon XXX` request, this is always zero.  
  * Note that this is the order of the fields - use the actual data
* If the command is not understood, send `FAILURE - ` along with an appropriate error message

### Task 4b - Client Behavior (Basic)

* The client should expect to read information via input.  You can expect that `exit` will cause the client to gracefully exit / quit.
* Your first functionality should be to support the `beacon XXX` command where this asks for the information about one specific beacon. 
   * An example valid beacon name is `TESS-STATIC-00716`.  Other valid beacon names are `TESS-STATIC-02526` and `TESS-STATIC-00623`.  
   * The returned information should be in a CSV-friendly format 
   * For the client, simply print the information as received from the server

### Tasks 4c, 4d - Server / Client - Multi-Line Queries

* Add in support for the `lowbat` query
* A `lowbat` query may generate more than one "hit"
* The first `lowbat` query will / should return a result.  If there are no low battery results, that should give back a failure.  
* Additional query results will come back by using `more` as a command from the client.  The interaction looks like this:

```
lowbat 
2,XQAZ-FJDZ,Dummy Info,Med-LOW,2017-06-23,Series 10
more
1,ABCD-EFGH,Dummy Dummy,LOW,2017-06-22,Series 10
more
0,AAAA-BBBB,Info Info,LOW,2017-06-21,Series 20
more
FAILURE - No more records
exit
```

Your client should support the following commands that will operate in tandem with the support on the server side:

* `exit`: Gracefully exit.  You may presume that any inputs directed in (e.g. via `<`) will have `exit` as their last line.
* `beacon XXXX`: Request information for one specific beacon (XXX) using the name of the beacon.  You may presume that the beacon name is a continuous string (e.g. no spaces).  
* `lowbat`: Request information on all beacons that have a low battery.  This will generate a counting down list accessible via `more`.  You may presume that a second `lowbat` query (or any other query feature you write - see Task 5) should not occur.
   * Note that means that this would be a command failure, not that it cannot occur.
* `more`: Get the next entry in the list courtesy of a `lowbat` query.
* Any other unsupported command should generate a failure.

It is up to you as to how you deal with commands and state.  Generally, it will be a bit easier to have the Python server deal with such issues and have the C client basically relay what was typed in.  

### Task 5 - Choose Your Features

At this point, the code as robustly written will get you to 85 percent of the potential score.  Your task is then to improve the code and add in functionality that you feel appropriate to get to a higher score.  You may choose whatever you see is fit to get there or simply call it good at 85 percent.

Examples of potential functionality includes:

* Allow the `beacon` command to match to either the name or the factory ID 
* Improve `lowbat` so that `more` does not need to be continued to be typed by the user.  Do this "under the hood" in the C code, e.g. the user types `lowbat` and only the beacons with low batteries are shown.  
* Add in the ability to `refresh` the JSON information from the web server with a refresh
* Add in the ability to change the directory to a different data directory.  There are several other directories present that you can find in the `extra-data.txt` file in the `data` sub-directory in `assignment08` in the class repository.
* Add in the ability to query for beacon factory IDs using regular expressions.  
* Add in the `missing` functionality from Assignment 5.  Use the data of the directory as the reference point.  This should be tracked on the server side.

Justify each feature that you add in your `README.md` along with a proposed point value for the feature.

## Submission

**REMEMBER:** We will only be testing your code on the CSE student machines.  If you choose to develop on your Mac or Windows machine, we will not attempt to replicate your same setup.  Your code will be graded as it runs on the student machine.  

The submission will be the same procedure as past assignments.  That means:

* Create and use the `NETID/assignment08` branch
* Commit early and often as part of the assignment
* When you are done, checkout `main` and merge your branch back into main
* Push your changes when you are absolutely done
* Submit the hash of your final commit via Canvas
* In your `README.md`, feel free to add any additional commentary about what works or does not work with your code. 
* Your `README.md` should thoroughly document what if anything that you have done for Task 5.  





 



