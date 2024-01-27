# list can store different data types

# list creation
lst = list(2L, 'xyz', 69.79)
lst

# accessing list
lst[2]

# changing an item
lst[2] <- 'bimbim'
lst

# length of list
length(lst)

# check if item exits
"bimbim" %in% lst

# add elements to end
lst <- append(lst, 'blyad')

# add after nth index
append(lst, "helllo", after = 1)

# remove item
newlist <- lst[-1]

# access a range
lst[1:3]
