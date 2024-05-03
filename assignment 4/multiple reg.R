# Load Toy Sales data set (assuming the CSV file is in the specified path)
path <- "assignment 4\\Toy_sales.csv"
dataset <- read.csv(path)

full_model <- lm(Unitsales ~ Price + Adexp + Promexp, data = dataset)
summary(full_model)$r.squared

coef_summary = summary(full_model)$coefficients
names(coef_summary[which(coef_summary[,4] < 0.05), 1])

coef_summary[grep("Promexp", names(coef_summary)), 4]

predict(full_model, newdata = data.frame(Price = 9.1, Adexp = 52, Promexp = 61))
predict(full_model, newdata = data.frame(Price = 8.1, Adexp = 50, Promexp = 60))
