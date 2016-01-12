#' Simulation of the concentration game
#'
#' @author Markus Huff
#'
#' @param n Number of card pairs of the game
#' @param num_simulations Number of simulations of the game
#' @param capacity Working memory capacity
#' @param method Characteristic of the working memory ("random","fifo","lifo")
#'
#' @export
#'
concentration_game <-
  function(n = 16,num_simulations = 10,capacity = 4,method = "random")
  {
    history <-
      data.frame(pair = numeric(0),A_B = character(0),id = numeric(0))
    history_null <- history
    trial <- 0 # Anzahl an Zügen pro Durchgang

    # Vektor mit Anzahl an Zügen

    num_turns <- numeric(0)

    for (i in 1:num_simulations)
    {
      # Konstruiere Memory Spiel
      print(paste("Simulation:",i))
      set <- data.frame(pair = numeric(0),A_B = character(0))

      for (i in 1:n)
      {
        tmp <- rbind(data.frame(pair = i,A_B = "A"),
                     data.frame(pair = i,A_B = "B"))
        set <- rbind(set,tmp)
      }

      set$id <- paste0(set$pair,set$A_B)

      while (length(set$pair) > 3)
      {
        # Erster Zug
        set_before_turn_1 <- set
        turn_1 <- set[sample(nrow(set),1,replace = FALSE),]

        # Neues Set Karten
        set <- set[set$id != turn_1$id,]

        if (length(history$id) == 0)
        {
          # Zweiter Zug
          set <- comparison_turn_2(turn_1,turn_2,set,set_before_turn_1,history)[[1]];
          history <- comparison_turn_2(turn_1,turn_2,set,set_before_turn_1,history)[[2]];
          print_result(set,set_before_turn_1);
        }
        else
        {
          history <- reduce_history(history,capacity,method);
          set <- comparison_history(turn_1,set,set_before_turn_1,history)[[1]];
          history <- comparison_history(turn_1,set,set_before_turn_1,history)[[2]];
          print_result(set,set_before_turn_1);
        }
        trial <- trial + 1
      }
      num_turns <- c(num_turns,trial)
      trial <- 0
      history <- history_null
    }
    num_turns <- num_turns + 1
    return(num_turns)
  }
