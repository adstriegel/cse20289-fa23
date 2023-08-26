# Readings - Week 2

**Assigned**: August 26, 2023

Remember as a general guidance, try to read / skim prior to the lecture on Monday along with reading a bit deeper for the topics relevant to the particular lecture as it approaches.

## Readings

From [The Linux Command Line](https://linuxcommand.org/tlcl.php):

* Chapter 6 - Redirection
* Chapter 7 - Seeing the World as the Shell Sees It
* Chapter 8 - Advanced Keyboard Tricks
* Chapter 9 - Permissions
* Chapter 10 - Processes

You should also try converge on one command-line friendly editor that becomes your go to editor of choice:

* [nano](https://www.nano-editor.org): This text editor is the easiest to get started with, but also has the least amount of features. 

   * [Using Nano](https://www.linode.com/docs/tools-reference/tools/using-nano)
   * [The Beginner's Guide to Nano](http://www.howtogeek.com/howto/42980/the-beginners-guide-to-nano-the-linux-command-line-text-editor/)

* [vim](http://www.vim.org): This text editor has many features such as syntax highlighting, plugins, and even spell checking. That said, it has a steep learning curve due to its foreign keyboard interface.

   * Chapter 12 - A Gentle Introduction to Vi of [The Linux Command Line](https://linuxcommand.org/tlcl.php)
   * [Vim Introduction and Tutorial](https://blog.interlinked.org/tutorials/vim_tutorial.html)
   * [Interactive Vim Tutorial](http://www.openvim.com/tutorial.html)

* [emacs](https://www.gnu.org/software/emacs/): This text editor also has many features (perhaps too many). 

   * [Absolute Beginner's Guide to Emacs](http://www.jesshamrick.com/2012/09/10/absolute-beginners-guide-to-emacs/)
   * [Modern Emacs](https://www.modernemacs.com/)

It is entirely up to you as to your choice of editor.  There are a legion of posts and fights about which is the one true editor ([vim versus emacs](https://en.wikipedia.org/wiki/Editor_war)).  As emacs tends to be a bit heavier weight, generally knowing enough vim is a solid choice as it tends to be present on most systems.

While we want to be reasonably knowledgeable for the class about command-line based editors, it is also entirely OK to embrace excellent IDEs.  Visual Studio Code is amazing and highly recommended.  


## Lectures

For this coming week, we will be focusing on the following topics:

* Monday - Lecture 3
   * Files
   * See Chapters 4, 5 from the Readings for Week 1 from The Linux Command Line
* Wednesday - Lecture 4
   * Processes, I/O Redirection
   * See Chapters 6 and 10 from above 
* Friday - Lecture 5
   * Networking
   * This lecture will be virtual and will give you just enough networking knowledge to get us through the course as required.   

## Key Points

For this week's key points in preparation for the quiz, we will be blending a bit of what we covered last week in lecture and topics that are important for this coming week.

Ideally, you should be able to answer most of the questions prior to the respective lecture.  It may also be helpful to know the answers prior to starting the quiz.  

### From Last Week

* What is the naming convention for your private repository?
* How should you label your branches?
* What are the basic git commands?

### For This Week

* What are the three special files available to a program when it is executed?
* How would you do the following types of redirection:
   * Redirect the contents of a file into a command
   * Redirect the output of a command into a file
   * Append the output of a command to a file
   * Redirect only the error messages
   * Redirect both the error and output
   * Redirect the output of a command into another command
* What is brace expansion? What is pathname expansion?
* What are environmental variables for the shell?
* What is an example of an environmental variable?
* How do we set the value of a variable in bash?
* When we list files via `ls -l`, what do the various outputs mean?
   * Where is the user information?
   * Where is the group information?
   * What does other mean?
* What does it mean to / how do you:
   * Suspend a running command
   * Resume a previously suspended command
   * Indicate the end of input
   * Terminate the process via keystrokes
   * Terminate a process if we know its PID            