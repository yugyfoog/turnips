# find recomended sell prices for ACNH turnips
# base on maximizing expected value

library(tidyverse)
library(xtable)

data <- read_csv("turnips.csv", skip=15)

days = c("Monday AM", "Monday PM",
       	 "Tuesday AM", "Tuesday PM",
	 "Wednesday AM", "Wednesday PM",
	 "Thursday AM", "Thursday PM",
	 "Friday AM", "Friday PM",
	 "Saturday AM")
	 
sell = c(0,0,0,0,0,0,0,0,0,0,0)

m <- mean(data$PRICE)
sell[11] = m
data <- data %>% mutate(PRICE = if_else(PRICE > m, PRICE, m))

m <- mean(data$PRICE)
sell[10] = m
data <- data %>% mutate(PRICE = if_else(PRICE > m, PRICE, m))

m <- mean(data$PRICE)
sell[9] = m
data <- data %>% mutate(PRICE = if_else(PRICE > m, PRICE, m))

m <- mean(data$PRICE)
sell[8] = m
data <- data %>% mutate(PRICE = if_else(PRICE > m, PRICE, m))

m <- mean(data$PRICE)
sell[7] = m
data <- data %>% mutate(PRICE = if_else(PRICE > m, PRICE, m))

m <- mean(data$PRICE)
sell[6] = m
data <- data %>% mutate(PRICE = if_else(PRICE > m, PRICE, m))

m <- mean(data$PRICE)
sell[5] = m
data <- data %>% mutate(PRICE = if_else(PRICE > m, PRICE, m))

m <- mean(data$PRICE)
sell[4] = m
data <- data %>% mutate(PRICE = if_else(PRICE > m, PRICE, m))

m <- mean(data$PRICE)
sell[3] = m
data <- data %>% mutate(PRICE = if_else(PRICE > m, PRICE, m))

m <- mean(data$PRICE)
sell[2] = m
data <- data %>% mutate(PRICE = if_else(PRICE > m, PRICE, m))

m <- mean(data$PRICE)
sell[1] = m
data <- data %>% mutate(PRICE = if_else(PRICE > m, PRICE, m))

results <- tibble(Time = days, Sell = sell)

results

xtable(results) %>% print(file="bettertable.tex",
		          include.rownames=FALSE,
	                  only.contents=FALSE)
			
