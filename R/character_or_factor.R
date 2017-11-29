#' character or factor
#'
#' rcompares the lenght of levels with the leght of the factor, if equal, it suggest it should be character, if not, factor.
#'
#' Example:
#'
#' pollos<- c("gallo", "gallo", "pollito", "gallina", "pollito")
#' char_not_fact(pollos)
#' [1] "it should be a factor"
#'
#' pollo <- c("rooster", "chicken", "hen")
#' char_not_fact(pollo)
#' [1] "that should be character"
#'
#' @param vector to be assess
#' @return whether it should be character or factor
#' @export

char_not_fact<- function (x) {f<- as_is_levels(x)
if (length(f)== length(unique(levels(f)))) {
  return("that should be character")}

else {return("it should be a factor")
}
}
