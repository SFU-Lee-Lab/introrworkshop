#load in your libraries
library(tidyverse)

tfotr <- read.csv("data/The_Fellowship_Of_The_Ring.csv")
trotk <- read.csv("data/The_Return_Of_The_King.csv")
ttt <- read.csv("data/The_Two_Towers.csv")

#combine 3 datasets
lord_of_the_rings <- rbind(tfotr,trotk,ttt)

# using pivot_longer
lotr_tidy <- pivot_longer(lord_of_the_rings, names_to = "Sex",
                          values_to = "Words", cols = Female:Male)
