#'  water vapour pressure
#'  Buck equation for vapour pressure of water in mmhg for \code{\link{saturation_deficit_bulb}} and \code{\link{relative_humidity_bulb}}
#' @param t temperature in Celsius degree
#' @keywords internal



buck_vapour_water <- function(t){
  if (!is.numeric(t)){
    stop(paste("Temperature must be a numeric variable."))
  }
  if (any(t < 0)) {
    stop(paste("Temperature must be positive."))
  } else {
  ((0.61121*exp((18.678 - (t/234.5))*(t/(257.14 + t))))/0.133322)
  }
}


#' Test if x is a integer number
#' @param x number to be tested
#' @keywords internal
#' @note function derived from example of \code{\link[base]{integer}} documentation.
#'
#'


is.wholenumber <-
  function(x, tol = .Machine$double.eps^0.5)  abs(x - round(x)) < tol
