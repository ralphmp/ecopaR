#' @title Parasite intensity
#' @description Intensity of parasites according to Bush et al. (1997).
#' @references
#' Bush, Albert O., Kevin D. Lafferty, Jeffrey M. Lotz, and Allen W. Shostak. 1997. “Parasitology Meets Ecology on Its Own Terms: Margolis et al. Revisited.” The Journal of Parasitology 83 (4): 575. \doi{10.2307/3284227}
#' @return data frame with Mean Intensity and Standard Deviation.
#' @param x number of parasites by host
#' @importFrom stats sd var
#' @export
#' @examples
#' attach(birdticks)
#' intensity(ticks)


intensity <- function (x) {
  if (!is.numeric(x)) {
    stop(paste("Numbers of parasites must be a numeric variable."))
  }
  if (any(!is.wholenumber(x))) {
    stop(paste("Numbers of parasites must be integers."))
  }
  if (any(x < 0)) {
    stop(paste("Numbers of parasites must be positive values."))
  }
  if (sum(x) == 0) {
    i0 <- c(0)
    i0_sd <- c(0)
    dfi0 <- data.frame("Mean.Intensity" = i0, "Standard.Deviation" = i0_sd)
    return(dfi0)
  } else {
    x <- x[!is.na(x)]
    int_mean <- round((sum(x)/(length(x[x != 0]))), digits = 3)
    int_sd <- round(sd(x[x !=0]), digits = 3)
    new_df <- data.frame("Mean.Intensity" = int_mean, "Standard.Deviation" = int_sd)
    return(new_df)
  }
}
