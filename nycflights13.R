suppressPackageStartupMessages(library(tidyverse))

suppressPackageStartupMessages(library(nycflights13))
library(nycflights13)

flight <- nycflights13::flights
head(flight)



Q1 <- 
  as.data.frame(flights %>% 
    filter(carrier == "AA" | carrier == "EV" |carrier == "FL") %>%
    group_by(carrier) %>%
    summarise(average_dist = mean(distance)))
    options(digits = 5)
    
    

Q2 <- 
  flights %>%
  group_by(month) %>%
  count(month) %>%
  summarise(highest_num = max(n)) %>%
  arrange(desc(highest_num)) %>%head(1)
    




Q3 <-  
  flights %>%
        select(origin, dest, min_distance = distance)%>%
        distinct %>%  slice_min(n = 5, order_by = min_distance, with_ties = FALSE)
        

Q4 <- 
  data.frame(flights %>%
       filter(origin == "JFK") %>%
       group_by(month, day) %>%
       summarise(mean_distance = format(round(mean(distance),2),nsmall = 2)) %>%
       arrange(desc(mean_distance)) %>% head(5))

Q5 <-
  flight %>% group_by(dest) %>% filter(!is.na(arr_delay)) %>% summarise(max_arr_delay=max(arr_delay)) %>% 
       filter(dest=="ATL"|dest=="BOS")
