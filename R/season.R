#' @title Rainy/dry season
#' @description  Classification of seasons considering rainy and dry seasons.
#' @references
#' Wolda, H. 1988. “Insect Seasonality: Why?” Annual Review of Ecology and Systematics 19 (1): 1–18. \doi{10.1146/annurev.es.19.110188.000245}.
#'
#'
#' “Köppen Climate Classification”. In Wikipedia, 1st November 2021. \url{https://en.wikipedia.org/w/index.php?title=K%C3%B6ppen_climate_classification&oldid=1053095128}.
#' @return Character object classifying the target day as belonging to "dry season" or "rainy season".
#' @param date date to classify
#' @param start_rainy Date of start rainy season ("month-day"). Default value consider 1st September.
#' @param start_dry Date of start dry season("month-day"). Default value consider 1st May.
#' @export
#' @examples
#' season("2021-05-23")
#' season("2020-03-06", start_rainy = "05-22", start_dry = "03-04")

season <- function(date, start_rainy = "09-01", start_dry = "05-01"){
  rangee = lubridate::yday(as.Date(c(paste("2020",start_dry, sep = "-"),
                                     paste("2020",start_rainy, sep = "-"))))
  x = lubridate::yday(date)
  x = cut(x, breaks = c(0, rangee, 366))
  levels(x) = c("rainy season", "dry season","rainy season")
  as.character(x)
}
