# Define the hyperbolic tangent function
tanh <- function(x, a = 1) {
  (((exp(2 * a * x) - 1) / (exp(2 * a * x) + 1)) + 1) / 2
}

# Define the hypothesis function
# here theta is optimized coefficient
hypothesis <- function(theta, X) {
  tanh(X %*% theta)
}

# Define the cost function
cost_function <- function(theta, X, y) {
  m <- length(y)
  h <- hypothesis(theta, X)
  -1/m * sum(y * log(h) + (1 - y) * log(1 - h))
}

# Define the gradient of the cost function
gradient <- function(theta, X, y) {
  m <- length(y)
  h <- hypothesis(theta, X)
#
  1/m * t(X) %*% (h - y)
}
learning_rate *gradient(theta_optimized, X, y)

# Implement gradient descent
gradient_descent <- function(X, y, theta, learning_rate, iterations) {
  for (i in 1:iterations) {
    theta <- theta - learning_rate * gradient(theta, X, y)
  }
  return(theta)
}