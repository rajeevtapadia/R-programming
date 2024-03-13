library(tidyverse)
library(dslabs)
library(ggrepel)

murderdf <- murders
rate_cal <- summarise(murderdf, rate= sum(total)/sum(population)*10^6)

r <- pull(rate_cal)

ggplot(murderdf, aes(x = population/ 10^6, y = total)) +
  geom_abline(intercept = log10(r), col = "darkgreen") +
  geom_point(aes(color = region), size = 3) +
  geom_text_repel(nudge_x = 0.005, size = 2, aes(label = abb)) +
  scale_x_log10("Population in Millions") +
  scale_y_log10("Total Murders") +
  ggtitle("US State Crimes") +
  scale_color_discrete(name = "Region")
