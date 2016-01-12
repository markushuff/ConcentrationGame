#' Compare two cards
#'
#' @author Markus Huff
#'
comparison_turn_2 <- function(turn_1,turn_2,set,set_before_turn_1,history)
{
  turn_2 <- set[sample(nrow(set),1,replace = FALSE),];
  set <- set[set$id != turn_2$id,];

  if (turn_1$pair == turn_2$pair)
  {
    history <- history[history$pair != turn_1$pair,];
    set <- set[set$pair != turn_1$pair,];
  }
  else
  {
    history <- rbind(history,turn_1,turn_2);
    set <- set_before_turn_1
  }
  return(list(set,history))
}
