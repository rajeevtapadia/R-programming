# matrix creation
myMatrix <- matrix(data = 1:12, nrow = 4, ncol = 4, byrow= TRUE)
myMatrix

# accessing matrix
myMatrix[2, ]
myMatrix[2, 4]
myMatrix[,4]

myMatrix[c(1,2),]

# no of rows and cols
dim(myMatrix)

# total cells in matrix
length(myMatrix)
