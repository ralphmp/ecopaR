#' @title Parasite abundance
#' @description Abundance of parasites according to Bush et al. (1997).
#' @references
#' Bush, Albert O., Kevin D. Lafferty, Jeffrey M. Lotz, and Allen W. Shostak. 1997. “Parasitology Meets Ecology on Its Own Terms: Margolis et al. Revisited.” The Journal of Parasitology 83 (4): 575. \doi{10.2307/3284227}
#' @return data frame with Mean Abundance, Standard Deviation, and 95% Confidence Intervals.
#' @param x number of parasites by host
#' @importFrom stats sd var
#' @export
#' @examples
#' attach(birdticks)
#' abundance(ticks)



abundance <- function (x) {
  if (!is.numeric(x)){
    stop(paste("Numbers of parasites must be a numeric variable."))
  }
  if (any(!is.wholenumber(x))) {
    stop(paste("Numbers of parasites must be integers."))
  }
  if (any(x < 0)) {
    stop(paste("Numbers of parasites must be positive values."))
  }
  if (sum(x) == 0){
    ab0 <- c(0)
    ab0_sd <- c(0)
    df0 <- data.frame("Mean.Abundance" = ab0, "Standard.Deviation" = ab0_sd, "CI.Lower" == NA, "CI.Upper" == NA)
    return(df0)
  } else {
    x <- x[!is.na(x)]
    ab_mean <- round((sum(x)/(length(x))), digits = 3)
    ab_sd <- round(sd(x), digits = 3)
    ci_l <- ifelse(ab_mean - 1.95996 * (sd(x)/sqrt(length(x))) < 0, 0, round(ab_mean - 1.95996 * (sd(x)/sqrt(length(x))), digits = 3))
    ci_u <- round(ab_mean + 1.95996 * (sd(x)/sqrt(length(x))), digits = 3)
    new_df <- data.frame("Mean.Abundance" = ab_mean, "Standard.Deviation" = ab_sd, "CI.Lower" = ci_l, "CI.Upper" = ci_u)
    return(new_df)
  }
}
