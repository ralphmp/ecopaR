#' @title Prevalence
#' @description Prevalence of parasites according to Bush et al. (1997).
#' @references
#' Bush, Albert O., Kevin D. Lafferty, Jeffrey M. Lotz, and Allen W. Shostak. 1997. “Parasitology Meets Ecology on Its Own Terms: Margolis et al. Revisited.” The Journal of Parasitology 83 (4): 575. \doi{10.2307/3284227}
#' @return numeric value in %.
#' @param x number of parasites by host
#' @export
#' @examples
#' attach(birdticks)
#' prevalence(ticks)


prevalence <- function (x) {
  if (any(is.na(x))){
    warning("Missing values were ignored.")
    x <- x[!is.na(x)]
  }
  if (!is.numeric(x)){
    stop(paste("Numbers of parasites must be a numeric variable."))
  }
  if (any(!is.wholenumber(x))) {
    stop(paste("Numbers of parasites must be integers."))
  }
  if (any(x < 0)) {
    stop(paste("Numbers of parasites must be positive values."))
  } else {
    prev <- round(((length(x[x != 0])/(length(x)))*100), digits = 3)
    return(prev)
  }
}
