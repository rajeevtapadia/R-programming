data = read.csv("CP\\spotify_dataset.csv")
data$bin_popularity = ifelse(data$popularity > 70, 1, 0)


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
iterations <- 1000

# Run gradient descent
theta_optimized <- gradient_descent(X, y, theta, learning_rate, iterations)
print("Optimized coefficients (weights):")
print(theta_optimized)


# make pred
predictions <- hypothesis(theta_optimized, X)

# Print predictions
print(predictions)

# Plot the scatter plot
plot(1:2000, predictions, 
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

