# train model on linear regression and calculate accuracy

set.seed(123) # for repro

path <- "C:\\Users\\rajeevt\\Documents\\Data-Science\\Data-Science-Lab\\assignment 4\\Toy_sales.csv"

# setup initial variables
dataset <- read.csv(path)
sales <- dataset$Unitsales
price <- dataset$Price

no_rows = nrow(dataset)
train_size <- round(0.7 * no_rows)

train_indices <- sample(1:no_rows, train_size)

# get training and testing sets
train_data <- dataset[train_indices, ]
test_data <- dataset[-train_indices, ]

# train model
model <- lm(formula = sales ~ price, data = train_data)

# get prediction from model
predic <- predict(model, newdata = test_data)

# calculating rms accuracy
rms_acc <- sqrt(mean((test_data$Unitsales - predic) ^ 2))


plot(price, sales)
abline(model, col = 'red')

