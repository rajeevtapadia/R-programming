# data types

# numeric means float
# integer means int (the L declares it as integer)
s <- 2
p <- 2L

b <- 4/3
int <- as.integer(b)
cl <- class(b)
num <- as.numeric(b)

print(int)

# logical means boolean
x <- 1
y <- 2
z=x>y
print(z)
class(z)

# character means string
x <- "my sgpa"
y <- "for last sem is"
z <- 9.12

print(paste(x, y, z))
class(x)

