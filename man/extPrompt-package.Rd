\name{extPrompt-package}
\alias{extPrompt-package}
\alias{extPrompt}
\docType{package}
\title{
Embed current time in the R prompt
}
\description{
  Embed current time in the R prompt when it is running in interactive mode.
  It does so by treating the \code{options()$prompt} string as a
  \code{strftime} format string. 
}
\details{
  The package contains a C library which replaces the default
  \samp{R_ReadConsole} function. This is the function responsible for reading
  one line of input when R is running in interactive mode.

  If the prompt string after replacement is longer than 256 characters, the
  replacement is silently not done.
 
  \preformatted{
      library(extPrompt)
      options(prompt='[\%H:\%M:\%S'] >')
  }

  See documentation for \code{strftime} to see what formatting options are
  available.
}

\seealso{
\link{strftime}, \link{options}, \link{extPrompt}
}
\author{
Utkarsh Upadhyay <mail@musicallyut.in>
}
\keyword{ package }
