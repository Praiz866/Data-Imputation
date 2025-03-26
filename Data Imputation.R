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

# Distribution plots
library(ggplot2)
ggplot() +
  geom_density(aes(x = airquality$Ozone), color = "black") +
  geom_density(aes(x = mice_results$Ozone), color = "blue") +
  geom_density(aes(x = forest_imp$ximp$Ozone), color = "red")




# Impute data (example with MICE)
imputed <- mice(airquality, m = 1, method = "pmm")
complete_data <- complete(imputed)

# Compare densities
ggplot() +
  geom_density(aes(x = airquality$Ozone, color = "Original (with NAs)"), fill = NA) +
  geom_density(aes(x = complete_data$Ozone, color = "MICE-imputed"), fill = NA, linetype = "dashed") +
  labs(title = "Ozone Distribution: Before vs. After Imputation",
       x = "Ozone (ppb)", y = "Density") +
  scale_color_manual(values = c("red", "blue")) +
  theme_minimal()