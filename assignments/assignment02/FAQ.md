# FAQ - Assignment 2

### Where should I put the output or download the repo as part of my scripts?

There are a couple of choices here.  You are welcome to create a `repos` sub-directory off of your home directory or to create a `repos` directory inside of your repository.  You are also welcome to create an inventory directory inside of your repository.

Do make sure to document what your choice is inside of your repository script.    

If you can avoid it, try not to commit the `ScaleBox` repository once downloaded to your private repository.  You can potentially leverage `.gitignore` to help you out.  


### Do I need to compile or make the downloaded repository?

No, you should modify the Makefile as part of the earlier task to properly remove all object files, ideally with a much more compact command or commands(s).  

Look for the `clean` target inside of the `Makefile`, e.g. what gets invoked when `make clean` is run.  