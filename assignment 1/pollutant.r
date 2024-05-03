path <- "C:\\Users\\rajeevt\\Documents\\Data-Science\\Data-Science-Lab\\assignment 1\\pollutant_csv.csv"

pollutant <- read.csv(path)

sixth_month <- subset(dataset, dataset$Month == 6)

mean(sixth_month$Temp)


# Assuming the data is loaded as "pollutant" data frame

# 1. Mean of Temp when Month is 6
mean(pollutant$Temp[pollutant$Month == 6])
# 2. Number of observations
nrow(pollutant)
# 3. Print last two rows
tail(pollutant, 2)
# 4. Ozone value in 47th row
pollutant$Ozone[47]
# 5. Missing values in Ozone
sum(is.na(pollutant$Ozone))
# 6. Mean of Ozone excluding missing values
mean(pollutant$Ozone[!is.na(pollutant$Ozone)])
# 7. Mean of Solar.R for Ozone > 31 and Temp > 90
mean(pollutant$Solar.R[pollutant$Ozone > 31 & pollutant$Temp > 90])
# 8. Maximum Ozone value in May (Month = 5)
max(pollutant$Ozone[pollutant$Month == 5])

