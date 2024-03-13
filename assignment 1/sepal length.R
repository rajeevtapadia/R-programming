library('ggplot2')

# plot using ggplot2
ggplot(data = iris, aes(x = Species, y = Sepal.Length, )) + 
  geom_boxplot(aes(fill = Species)) +
  ggtitle("Box Plot")

# simple boxplot
boxplot(
  Sepal.Length ~ Species,
  data = iris,
  xlab = "spec",
  ylab = "Lenght"
)

