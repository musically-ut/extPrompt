extPrompt
=========

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

I often find myself accidentally starting a R command without realizing how long it will take to execute. Only after the command has been running for some arbitrary time do I realise that I should have at least wrapped it inside a `system.time` to determine how long it takes for the command to run. 

This plugin solves the problem by because by merely looking at the time-stamps on the R console, I can make a good estimate of how long each command ran for.
