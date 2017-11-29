#' as is levels
#'
#' returns a factor with levels in their original order
#' Example:
#' pollo <- c("rooster", "chicken", "hen")
#' as_is_levels(pollo)
#' [1] rooster chicken hen
#' Levels: rooster chicken hen
#' @param character to be converted, or factor to be modified
#' @return factor with unrodered levels
#' @export
as_is_levels<- function (x) {
                factor(x, levels= unique(x))
}

