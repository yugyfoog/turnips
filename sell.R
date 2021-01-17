# R script to produce a histogram of all sale prices

library(tidyverse)
library(ggthemr)

data <- read_csv("turnips.csv", skip=15)

ggthemr("lilac");

p <- data %>%
       filter(DIR == "sell") %>%
       select(PRICE) %>%
       ggplot(aes(x=PRICE)) +
         geom_histogram(binwidth=5) +
	 labs(title = "Turnip Sale Prices",
	      x = "Price (Bells)",
	      y = "Count")

ggsave("sellhist.pdf")

