# Practica 2
# Enrique Acedo
# 10/11/2015
# Data Mining

# Leemos los datos
social_data <- read.csv("https://raw.githubusercontent.com/kikeacedo/Practica-R/master/social_network.csv")

# Ver los datos
# str(social_data)

# Filtrar datos fuera de rango de edad [13, 20)
social_data$age <- ifelse(social_data$age >= 13 & 
                          social_data$age < 20,
                          social_data$age, NA )


# 
social_data$female <- ifelse(social_data$gender == "F" &
                            !is.na(social_data$gender),
                            1, 0)

social_data$no_gender <- ifelse(is.na(social_data$gender), 1, 0)

mean(social_data$age, na.rm = TRUE)

aggregate(data = social_data, age ~ gradyear, mean, na.rm = TRUE)


ave_age <- ave(social_data$age, social_data$gradyear, 
               FUN = function(x) mean(x, na.rm = TRUE))

social_data$age <- ifelse(is.na(social_data$age), ave_age, social_data$age)

summary(social_data$age)
