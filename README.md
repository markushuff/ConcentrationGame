# ConcentrationGame

R-package for simulating the "Concentration" game.

## Usage
The main program is concentration_game(). With its default values it simulates 10 times a single player version of the concentration game with 16 card pairs, a working memory capacity of 4 items with random item selection. The number of card pairs can be adjusted using the n variable, the working memory capacity can be modified with the capacity variable and with the method variable one can simulate different characteristics of the working memory ("random", "lifo", and "fifo").

It is also possible to simulate the game without the usage of a working memory (capacity = 0).

## Current version

0.2.1: Fixed encoding problems (UTF-8), added description how to install directly from GitHub

## Installation directly from github

    install.packages("devtools") 
    library("devtools") 
    install_github("markushuff/ConcentrationGame")
    library(ConcentrationGame)