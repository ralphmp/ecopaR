#' @title Saturation deficit
#' @description water stress - saturation deficit using temperature and humidity parameters. Formula according to Randolph and Storey (1999).
#' @references
#' Randolph, Sarah E., and Katie Storey. 1999. “Impact of Microclimate on Immature Tick-Rodent Host Interactions (Acari: Ixodidae): Implications for Parasite Transmission.” Journal of Medical Entomology 36 (6): 741–48. \doi{10.1093/jmedent/36.6.741}
#' @param rh relative humidity in %
#' @param t temperature in Celsius degree
#' @export
#' @examples
#' saturation_deficit(80, 27)


saturation_deficit <- function(rh, t) {
  if (is.na(rh) || is.na(t)) {
    return(NA)
  }
  if (!is.numeric(rh) || !is.numeric(t)) {
    stop(paste("Values must be a numeric variables."))
  }
  if (rh < 0 || t < 0) {
    stop(paste("Values must be positive."))
  } else {
    ((1 - (rh/100))*4.9463*exp(0.0611*t))
  }
}
