library(ggplot2)
library(dplyr)


data <- read.csv("https://www.football-data.co.uk/mmz4281/1920/SP1.csv")
(table(data$FTHG)/dim(data)[1])*100 # Probabilidades marginales estimadas
(table(data$FTAG)/dim(data)[1])*100 # Probabilidades marginales estimadas
(table(data$FTHG, data$FTAG)/dim(data)[1])*100 # Probabilidades conjuntas estimadas