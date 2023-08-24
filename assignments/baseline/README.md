# Baseline - CSE20289 - Fall 2023 - Assignments

The focus of this document is how to get things set up for assignment submission for CSE 20289 - Systems Programming for Fall 2023.

## Pre-Requisites

* GitHub account
* Git installed on your machine or use the student machines
	* Installed / accessible via a command prompt
* Browse and review the About Git page

## Task 1: Clone the Class Repository

In the first task, we will [clone](https://git-scm.com/book/en/v2/Git-Basics-Getting-a-Git-Repository) the class repository.  Cloning will create a local copy that we can synchronize (pull) updates from the class repository.  The class repository is public meaning that anyone can clone it which is what you will do in this first step.    

You will have read access (clone, pull) to the repository just as any member of the public.  The class repository can be found at the following location:

[https://github.com/adstriegel/cse20289-fa23.git](https://github.com/adstriegel/cse20289-fa23.git)

Before we clone the repository, we should think about where we want to put the repository itself.  Generally, creating a directory somewhere to place your repositories is a good idea.  For instance, a common approach is to create a `repos` directory in the Documents directory.

Go ahead and figure out where you would like your repositories to go either on your local machine or on the ND CSE student machines.

Switch into that particular directory and while in the your repository holding directory, go ahead and clone the repository:

    % cd ~/Documents/repos
    % pwd
    /Users/striegel/Documents/repos
    % git clone https://github.com/adstriegel/cse20289-fa23.git

If you look now in your repository directory, you should now have the repository for the class in the `cse20289-fa23` directory. 

    % ls
    adstriegel.github.io	advos_book   cse20289-fa23		opsys-sp22
    %
    
Go ahead and change into the repository.
 
    % cd cse20289-fa23
    % ls
    README.md	 assignments

From there, you should see the various files that would be visible on the repository website (e.g. browsing to [https://github.com/adstriegel/cse20289-fa23.git](https://github.com/adstriegel/cse20289-fa23.git)).  If you list the files in the directory, you should see all of the respective files as well as the files contained within the various sub-directories.  

The actual magic itself for `git` is in a hidden directory, namely the `.git` directory.  Try changing into that particular directory and looking at the files:

    % cd .git
    % pwd
    /Users/striegel/Documents/repos/cse20289-fa23/.git
    % ls
    FETCH_HEAD  config	 hooks  info  object  refs
    HEAD  description  index	logs	packed-refs
    
We could dive into these files but that is getting a bit weedy.  For now, just know that there is a `.git` directory that contains all of the actual repository data.  The files that you see are all of the ones that actually matter.

If at any time we would like to make sure we are up to date, we simply do a `pull` inside of the repository.  

    % pwd
    /Users/striegel/Documents/repos/cse20289-fa23
    % git pull
    Already up to date.
    
The `git pull` command looks inside the `.git` subdirectory to figure out where the remote repository is and then attempts to pull down any updates from that remote repository.  Since we just cloned the repository, there should not be any updates.  The act of doing a `clone` or `pull` are read-only commands and as such do not require any credentials if the repository is public.    

### Summary - Task 1

At this point, we have now successfully cloned the class repository.  You should periodically make sure to pull (e.g. sync) to make sure that everything is up to date.  You will not be directly editing files in the class repository, only using those files for copying out and / or starting a new assignment.

### Bonus - Task 1

You can find this very file in the repository as well.  Browse to the `assignments\baseline` sub-directory and look for the `README.md` file.  Feel free to inspect how many times this particular file has been modified.



 

 

   


   

 