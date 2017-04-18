
#food$FoodDate = mdy(format(as.POSIXct(food$OLDEST,format='%m/%d/%Y'),format='%m/%d/%Y'))
food <- readRDS("food.rds")

#food<- food[apply(!is.na(food[,14]), 1, any),]


saveRDS(food, "food.rds")


