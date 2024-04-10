library(dplyr)
library(ggplot2)
library(caret)



data = read.csv("CP\\spotify_dataset.csv")
mean(data$popularity)

data$bin_popularity = ifelse(data$popularity > 70, 1, 0)

ggplot(data, aes(x = bin_popularity, y = popularity)) +
  geom_point(aes(color = popularity), size = 1) +
  theme_classic()

sum(data$bin_popularity)
