path <- "C:\\Users\\rajeevt\\Documents\\Data-Science\\Data-Science-Lab\\assignment 1\\hair-eye-color.csv"

dataset <- read.csv(path)

head(dataset)

# 1.	How many people have brown eye color?
brown_eye <- subset(dataset, dataset$Eye.Color == "Brown")
nrow(brown_eye)

# 2.	How many people have Blonde hair?
sum(dataset$Hair.Color == "Blonde")

# 3.	How many Brown haired people have Black eyes?
sum(dataset$Hair.Color == "Brown" & dataset$Eye.Color == "Black")

# 4.	What is the percentage of people with Green eyes?
green_eye_percent <- sum(dataset$Eye.Color == "Green") * 100 / nrow(dataset)
cat(green_eye_percent, "%")

# 5.	What percentage of people have red hair and Blue eyes?
sum(dataset$Hair.Color == "Red" & dataset$Eye.Color == "Blue") * 100 / nrow(dataset)



