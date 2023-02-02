suppressPackageStartupMessages(library(tidyverse))
suppressPackageStartupMessages(library(lm.beta))

msleep

Q1 <- cor.test(msleep$sleep_total, msleep$bodywt)



msleep1 <- msleep %>%
  select(sleep_total, sleep_rem, brainwt, bodywt)
Q2 <- round(cor(msleep1, use="complete.obs"), 2)




Q3 <- lm(bodywt ~ vore, data = msleep)




mod4 <- update(Q3, .~. + sleep_rem)
x <- summary(mod4)
y <- round(AIC(Q3), 2)
Q4 <- round(AIC(mod4), 2)





ms1 <- msleep %>%
  filter(vore == "carni" | vore == "herbi")
Q5 <- glm(as.factor(vore) ~ sleep_total, binomial(), ms1)

