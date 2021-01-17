# R script to produce a histogram of all purchase prices

library(tidyverse)
library(ggthemr)

data <- read_csv("turnips.csv", skip=15)

ggthemr("lilac");

p <- data %>%
       filter(DIR == "buy") %>%
       select(PRICE) %>%
       ggplot(aes(x=PRICE)) +
         geom_histogram(binwidth=1) +
	 labs(title = "Turnip Purchase Prices",
	      x = "Price (Bells)",
	      y = "Count")

ggsave("buyhist.pdf")

