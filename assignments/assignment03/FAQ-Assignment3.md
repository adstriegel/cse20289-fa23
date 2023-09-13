# FAQ - Assignment 3

## Where should the various directories (toscan, approved, quarantined) be located?

Try to avoid putting them inside of your repository.  Make a directory inside of your home directory, e.g. `~/sysprog` and create sub-directories underneath: `sysprog/toscan`, `sysprog/approved`, `sysprog/quarantined`.  

Remember that the actual scanner itself will take in arguments that specify where the various directories are located.  

## Who cleans up the various directories?

That would be your task and you may want to write a helper script that cleans out your approved and quarantined directories.  
 