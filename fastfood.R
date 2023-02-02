
suppressPackageStartupMessages(library(tidyverse))
suppressPackageStartupMessages(library(openintro))

fastfood <- openintro::fastfood
fastfood

Q1 <- fastfood %>%filter(restaurant == "Burger King" | restaurant == "Chick Fil-A") %>%
        arrange(desc(calories)) %>%select(item) %>%head(1)



Q2 <- fastfood %>%filter(restaurant == "Subway") %>%
        summarise(mean_sugar = round(mean(sugar), 2)) %>%
        as.data.frame()



Q3 <- fastfood %>%filter(restaurant == "Taco Bell") %>%
        summarise(mean_cal = round(mean(calories), 2))



Q4 <- fastfood %>%mutate(fatXsugar = (total_fat * sugar)) %>%
        select(restaurant, item, fatXsugar) %>%
        arrange(desc(fatXsugar)) %>%head(3)



Q5 <- fastfood %>%group_by(restaurant) %>%
       summarise(mean_satfat = mean(sat_fat) > 10) %>%
       summarise(total = sum(mean_satfat == TRUE))
