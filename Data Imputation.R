airquality
install.packages("VIM")
library(VIM)
aggr(airquality, numbers = TRUE)

# mice
install.packages("mice")
library(mice)
mice_imp <- mice(airquality, method = "pmm")
mice_results <- complete(mice_imp)

# missForest
install.packages("missForest")
library(missForest)
forest_imp <- missForest(airquality)

# Mean imputation
mean_imp <- airquality
mean_imp$Ozone[is.na(mean_imp$Ozone)] <- mean(mean_imp$Ozone, na.rm = TRUE)

# Distribution plots mice
library(ggplot2)
ggplot() +
  geom_density(aes(x = airquality$Ozone), color = "red") +
  geom_density(aes(x = mice_results$Ozone), color = "blue") +
  labs(title = "Ozone Distribution: Before vs. After Imputation",
       x = "Ozone (ppb)", y = "Density") +
  theme_minimal()

# Distribution plots mice  
library(ggplot2)
ggplot() +
  geom_density(aes(x = airquality$Ozone), color = "red") +  
  geom_density(aes(x = forest_imp$ximp$Ozone), color = "blue") +
  labs(title = "Ozone Distribution: Before vs. After Imputation",
       x = "Ozone (ppb)", y = "Density") +
  theme_minimal()


