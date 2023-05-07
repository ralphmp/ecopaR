#' @title Brillouin's index of species diversity
#' @description Index that measures the diversity of a collection accoding to
#' @references
#' Krebs, C. J. (1999). Species diversity measures. Ecological methodology
#' @return data frame with Brillouin index.
#' @param x number of each species of parasites by host
#' @importFrom stats complete.cases
#' @export
#' @examples
#' df <- data.frame("Parasite_1" = c(11, 14, 13, 11, 12),
#'                  "Parasite_2" = c(103, 920, 678, 181, 410),
#'                  "Parasite_3" = c(363, 188, 331, 339, 534),
#'                  "Parasite_4" = c(50, 20, 13, 222, NA))
#' rownames(df) <- c("Host_A", "Host_B", "Host_C","Host_D", "Host_E")
#' H_Brillouin(df)


H_Brillouin <- function (x) {
  x <- x[complete.cases(x),]
  x <- dplyr::select_if(x, is.numeric)
  if (any(!is.wholenumber(x))) {
    stop(paste("Numbers of parasites must be integers."))
  }
  if (any(x < 0)) {
    stop(paste("Numbers of parasites must be positive values."))
  }  else {
    N <- rowSums(x)
    H <- (lfactorial(N) - rowSums(lfactorial(x)))/N
    return(as.data.frame(H))
  }
}

