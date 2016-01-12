#' Print the current result of the simulation
#'
#' @author Markus Huff
#'
print_result <- function(set,set_before_turn_1)
{
  if (length(set_before_turn_1$pair) == length(set$pair))
    print("Nicht erfolgreich!")
  else
    print(paste(
      "Aufgedecktes Paar:",return_missing_rows(set_before_turn_1,set)
    ));
}
