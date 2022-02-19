# Libraries for the table
library(knitr)
library(tidyverse)

# Properly formatted data
shooting_df <- read.csv("../data/fatal-police-shootings-data.csv", stringsAsFactors = FALSE) %>% 
  mutate(victims = 1) %>% 
  mutate(year = as.numeric(substring(date, 1,4))) %>% 
  group_by(signs_of_mental_illness) %>% 
  summarise(victims = sum(victims)) %>% 
  mutate(percentage = (victims/sum(victims))*100) %>% 
  mutate(percentage = round(percentage, 2))

# Creates the table
knitr::kable(shooting_df, 
             "pipe", 
             caption = "History of Poor Mental Health by Number and Percentage",
             col.names = c("Signs of Mental Illness", 
                           "Number of Victims",
                           "Percentage of Victims"),
             align = c("c",
                       "c",
                       "c"))
