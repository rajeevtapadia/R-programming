library(class)
dataset = read.csv('assignment 5\\knn-dataset.csv')

features <- dataset[, 2:3]
target_class <- dataset[, 4]
test_point <- c(3, 2)

# Nearest Neighbor (NN)
distances <- sqrt((features[, 1] - test_point[1])^2 + (features[, 2] - test_point[2])^2)
distances
nearest_neighbor <- which.min(distances)
predicted_class_nn <- target_class[nearest_neighbor]

cat("Nearest Neighbor (NN): Class of test point = ", predicted_class_nn, "\n")

# K-Nearest Neighbors (KNN)
# KNN with K=5
knn_prediction_k5 <- knn(train = features, test = test_point, cl = target_class, k = 5)
cat("KNN (K=5): Class of test point = ", knn_prediction_k5, "\n")

# KNN with K=7
knn_prediction_k7 <- knn(train = features, test = test_point, cl = target_class, k = 7)
cat("KNN (K=7): Class of test point = ", knn_prediction_k7, "\n")

# Mahalanobis KNN (MKNN)
# Requires installing "MASS" package: install.packages("MASS")
library(MASS)

# Mahalanobis distances
mahalanobis_distances <- mahalanobis(t(test_point), features, cov(features))

# Find nearest neighbors with K=5
mknn_prediction <- knn(train = features, test = test_point, cl = target_class, k = 5, dist = mahalanobis_distances)
cat("MKNN (K=5): Class of test point = ", mknn_prediction$class, "\n")

# Radius-based Nearest Neighbor (R-NN)
distances <- sqrt((features[, 1] - test_point[1])^2 + (features[, 2] - test_point[2])^2)
neighbors <- dataset[distances <= 1.45,]
predicted_class_rnn <- names(sort(table(neighbors[, 3]), decreasing = TRUE)[1])
cat("R-NN (Radius=1.45): Class of test point = ", predicted_class_rnn, "\n")
