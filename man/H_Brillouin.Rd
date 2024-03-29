% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/brillouin.R
\name{H_Brillouin}
\alias{H_Brillouin}
\title{Brillouin's index of species diversity}
\usage{
H_Brillouin(x)
}
\arguments{
\item{x}{number of each species of parasites by host}
}
\value{
data frame with Brillouin index.
}
\description{
Index that measures the diversity of a collection accoding to
}
\examples{
df <- data.frame("Parasite_1" = c(11, 14, 13, 11, 12),
                 "Parasite_2" = c(103, 920, 678, 181, 410),
                 "Parasite_3" = c(363, 188, 331, 339, 534),
                 "Parasite_4" = c(50, 20, 13, 222, NA))
rownames(df) <- c("Host_A", "Host_B", "Host_C","Host_D", "Host_E")
H_Brillouin(df)
}
\references{
Krebs, C. J. (1999). Species diversity measures. Ecological methodology
}
