# creating dataframe
# passed vectors act as columns
df <- data.frame(
  Training = c("Strength", "Stamina", "Other"),
  Pulse = c(100, 150, 120),
  Duration = c(60, 30, 45)
)

# print summary
summary(df)

# access dataframe
df$Training
df[2]
df[["Duration"]]
