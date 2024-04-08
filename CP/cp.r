# Load required libraries
library(dplyr)
library(ggplot2)
library(caret)

# Read the data
data = read.csv("CP\\spotify_dataset.csv")
mean(data$popularity)

# limit the range of popularity to 0 to 1
data <- mutate(data, popularity = popularity / 100)

# Preprocessing
# Convert genre into factors
data$genre <- as.factor(data$genre)

# Convert explicit into binary
data$explicit <- as.factor(data$explicit)

# Model Building
# Splitting the data into training and testing sets
set.seed(123) # For reproducibility


trainIndex <- createDataPartition(data$popularity, p = .7, 
                                  list = FALSE, 
                                  times = 1)
trainData <- data[trainIndex, ]
testData <- data[-trainIndex, ]

# Logistic Regression Model
log_model <- glm(popularity ~ explicit+danceability+energy+loudness+speechiness+
                   acousticness+instrumentalness+liveness+valence+tempo, 
                 data = trainData, 
                 family = "binomial")
custom_glm <- function(formula, data, family = gaussian, weights, ...) {
  if (inherits(family, "family")) {
    if (family$family == "binomial") {
      # Extract the response variable for binomial family
      y <- model.response(model.frame(formula, data))
      if (!is.factor(y)) {
        stop("In binomial models, response variable must be a factor")
      }
      y <- ifelse(y == levels(y)[1], 0, 1)
    } else {
      # Extract the response variable for other families
      y <- model.extract(terms(formula), data)
    }
  } else {
    stop("Family argument must be a family object")
  }
  
  # Extract the design matrix
  X <- model.matrix(formula, data)
  
  # Fit the model using hyperbolic tangent function
  fit <- .Call(stats:::C_glmfit, X, y, weights, aic = FALSE, 
               family = family, ...)
  
  # Create a list with class 'glm' containing all the necessary components
  glm_obj <- list(
    coefficients = coef(fit),
    residuals = resid(fit),
    fitted.values = fitted(fit),
    family = fit$family,
    weights = weights,
    terms = fit$terms,
    call = match.call(),
    formula = formula,
    data = fit$model
  )
  
  # Classify the list as 'glm' object
  class(glm_obj) <- "glm"
  
  # Return the 'glm' object
  return(glm_obj)
}

trainData$popularity_factor <- as.factor(ifelse(trainData$popularity > 0.6, 1, 0))

log_model <- custom_glm(popularity ~ danceability, 
                        data = trainData, 
                        family = binomial())

# Model Summary
summary(log_model)
plot(log_model)


# Prediction
predictions <- predict(log_model, testData, type = "response")

# Evaluating the Model
# Convert probabilities to binary predictions
predicted_classes <- ifelse(predictions > 0.6, 1, 0)
predicted_classes

# Confusion Matrix
popularity_class <- ifelse(testData$popularity > 0.6, 1, 0)
print(popularity_class)

confusionMatrix <- confusionMatrix(factor(predicted_classes), 
                                   factor(popularity_class))
confusionMatrix

confusion_matrix_df <- as.data.frame(confusionMatrix$table)
rownames(confusion_matrix_df) <- confusionMatrix$rowMeans$Overall
colnames(confusion_matrix_df) <- confusionMatrix$colMeans$Overall

# Accuracy
accuracy <- sum(predicted_classes == popularity_class) / length(testData$popularity)
print(paste("Accuracy:", accuracy))

# Precision and Recall
precision <- sum(predicted_classes & testData$popularity) / sum(predicted_classes)
recall <- sum(predicted_classes & testData$popularity) / sum(testData$popularity)
print(paste("Precision:", precision))
print(paste("Recall:", recall))

