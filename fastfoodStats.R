suppressPackageStartupMessages(library(tidyverse))
suppressPackageStartupMessages(library(lm.beta))
suppressPackageStartupMessages(library(openintro))

fastfood <- openintro::fastfood

fastfood

#need to look the spacing on values top
fastfood1 <- fastfood %>%
  filter(restaurant == "Sonic" | restaurant == "Subway" | restaurant == "TacoBell") %>%
  select(calories, total_fat, sugar, calcium) %>% na.omit()
Q1 <- round(cor(fastfood1), 2)



fastfood1 <- fastfood %>%
  filter(restaurant %in% c("Mcdonalds", "Subway")) %>%
  mutate(is_mcdonalds = restaurant == "Mcdonalds")
fit1 <- glm(is_mcdonalds ~ calories + sodium + protein, family = "binomial", data =fastfood1)
Q2 <- round(coef(fit1), 2)



fit2 <- update(fit1, . ~ . - sodium)

r3 <- round(coef(fit2), 2)
r3

Q3 <- round(AIC(fit1, k = 2), 2)
y <- round(AIC(fit2, k = 2), 2)



mod4 <- lm(calories ~ sat_fat + fiber + sugar, data=fastfood)
Q4<- round(mod4$coefficients["sat_fat"], 2)




fastfood2 <- openintro::fastfood %>%
  group_by(restaurant) %>%
  filter(n() >= 50 & n() <= 60)

fit2 <- lm(total_fat ~ cholesterol + vit_a + total_carb + restaurant,data = fastfood2)
summary(fit2)
fit3 <- update(fit2, . ~ . - vit_a)
coefs <- round(coef(lm.beta::lm.beta(fit3)), 2)

Q5 <- coefs[which.max(coefs)]

