# Emm Ocampo
# Chart two for deliverable

# Load required packages.
library(ggplot2)
library(tidyverse)
library(ggthemes)


# Load relevant csv file and condense the number of victims by years.
police_shootings <- read.csv("../data/fatal-police-shootings-data.csv", stringsAsFactors = FALSE) %>% 
  mutate(Victims = 1) %>% 
  group_by(date) %>% 
  summarise(Victims = sum(Victims)) %>% 
  mutate(Year = as.numeric(substring(date, 1,4))) %>% 
  group_by(Year) %>% 
  summarise(Victims = sum(Victims)) %>% 
  filter(Year != "2022")


# Line graph with the number of Victims by year.
chart_two <- ggplot(police_shootings,
                    aes(x = Year,
                        y = Victims)) +
             geom_line(color = "#c45625",
                      size = 1,
                      alpha = 0.9) +
             ylim(700, 1200) +
             labs(title = "Number of victims by year",
                  subtitle = "2022 is excluded due to incomplete data",
                  caption = "Data retrieved from the Washington Post's Police Shooting Database",
                  x = "Year",
                  y = "Number of victims") +
             theme_fivethirtyeight() +
             theme(axis.title = element_text())

chart_two
