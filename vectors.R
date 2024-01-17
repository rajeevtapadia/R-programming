vec <- 

#creating a vector using seq function
my_vec <- seq(1L, 37L, 3L)
class(my_vec)

rep_vec <- rep(5, 10)

x <- c(1,5,2)
y <- c(3,7,9)

# concatinating two vectors
arg <- c(y, x)
arg2 <- c(y, 4, 3, 2)

# finding min and max values
max_y <- max(y)
min_x <- min(x)

# implicit type conversion as 
# vector only stores same type of values
rollno <- c(3L, 2, 8)
print(rollno)
class(rollno)

# accessing elements
# note indexes start at 1
rollno[1]      # single element
rollno[c(1, 3)]    # multiple elements
rollno[c(-2)]    # all expect second

# modifying an item
rollno[1] <- 69
rollno




