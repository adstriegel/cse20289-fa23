# Examples - Lecture 4

As appropriate, there will be accompanying examples either here in a specific file or the code as written in lecture will be included.

## Processes

Show me my processes:

    ps
    
Show me all of the processes:

    ps -A
    
Show me all of the processes using BSD syntax:

    ps a
    
Show me processes including usernames:

    ps u
    
Show me processes without needing those processes to be associated with a particular terminal (and include usernames):

    ps ux
    
Show me all processes with usernames:

    ps aux
    
Show me all of the processes that `striegel` is running:

    ps aux | grep striegel
    
> This takes the output of the `ps aux` command and pipes it through the `grep` command to look for the string `striegel`
> 

Show me the top running processes on a machine:

    top
    
Kill a particular process ID (PID 1873):

    kill 1873
    
Kill process ID 1873 with fire:

    kill -9 1873
    
Run a job in the background:

    sleep 60 &
    
> The ampersand is what causes a job to run in the background.

List all jobs:

    jobs
    
Bring a job from the background into the foreground:

    fg
    
Suspend the currently running job:

    ^Z
    
> This means to press Control-Z

Resume a suspended job as if you had started it with &:

    bg
    
Escalate yourself to superuser

    su
    
Do something as the superuser (for just that command):

    sudo more /etc/passwd
    
## Re-Direction

Re-direct `ls` to a particular file:

    ls –l > out-ls.txt
    
Append to that same file with a different command:

    ps aux >> Out-ls.txt
    
Use `tee` to send inputs and outputs multiple directions (output it to a file and to the screen via `less`:

    ls –l | tee out-tee-ls.txt | less  
    
Re-direct output to another command:

    ps aux | grep striegel
    
Find all of the terminals where I am:

    ls -l /dev/pts | grep ${USER}
    
List all files that have my name (owner or name):

    ls -l | grep ${USER}
    
List the value of the user variable:

    echo $USER

Ignore error output:

    # Compare this output 
    ps -XYZ
    # versus this output
    ps -XYZ 2> /dev/null

