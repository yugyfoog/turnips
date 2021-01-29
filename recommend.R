# find recomended sell prices for ACNH turnips
# based on maximizing probable of making money

library(tidyverse)
library(xtable)

data <- read_csv("turnips.csv", skip=15)

p = 0.5^(1/c(11:1))

days = c("Monday AM", "Monday PM",
       	 "Tuesday AM", "Tuesday PM",
	 "Wednesday AM", "Wednesday PM",
	 "Thursday AM", "Thursday PM",
	 "Friday AM", "Friday PM",
	 "Saturday AM")
	 
results <- data %>%
               filter(DIR == "sell") %>%
               summarize(Sell = quantile(PRICE, probs = p)) %>%
               mutate(Time = days, .before=Sell)

xtable(results) %>% print(file="recommendtable.tex",
                          include.rownames=FALSE,
			  only.contents=FALSE)

