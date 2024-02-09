# dbinom is the implementation for nCk p^k (1-p)^(n-k)
# where
  # n = no of trials
  # k = no of favourable outcomes
  # p = possiblity of favourable outcome

path <- "C:\\Users\\rajeevt\\Documents\\Data-Science\\Data-Science-Lab\\assignment 2\\Travelled abroad.csv"

dataset <- read.csv(path)

# 1.	Find out the % of Indians in the sample who have travelled abroad 
p <- mean(dataset$Travelledabroad == "Y")


# answer the following on randomely chosen sample of 10
# a. no one has travelled abroad
dbinom(0, size = 10, prob = p)

# b. exactly one person travelled abroad
dbinom(1, size = 10, prob = p)

# Probability that exactly 2 persons have traveled abroad
dbinom(2, size = 10, prob = p)

# Probability that exactly 3 persons have traveled abroad
dbinom(3, size = 10, prob = p)

# Probability that exactly 4 persons have traveled abroad
dbinom(4, size = 10, prob = p)

# Probability that exactly 5 persons have traveled abroad
dbinom(5, size = 10, prob = p)

# Probability that exactly 6 persons have traveled abroad
dbinom(6, size = 10, prob = p)

# Probability that exactly 7 persons have traveled abroad
dbinom(7, size = 10, prob = p)

# Probability that exactly 8 persons have traveled abroad
dbinom(8, size = 10, prob = p)

# Probability that exactly 9 persons have traveled abroad
dbinom(9, size = 10, prob = p)

# Probability that exactly 10 persons have traveled abroad
# Probability that exactly 2 persons have traveled abroad
dbinom(2, size = 10, prob = p)

# Probability that exactly 3 persons have traveled abroad
dbinom(3, size = 10, prob = p)

# Probability that exactly 4 persons have traveled abroad
dbinom(4, size = 10, prob = p)

# Probability that exactly 5 persons have traveled abroad
dbinom(5, size = 10, prob = p)

# Probability that exactly 6 persons have traveled abroad
dbinom(6, size = 10, prob = p)

# Probability that exactly 7 persons have traveled abroad
dbinom(7, size = 10, prob = p)

# Probability that exactly 8 persons have traveled abroad
dbinom(8, size = 10, prob = p)

# Probability that exactly 9 persons have traveled abroad
dbinom(9, size = 10, prob = p)

# Probability that exactly 10 persons have traveled abroad
dbinom(10, size = 10, prob = p)

barplot(dbinom(0:10, size = 10, prob = p))


# 4.	What is the probability that in the randomly chosen sample 
#     of 100 persons at least 59 have travelled abroad?  
# Hint: use normal approximation
no_sample <- 100

mu <- no_sample * p

sigma <- sqrt(no_sample * p * (1-p))

z <- (59 - mu)/sigma

1 - pnorm(z)

