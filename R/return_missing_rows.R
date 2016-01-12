#' Compare two data frames and return those rows that are missing in the second one
#'
#' @author Markus Huff
#'
return_missing_rows <- function(set_before_turn_1,set)
{
  set_before_turn_1[!duplicated(rbind(set, set_before_turn_1))[-(1:nrow(set))],]
  a <- set_before_turn_1[!duplicated(rbind(set, set_before_turn_1))[-(1:nrow(set))],]$pair[1]
  return(a)
}
