# google co-lab link 
# https://colab.research.google.com/drive/1I_fI5cTLOKcG14fztG0aPVnVLDKrjvPE?usp=sharing

library(caret)
library(ggplot2)
library(pROC)

# Define the hyperbolic tangent function
tanh <- function(x, a = 1) {
  (((exp(2 * a * x) - 1) / (exp(2 * a * x) + 1)) + 1) / 2
}

# Define the hypothesis function
# here theta is optimized coefficient
hypothesis <- function(theta, feat_matrix) {
  tanh(feat_matrix %*% theta)
}

# Define the gradient of the cost function
gradient <- function(theta, feat_matrix, target) {
  m <- length(target)
  pred <- hypothesis(theta, feat_matrix)
  #
  1/m * t(feat_matrix) %*% (pred - target)
}

# Implement gradient descent
gradient_descent <- function(feat_matrix, target, theta, learning_rate, iterations) {
  for (i in 1:iterations) {
    theta <- theta - learning_rate * gradient(theta, feat_matrix, target)
  }
  return(theta)
}

data = read.csv("CP/spotify_dataset.csv")
# head(data)
length(data$popularity)

# remove the rows from data which have 0 as popularity

data <- data[data$popularity != 0,]
length(data$popularity)

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


# normalize the tempo column in test_data on a 0 to 1 scale

test_data$tempo <- (test_data$tempo - min(test_data$tempo)) / (max(test_data$tempo) - min(test_data$tempo))

# the explicity colunm holds TRUE OR FALSE as string convert them to 1 or 0

test_data$explicit <- ifelse(test_data$explicit == "TRUE", 1, 0)

head(test_data)

# get the required feature into feature matrix

feat_matrix <- test_data[, c("danceability", "energy", "loudness", "speechiness", "liveness", "valence", "tempo")]
feat_matrix <- as.matrix(feat_matrix)

head(feat_matrix)

target = c(test_data$bin_popularity)
length(target)

# Initialize weights
theta <- rep(0, ncol(feat_matrix))

# Set hyperparameters
learning_rate <- 0.001
iterations <- 100000

# Run gradient descent
theta_optimized <- gradient_descent(feat_matrix, target, theta, learning_rate, iterations)
print(theta_optimized)

# make pred
predictions <- hypothesis(theta_optimized, feat_matrix)

plot(1:length(test_data$popularity), test_data$popularity)

# trying out different threshold values for popularity probability
# to find out which one give the best result

max_accuracy <- 0
best_threshold <- 0
for (threshold in seq(0.4, 0.7, 0.01)) {
  predictions_binary <- ifelse(predictions > threshold, 1, 0)
  accuracy <- sum(predictions_binary == test_data$bin_popularity) / length(test_data$bin_popularity)
  if (accuracy > max_accuracy) {
    max_accuracy <- accuracy
    best_threshold <- threshold
  }
}

print(paste("Maximum accuracy:", max_accuracy))
print(paste("Best threshold:", best_threshold))

predictions_binary <- ifelse(predictions > best_threshold, 1, 0)
confusion_matrix <- confusionMatrix(as.factor(predictions_binary), as.factor(test_data$bin_popularity))
confusion_matrix

confusion_matrix$overall['Accuracy']
confusion_matrix$byClass['Sensitivity']
confusion_matrix$byClass['Specificity']
confusion_matrix$byClass['Precision']

# Create a scatter plot with popularity on the y-axis and predicted popularity on the x-axis
ggplot(data = test_data, aes(x = predictions, y = popularity)) +
  geom_point() +
  labs(title = "Actual Popularity vs. Predicted Popularity",
       x = "Predicted Popularity",
       y = "Actual Popularity")

# Create a histogram of the predicted probabilities
ggplot(data = test_data, aes(x = predictions)) +
  geom_histogram(binwidth = 0.05) +
  labs(title = "Distribution of Predicted Probabilities",
       x = "Predicted Probability")

# Plot the ROC curve
roc <- roc(test_data$bin_popularity, predictions)
plot(roc, print.auc = TRUE)

# Calculate the AUC
auc <- auc(roc)
print(paste("AUC:", auc))


