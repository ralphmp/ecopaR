#' @title Negative binomial
#' @description Calculate binomial negative aggregation index. Note that this function is a very simple implementation of \code{\link[fitdistrplus]{fitdist}}  from fitdistrplus package for pragmatic purpose. You can do much more with fitdistrplus.
#' @references
#' Delignette-Muller, Marie Laure, and Christophe Dutang. 2015. “Fitdistrplus: An R Package for Fitting Distributions.” Journal of Statistical Software 64 (4): 1–34. \doi{10.18637/jss.v064.i04}
#' @param x number of parasites by host
#' @export
#' @examples
#' attach(birdticks)
#' k_negative_binomial(ticks)




k_negative_binomial <- function(x) {
  if (any(is.na(x))){
    warning("Missing values were ignored.")
    x <- x[!is.na(x)]
  }
  if (!is.numeric(x)){
    stop(paste("Number of parasites must be a numeric variable."))
  }
  if (any(!is.wholenumber(x))) {
    stop(paste("Numbers of parasites must be integers."))
  }
  if (any(x < 0)) {
    stop(paste("Number of parasites must be positive values."))
  }
  if (sum(x) == 0) {
    return(NA)
  }
  if (length(x) == 1) {
    return(NA)
  } else {
    k <- fitdistrplus::fitdist(x, distr = "nbinom")[[1]][1]
    k <- c(k)
    names(k) <- c("k")
    return(k)
  }
}



#' @export
#' @describeIn k_negative_binomial K from binomial negative inverse
#' @examples
#' attach(birdticks)
#' k_negative_binomial_inverse(ticks)


k_negative_binomial_inverse <- function(x) {
  if (any(is.na(x))){
    warning("Missing values were ignored.")
    x <- x[!is.na(x)]
  }
  if (!is.numeric(x)){
    stop(paste("Number of parasites must be a numeric variable."))
  }
  if (any(!is.wholenumber(x))) {
    stop(paste("Numbers of parasites must be integers."))
  }
  if (any(x < 0)) {
    stop(paste("Number of parasites must be positive values."))
  }
  if (sum(x) == 0) {
    return(NA)
  }
  if (length(x) == 1) {
    return(NA)
  } else {
    inv_k <- (1/(fitdistrplus::fitdist(x, distr = "nbinom")[[1]][1]))
    names(inv_k) <- c("1/k")
    return(inv_k)
  }
}
