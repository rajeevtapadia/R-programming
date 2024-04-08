dataset = read.csv("assignment 2\\Travelled abroad.csv")

n = nrow(dataset)
travelledAB = nrow(dataset[dataset$Travelledabroad == 'Y', ])

travelledAB/ n
