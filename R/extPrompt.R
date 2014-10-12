## Package state and interface

default.embed <- "[%H:%M:%S] "
prefix.length <- nchar(default.embed)

extPrompt <- function(silent=F) {
    current.prompt <- options()$prompt
    if (!substr(current.prompt, 1, prefix.length) == default.embed) {
        options(prompt = paste(default.embed, current.prompt, sep = ''))
    } else {
        if (!silent) {
            warning("The default prefix was already present in the prompt")
        }
    }
}

extPrompt.reset <- function (silent=F) {
    current.prompt <- options()$prompt
    if (substr(current.prompt, 1, prefix.length) == default.embed) {
        options(prompt = substring(current.prompt, prefix.length + 1))
    } else {
        if (!silent) {
            warning("The default prefix was not found in the prompt")
        }
    }
}

## Hooks for loading of the package

.onLoad <- function(libname, pkgname) {
    library.dynam("extPrompt", pkgname, libname, local = FALSE)
    .C("extPrompt", PACKAGE="extPrompt")
    extPrompt(silent=T)
}

.onUnload <- function(libpath) {
    .C("extPrompt_unload", PACKAGE="extPrompt")
    library.dynam.unload("extPrompt", libpath)
    extPrompt.reset(silent=T)
}
