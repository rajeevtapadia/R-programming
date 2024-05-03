# using lm function for logistic regression

path <- "assignment 4\\Toy_sales.csv"

dataset <- read.csv(path)
sales <- dataset$Unitsales
price <- dataset$Price

plot(price, sales)

# syntax for lm():
  # lm(formula = y~x, data = dataset)
  # note: ~ is vs operator
model <- lm(formula = sales ~ price, data = dataset)
abline(model, col = "red")
summary(model)$r.squared
summary(model)$sigma
predicted <- predict(model, newdata = dataset)
sales - predicted

