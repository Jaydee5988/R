



suppressPackageStartupMessages(library(tidyverse))

msleep

Q1 <- msleep %>%filter(vore == "carni" & conservation == "lc") %>%
  summarise(var = round(var(sleep_total), 2)) %>%as.data.frame()


Q2 <- msleep %>%filter(order == "Rodentia") %>%
  mutate(ratio = round(sleep_total/sleep_rem, 2)) %>%
  arrange(desc(ratio)) %>%select(name) %>%head(1)



Q3 <- msleep %>%filter(order == "Primates") %>%
  mutate(ratio = (bodywt/brainwt) > 100) %>%
  summarise(total = sum(ratio, na.rm = TRUE))


Q4 <- msleep %>%filter(!is.na(conservation)) %>%
  group_by(conservation) %>%summarise(mean_sleep = round(mean(sleep_total, na.rm = TRUE),2), 
  var_sleep =round(var(sleep_total, na.rm = TRUE),2)) %>%as.data.frame()


Q5 <- msleep %>% filter(vore == "herbi" & conservation == "domesticated", sleep_total > 12) %>%      
    select(name)

