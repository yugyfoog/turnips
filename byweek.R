library(tidyverse)
library(lubridate)
library(ggthemr)

source("weekpoint.R")

data <- read_csv("turnips.csv", skip=15)

# ggthemr("lilac") -- not working ggplot color parameter


mdata <- data %>%
     mutate(day = paste(floor_date(make_date(YEAR,MONTH,DAY), "week"),ISLAND)) %>%
     rowwise() %>%
     mutate(WEEKPOINT <- weekpoint(WEEKDAY, AMPM)) %>%
     rename(WEEKPOINT = starts_with("WEEKPOINT")) %>%
     select(PRICE, WEEKPOINT, day)

mdata

plot <- mdata %>%
     	  ggplot(aes(y = PRICE, x = WEEKPOINT, group=day, color=day)) +
            geom_line() +
	    labs(title = "Daily Turnip Prices")

ggsave("byweek.pdf")


