data = read.csv("CP\\spotify_dataset.csv")
data$bin_popularity = ifelse(data$popularity > 70, 1, 0)

data_0 <- subset(data, bin_popularity == 0)
data_1 <- subset(data, bin_popularity == 1)

# Get the minimum number of samples between the two classes
min_samples <- min(nrow(data_0), nrow(data_1))

# Sample equal number of rows from each class
test_data_0 <- data_0[sample(1:nrow(data_0), min_samples), ]
test_data_1 <- data_1[sample(1:nrow(data_1), min_samples), ]

# Combine the sampled data for both classes
test_data <- rbind(test_data_0, test_data_1)

# Shuffle the rows of the combined test dataset
test_data <- test_data[sample(nrow(test_data)), ]

data = test_data

# feature matrix
X <- cbind(data$danceability, data$energy,
           data$loudness, data$speechiness, 
           data$acousticness, data$instrumentalness, 
           data$liveness, data$valence)
# target vector
y <- c(data$bin_popularity)

# Initialize weights
theta <- rep(0, ncol(X))

# Set hyperparameters
learning_rate <- 0.01
iterations <- 10000

# Run gradient descent
theta_optimized <- gradient_descent(X, y, theta, learning_rate, iterations)
print("Optimized coefficients (weights):")
print(theta_optimized)


# make pred
predictions <- hypothesis(theta_optimized, X)

# Plot the scatter plot
plot(1:length(predictions), predictions, 
     xlab = "Serial Number", ylab = "Predicted Probability",
     main = "Scatter Plot of Predicted Probabilities",
     ylim = c(0, 1))

plot(1:2000, data$popularity)


hist(predictions, breaks = 20, freq = FALSE, 
     main = "Bell Curve of Predicted Probabilities", 
     xlab = "Predicted Probability",
     xlim = c(0, 1))

curve(dnorm(x, mean = mean(predictions), sd = sd(predictions)), 
      add = TRUE, col = "blue", lwd = 2)

