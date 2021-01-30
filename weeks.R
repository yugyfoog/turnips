library(tidyverse)
library(ggthemr)

source("weekpoint.R")

data <- read_csv("turnips.csv", skip=15)

ggthemr("lilac");

p <- data %>%
     rowwise() %>%
     mutate(WEEKPOINT <- weekpoint(WEEKDAY, AMPM)) %>%
     rename(WEEKPOINT = starts_with("WEEKPOINT")) %>%
     ggplot(aes(y = PRICE, x = WEEKPOINT)) +
        geom_point() +
	labs(title = "Daily Turnip Prices")

ggsave("weeks.pdf")

