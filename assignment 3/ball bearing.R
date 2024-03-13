dataset <- read.csv("assignment 3\\hypothesis.csv")

mean = mean(dataset$Life_Hrs)
sd = sd(dataset$Life_Hrs)
n = length(dataset$Life_Hrs)

# H0: mean lifetime of ball bearing is 10,000 hrs
# H1: mean lifetime of ball bearing is less than 10,000 hrs

tValue = (mean - 10000) / (sd / sqrt(n))
criticalValue = qnorm(0.05)

if(tValue < criticalValue) {
  cat("reject null hypothesis, lifetime is less")
} else {
  cat("fail to reject null hypothesis, lifetime is 10,000")
}

criticalValue = qnorm(0.01)

if(tValue < criticalValue) {
  cat("reject null hypothesis, lifetime is less")
} else {
  cat("fail to reject null hypothesis, lifetime is 10,000")
}
