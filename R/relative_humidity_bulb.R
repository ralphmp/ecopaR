#' @title Relative humidity - Psycrometer
#' @description  Relative humidity with wet and dry bulbs from psycrometer device according to Silveira-Neto et al. (1976).
#' @references
#' Silveira-Neto, Sinval, Octávio Nakano, Décio Barbin, and Nilson Augusto Villa Nova. 1976. Manual de Ecologia dos Insetos. Piracicaba, SP: Editora Agronômica Ceres LTDA.
#' @param dry_bulb dry bulb temperature in Celsius degree
#' @param wet_bulb wet bulb temperature in Celsius degree
#' @export
#' @examples
#' relative_humidity_bulb(27,22)


relative_humidity_bulb <- function(dry_bulb, wet_bulb) {
  if (!is.numeric(dry_bulb) || !is.numeric(wet_bulb)) {
    stop(paste("Temperature must be a numeric variable."))
  }
  if (wet_bulb < 0 || dry_bulb < 0) {
    stop(paste("Temperature must be positive."))
  }
 if (any(dry_bulb < wet_bulb)) {
    stop(paste("Temperature of dry bulb must be greater than temperature of wet bulb."))
  } else {
  es <- buck_vapour_water(dry_bulb)
  els <- buck_vapour_water(wet_bulb)
  ur <- (((els - (0.59 * (dry_bulb - wet_bulb)))/es)*100)
  return(ur)
  }
}
