n = 35
mean = 134
sd = 17

# H0: label provides accurate measure of calories
# H1: measure is inaccurate

tValue = (mean - 130) / (sd / sqrt(n))

criticalValue = qnorm(0.025)

# using abs for two sided tail
if(abs(tValue) < abs(criticalValue)) {
  cat("reject null hypothesis, measure is inaccurate")
} else {
  cat("fail to reject null hypothesis, measure is accurate")
}

criticalValue = qnorm(0.01)

if(abs(tValue) < abs(criticalValue)) {
  cat("reject null hypothesis, measure is inaccurate")
} else {
  cat("fail to reject null hypothesis, measure is accurate")
}
