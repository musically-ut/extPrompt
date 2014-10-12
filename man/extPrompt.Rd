\name{extPrompt}
\alias{extPrompt}
\title{Embed time in the R prompt}
\description{
  Embeds the current time in \samp{[HH:MM:SS]} format as a prefix in the R
  prompt. The function is called automatically when the package is loaded.
}
\usage{
extPrompt(silent=T)
extPrompt.reset(silent=T)
}

\value{
  NULL.
}

\details{ 
    Calling \code{extPrompt()} will embed the time in the R prompt.

    \code{extPrompt.reset()} will remove the prefix from the prompt. However,
    any occurances of characters which are treated as special by
    \code{strftime} will still be replaced in the prompt.

    The \code{silent} argument supresses the warnings shown if the prefix is
    already present (during \code{extPrompt()}) or is absent (during
    \code{extPrompt.reset()}).
}
\seealso{
\link{strftime}, \link{options}
}
\author{Utkarsh Upadhyay \email{mail@musicallyut.in}}
