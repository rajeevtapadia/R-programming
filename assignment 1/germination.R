path <- "C:\\Users\\rajeevt\\Documents\\Data-Science\\Data-Science-Lab\\assignment 1\\germination.csv"

dataset <- read.csv(path)

head(dataset)

# 1. avg no of seeds germinated for uncovered boxes with watering 6?
subset1 <- subset(dataset, dataset$Box == "Uncovered" & dataset$water_amt == 4)
mean(subset1$germinated)

# 2.	What is the median value for the data covered boxes?
covered_boxes <- subset(dataset, dataset$Box == "Covered")
median(covered_boxes$germinated)
