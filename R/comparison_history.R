#' Compare a single card (turn_1) with the history (working memory), 
#' else take second card
#'
#' @author Markus Huff
#'
comparison_history <- function(turn_1,set,set_before_turn_1,history)
{
  if (turn_1$pair %in% history$pair)
    # If turn_1 is in history
  {
    set <- set[set$pair != turn_1$pair,];
    history <- history[history$pair != turn_1$pair,];
    return(list(set,history))
  }
  else
    # If turn_1 not in history
  {
    set <- comparison_turn_2(turn_1,turn_2,set,set_before_turn_1,history)
  }
}
