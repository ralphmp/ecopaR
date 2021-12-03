#' @title Saturation deficit - Psycrometer
#' @description  saturation_deficit with wet and dry bulbs from psycrometer device according to Silveira-Neto et al. (1976).
#' @references
#' Silveira-Neto, Sinval, Octávio Nakano, Décio Barbin, and Nilson Augusto Villa Nova. 1976. Manual de Ecologia dos Insetos. Piracicaba, SP: Editora Agronômica Ceres LTDA.
#' @param dry_bulb dry bulb temperature in Celsius degree
#' @param wet_bulb wet bulb temperature in Celsius degree
#' @export
#' @examples
#' saturation_deficit_bulb(27,20)


saturation_deficit_bulb <- function(dry_bulb, wet_bulb){
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
    ur <- relative_humidity_bulb(dry_bulb = dry_bulb, wet_bulb = wet_bulb)
    ea <- ((ur * es)/100)
    ds <- (es - ea)
    return(ds)
  }
}
