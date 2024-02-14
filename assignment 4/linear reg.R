# using lm function for logistic regression

path <- "C:\\Users\\rajeevt\\Documents\\Data-Science\\Data-Science-Lab\\assignment 4\\Toy_sales.csv"

dataset <- read.csv(path)
sales <- dataset$Unitsales
price <- dataset$Price

plot(price, sales)

# syntax for lm():
  # lm(formula = y~x, data = dataset)
  # note: ~ is vs operator
model <- lm(formula = sales ~ price, data = dataset)
abline(model, col = "red")
