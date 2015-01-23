extPrompt
=========

----
**Update**: [Prof. Duncan Temple Lang](http://www.stat.ucdavis.edu/~duncan/), one of the core developers of R, actually [gave a simpler way](https://stat.ethz.ch/pipermail/r-devel/2014-October/069922.html) of achieving the same thing:

```
invisible(addTaskCallback(function(...) { 
                 options(prompt = format(Sys.time(), "[%H:%M:%S] >"))
                 TRUE
                 }))

```

That almost subsumes the functionality of this package, with one minor shortcoming:

> The only difference is that when you hit return at the prompt with no expression,
> the prompt doesn't change (since there was no task).

----

Embed current time in the R prompt.

Usage:

```
library(devtools)
install_github('musically-ut/extPrompt')
library(extPrompt)

# Gives a prompt like:
# [17:08:10] > 
# instead of just:
# >
```

You can reset the default prefix by any value you want:

```
options(prompt='\033[0;38;5;33m[%H:%M:%S] \033[0m> ')
```

This will, for example, give you a prompt with the time prefixed in blue color.

Rationale
=========

I often find myself accidentally starting a R command without realizing how long it will take to execute. Only after the command has been running for some arbitrary time do I realise that I should have at least wrapped it inside a `system.time` to get an idea of how long it takes to run. 

This plugin solves the problem by appending the approximate start time in form of time-stamps to each command. Now by merely looking at the time-stamps on the R console, one can make a good estimate of how long each command ran.
