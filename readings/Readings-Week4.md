# Readings - Week 4

**Assigned**: Saturday, September 9th, 2023

For this coming week, we will continue to explore [shell scripting](https://en.wikipedia.org/wiki/Shell_script). This time, however, we will unlock the true power of the [Unix philosophy](https://en.wikipedia.org/wiki/Unix_philosophy) by studying sophisticated [pipelines](https://en.wikipedia.org/wiki/Pipeline_(Unix)) for filtering text. Additionally, we will also learn to wield [regular expressions](https://en.wikipedia.org/wiki/Regular_expression) to create nifty pattern matching tools.

## Readings

The readings for this week are:

* [The Linux Command Line](http://linuxcommand.org/tlcl.php)
   * Chapter 19 - Regular Expressions
   * Chapter 20 - Text Processing
* [RegexOne](https://regexone.com/)

   > Work through the Lessons in the Interactive Tutorial. You can use the [Regexpr](https://regexper.com/) to visualize your regular expressions.
   
## Optional Resources

* [Interactive Regex Tester](https://regex101.com/)
* [Regular Expressions - User Guide](http://zytrax.com/tech/web/regex.htm)
* [Digital Ocean Tutorials](https://www.digitalocean.com/)
   * [Using Grep & Regular Expressions to Search for Text Patterns in Linux](https://www.digitalocean.com/community/tutorials/using-grep-regular-expressions-to-search-for-text-patterns-in-linux)
   * [The Basics of Using the Sed Stream Editor to Manipulate Text in Linux](https://www.digitalocean.com/community/tutorials/the-basics-of-using-the-sed-stream-editor-to-manipulate-text-in-linux)
* [Advanced Bash Scripting - Text Processing Commands](http://tldp.org/LDP/abs/html/textproc.html)
* [The Unix School - Awk & Sed](http://www.theunixschool.com/p/awk-sed.html)
* [Sed - An Introduction and Tutorial](http://www.grymoire.com/Unix/sed.html)
* [Grep - An introduction to grep and egrep](http://www.grymoire.com/Unix/Grep.html)
* [Useful One-Line Scripts for sed](http://sed.sourceforge.net/sed1line.txt)

## Key Points

* What is a regular expression?
* What are common tools that use regular expressions?
* Are there any restrictions on how deep you can pipeline?
* What is `awk`?
* What is `grep`?
* What is `sed`?
* Write out simple pipelining expressions:
   * Convert a string to be echoed to all uppercase
   * Replace every instance in a string of `Hop` with `Pop`
   * Remove any leading whitespaces in a string
   * Given a file, find any numbers that start with 4 and end with 7 