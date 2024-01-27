path <- "C:\\Users\\rajeevt\\Documents\\Data-Science\\Data-Science-Lab\\assignment 1\\pollutant_csv.csv"

dataset <- read.csv(path)

sixth_month <- subset(dataset, dataset$Month == 6)

mean(sixth_month$Temp)
