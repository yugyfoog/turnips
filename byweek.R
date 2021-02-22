library(tidyverse)
library(lubridate)
library(ggthemr)

source("weekpoint.R")

data <- read_csv("turnips.csv", skip=15)

mdata <- data %>%
     mutate(day = paste(floor_date(make_date(YEAR,MONTH,DAY), "week"),ISLAND)) %>%
     rowwise() %>%
     mutate(WEEKPOINT <- weekpoint(WEEKDAY, AMPM)) %>%
     rename(WEEKPOINT = starts_with("WEEKPOINT")) %>%
     select(PRICE, WEEKPOINT, day)

plot <- mdata %>%
     	  ggplot(aes(y = PRICE, x = WEEKPOINT, group=day, color=day)) +
            geom_line() +
	    labs(title = "Daily Turnip Prices")

ggsave("byweek.pdf")


