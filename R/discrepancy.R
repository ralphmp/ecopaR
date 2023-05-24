#' @title Discrepancy index
#' @description  Aggregation Discrepance index according to Poulin (1993).
#' @references
#' Poulin, Robert. 1993. “The Disparity between Observed and Uniform Distributions: A New Look at Parasite Aggregation.” International Journal for Parasitology 23 (7): 937–44. \doi{10.1016/0020-7519(93)90060-C}
#' @param x number of parasites by host
#' @export
#' @examples
#' attach(birdticks)
#' discrepancy(ticks)


discrepancy <- function(x){
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
  } else {
  x <- x[!is.na(x)]
  D <- round(1 - ((2*(sum(cumsum(sort(x)))))/
               (mean(x)*length(x)*(length(x)+1))), digits = 3)
  return(D)
  }
}
