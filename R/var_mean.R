#' @title Variance/mean ratio
#' @description  Aggregation Index - Variance/mean
#' @param x number of parasites by host
#' @export
#' @examples
#' attach(birdticks)
#' var_mean(ticks)


var_mean <- function(x) {
  if (!is.numeric(x)){
    stop(paste("Number of parasites must be a numeric variable."))
  }
  if (any(x < 0)) {
    stop(paste("Number of parasites must be positive values."))
  }
  if (any(!is.wholenumber(x))) {
    stop(paste("Numbers of parasites must be integers."))
  }
  if (sum(x) == 0) {
    return(NA)
  } else {
    I <- round(var(x)/mean(x), digits = 3)
    return(I)
  }
}

