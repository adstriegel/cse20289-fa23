# Baseline - CSE20289 - Fall 2023 - Assignments

The focus of this document is how to get things set up for assignment submission for CSE 20289 - Systems Programming for Fall 2023.

## Pre-Requisites

* GitHub account
* Git installed on your machine or use the student machines
	* Installed / accessible via a command prompt
* Browse and review the About Git page

## Task 1: Clone the Class Repository

In the first task, we will [clone](https://git-scm.com/book/en/v2/Git-Basics-Getting-a-Git-Repository) the class repository.  Cloning will create a local copy that we can synchronize (`fetch`) updates from the class repository.  The class repository is public meaning that anyone can clone it which is what you will do in this first step.    

You will have read access (`clone`, `fetch`) to the repository just as any member of the public.  The class repository can be found at the following location:

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

> Should we `fetch` or should we `pull`, what is the [difference](https://www.geeksforgeeks.org/git-difference-between-git-fetch-and-git-pull/)? The answer is it depends.  `pull` tries basically bring you up to date and to fast-forward merge. That usually is OK but not always if lots of contributors are changing lots of things.  `fetch` takes a kinder, gentler approach. Think of `pull` = `fetch` + `merge`     

### Summary - Task 1

At this point, we have now successfully cloned the class repository.  You should periodically make sure to pull (e.g. sync) to make sure that everything is up to date.  You will not be directly editing files in the class repository, only using those files for copying out and / or starting a new assignment.

### Bonus - Task 1

You can find this very file in the repository as well.  Browse to the `assignments\baseline` sub-directory and look for the `README.md` file.  Feel free to inspect how many times this particular file has been modified.

# Task 2 - Passwordless Login

For your actual assignments, we will be creating a separate repository.  While the class repository is public, your repository will be private, shared only with the TAs.    

> Although GitHub offers the ability to fork a repository (e.g. make a separate / new repository), the availability of a forked repository must be the same as the source repository. For the public class repository, that would mean that any forked repository by you the student would also be public, not exactly what we would like.  There are organizational controls / mechanisms that allow that functionality to change but we are going to try to operate with a largely vanilla usage of GitHub.     

Since creation and pushing require write access, we will first need to set up a passwordless login for GitHub.  Previously, GitHub allowed both password-based and passwordless (keyed) logins.  Since then, passwords have been disabled.  Although we could lean heavy on various GUIs and their usage of authorization tokens (e.g. GitKraken), it does behoove us to learn exactly how a passwordless login would work.  

Basically, we are going to set up to use `git` via SSH using pre-shared keys.  An overview of how this works with GitHub can be [here](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/about-ssh).

1. Generate SSH keys if you don't have them yet:

        # Accept the defaults, don't make a password if you 
        # want to go passwordless
        % ssh-keygen

2. Copy the contents of `~/.ssh/id_rsa.pub` to the SSH Keys section of your GitHub settings page:

    [https://github.com/settings/keys](https://github.com/settings/keys)
    
        # Copy and paste the contents of this file into GitHub
        % cat ~/.ssh/id_rsa.pub

    > The id_rsa.pub file is the public key half.  The private key is also present can be found in the `.ssh` directory as well.  You should never share the private side of the key (hence why it is called the private side).  

3. Edit/create `~/.ssh/config` to use this key with GitHub:

        # Add the following to your config (replace $NETID 
        with your netid)
        % vim ~/.ssh/config
        Host github.com
            User git
            Hostname github.com
            PreferredAuthentications publickey
            IdentityFile /escnfs/home/$NETID/.ssh/id_rsa

    Once this is done, you should be able to do `git` operations without a password. You will need to accept the host key the first time by typing in "yes".  
    
## Task 3 - Creating a repository

For Git, there are two ways to create a repository: initializing a repository and then associating it with a remote repository or creating the remote repository and then cloning it locally.  Generally, using the web for creation tends to be a bit easier.

1. Login to your GitHub account and create a new repository named `student-cse20289-fa23-NETID` where `NETID` is your Notre Dame net ID (e.g. `striegel`). 
2. Go to that repository and make sure that the repository is set as private.
3. Add Professor Striegel and the TAs (adstriegel, WadElla, EamonTracey) as collaborators for your repository.  We will strictly be read-only but we do need access for your private repository.  

Now that we have it created, let's clone your repository then locally.  You should replace `adstriegel` with your GitHub username and the repository name to use your netid.  

    # Example of cloning GitHub assignments repository to 
    # local or student machine
    % git clone git@github.com:adstriegel/student-cse20289-fa23-striegel.git
    remote: Enumerating objects: 3, done.
    remote: Counting objects: 100% (3/3), done.
    remote: Compressing objects: 100% (2/2), done.
    remote: Total 3 (delta 0), reused 0 (delta 0), pack-reused 0
    Receiving objects: 100% (3/3), done.
    % ls
    README.md
    %
    
> We need the username and hostname `git@github.com` to get access to your private repository together with the keys that we set up earlier.

If all goes well, your private repository will have been cloned appropriately (just like the class repository).  

At this point, you should now have two directories underneath your repositories directory, one directory containing the public class repository and the other one containing your private repository.  The class repository should have files while your private repository should be empty outside of a `README.md`.    

## Task 4 - Practice the assignment cadence

For the purposes of this class, you will be the only one editing the code in your repository.  This makes things a bit easier as we do not have to deal with the ugliness of merging whenever someone makes changes to other files or the same file you were modifying.  We will talk about that during class.

For class, we will use branch to effectively allow us to have a split off version relatively to what we are developing (e.g. a specific assignment).  This is a bit extra since you are the only one editing it but branching can be helpful to keep a consistent code base when adding a new feature or working on a partiuclar bug fix. 

> Note that different organizations may have different policies with respect to branching.  

Our normal cadence will be something like the following:

1. Pull the class repository

        % cd cse20289-fa23
        % pwd
        /Users/striegel/Documents/repos/cse20289-fa23
        % git pull
        Already up to date.
        %
2. Switch to the directory with your repository

        % cd ..
        % cd student-cse20289-fa23-striegel
        % git status
        On branch main
        Your branch is up to date with 'origin/main'.

        nothing to commit, working tree clean
        %

3. Create a branch in your repository named `NETID/assignmentXX` where `XX` is the assignment number

		% git branch striegel/assignmentXX
		% git checkout striegel/assignmentXX
		Switched to branch 'striegel/assignmentXX'
		% git status
		On branch striegel/assignmentXX
        nothing to commit, working tree clean

    We can also use the `-b` argument to do it all in one line.

		 % git checkout -b striegel/assignmentXX

3. Do the assignment, making sure to `commit` multiple times along the way.   
4. When complete, check out `main` and then `merge` your branch into the `main` branch.

So, let's try it out.  

1. Switch to your private repository on the command line

        % cd student-cse20289-fa23-striegel
        
2. Check on the status of your repository via `git status`
3. Create a branch named `NETID/assignment00`

        % git checkout -b striegel/assignment00  
4. Make a directory named `assignments` and change to that directory

        % mkdir assignments
        % cd assignments        
5. Copy all of the files from the class repository to your repository

        % cp -R ../../cse20289-fa23/assignments/assignment00 .
        
    This copies the contents of the `assignment00` directory from the class directory (including any subdirectories via the `-R` argument) to this directory.  

6. Switch to the assignment00 directory

        % cd assignment00    
7. Check that there is an empty `README.md` file present.    

        % ls
        README.md
        %
8. Go up to the base of your repository and add all of the files to your repository

        % cd ..
        % cd ..
        % pwd
        /Users/striegel/Documents/repos/student-cse20289-fa23-striegel
        % git add --all 

    This adds all of the initial files to be tracked by `git`.
    
7. Commit the initial versions of the files.

        % git commit -am "Initial commit - assignment00"
        1 file changed, 0 insertions(+), 0 deletions(-)
        create mode 100644 assignments/assignment00/README.md
        
    We have now added and committed the initial versions of the files to our local repository.  At this point, you could push it to the remote repository at GitHub or just keep going, it is up to you.
    
8. Create a new file with a clever messge

        % cd assignments/assignment00
        % echo "Clever message goes here" clever.txt
        
9. Add that new file and commit it.  

    Think about what you want to add and commit.  If you would like, push the changes out to the remote repository. 
    
    > Generally, you will wait to do a `push` until the very end.  For example purposes, we walk through what happens if you try to push a branch.  
    
        % git push
        fatal: The current branch striegel/assignment00 has no upstream branch.
        To push the current branch and set the remote as upstream, use

        git push --set-upstream origin striegel/assignment00
        
        To have this happen automatically for branches without 
        a tracking upstream, see 'push.autoSetupRemote' in 
        'git help config'.       
        %
        
   Oh noes! Let's follow what `git` told us:
   
        % git push --set-upstream origin striegel/assignment00
        Enumerating objects: 11, done.
        Counting objects: 100% (11/11), done.
        Delta compression using up to 8 threads
        Compressing objects: 100% (5/5), done.
        Writing objects: 100% (10/10), 799 bytes | 799.00 KiB/s, done.
        Total 10 (delta 0), reused 0 (delta 0), pack-reused 0 remote: 
        remote: Create a pull request for 'striegel/assignment00' on GitHub by visiting:
        remote:      https://github.com/adstriegel/student-cse20289-fa23-striegel/pull/new/striegel/assignment00
        remote: 
        To github.com:adstriegel/student-cse20289-fa23-striegel.git
        * [new branch]      striegel/assignment00 -> striegel/assignment00
        branch 'striegel/assignment00' set up to track 'origin/striegel/assignment00'.
        %
        
    > As a general aside, it is not uncommon for branches to be more of a local thing.  Think of it like, I need to do some explorations / tinkering on X but I need to be able to flip back and forth to fix things on the main branch.  Remember, as long as you commit things, you can always unwind and fix pretty much anything.  
         
10. Take a look online via GitHub and see if everything is there.  Note that you will need to pick the appropriate branch (not `main`).  
11. If you are done with the assignment, merge your branch back into the main branch.  Switch back to the main branch.  Merge in the branch.  Push the changes to main.  

        % git checkout main
        % git merge striegel/assignment00        
        % git push

Whew! We made it. Using `git` can always be an adventure but hopefully we will get savvier as the semester goes on.

> You may want to avoid pushing while working on a branch altogether.  That is perfectly fine.    

When in doubt, remember a couple of things:

* `git status` can be helpful to remember which branch we are in.
* `git log` will tell you what you have done so far.
* Files are never lost.  As long as you commit it, `git` keeps copies in the local repository.  
 
### Bonus Thoughts - Cross-Machine Synchronization

While it is possible to use a combination of `git push` and `git pull` to move files between machines (e.g. code on your laptop, test on the student machine), this tends to be sub-optimal.  Provided that you remember to `commit` as you do your editing passes, passwordless `scp` tends to work fairly well.  
 

   


   

 