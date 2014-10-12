extPrompt
=========

Embed current time in the R prompt.

Usage:

```
library(devtools)
install_github('musically-ut/extPrompt')
library(extPrompt)
```

You can reset the default prefix by any value you want:

```
options(prompt='\033[0;38;5;33m[%H:%M:%S] \033[0m> ')
```

This will, for example, give you a prompt with the time prefixed in blue color.
