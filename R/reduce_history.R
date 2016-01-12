#' Reduce history to working memory capacity
#'
#' @author Markus Huff
#'
reduce_history <- function(history,capacity,method)
{
  history <- history[!is.na(history$pair),]
  if ((length(history$id) <= capacity))
    history <- history
  else
    if (method=="random")
      history <- history[sample(nrow(history),capacity,replace = FALSE),]
    else
      if (method=="lifo")
        history <- history[c(1:capacity),]
      else
        if (method=="fifo")
          history <- history[c((length(history$id)-capacity+1):length(history$id)),]
        return(history)
}
