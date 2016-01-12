#' Compare to a single card with history (working memory), else take second card
#'
#' @author Markus Huff
#'
comparison_history <- function(turn_1,set,set_before_turn_1,history)
{
  if (turn_1$pair %in% history$pair)
    # Wenn turn_1 bereits in der history ist
  {
    set <- set[set$pair != turn_1$pair,];
    history <- history[history$pair != turn_1$pair,];
    return(list(set,history))
  }
  else
    # Wenn turn_1 nicht in der history ist
  {
    set <- comparison_turn_2(turn_1,turn_2,set,set_before_turn_1,history)
  }
}
