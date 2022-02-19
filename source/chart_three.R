# Emm Ocampo
# Chart three for deliverable

# Load required packages.
library(ggplot2)
library(tidyverse)
library(ggthemes)


# Load relevant csv file and condense the number of victims by type of arm
police_shootings2 <- read.csv("../data/fatal-police-shootings-data.csv", stringsAsFactors = FALSE) %>% 
  mutate(Victims = 1) %>% 
  group_by(armed) %>% 
  summarise(Victims = sum(Victims)) %>% 
  arrange(-Victims) %>% 
  slice_head(n = 5)

# Bar graph with the number of Victims by type of arm
chart_three <- ggplot(police_shootings2,
                      aes(x = Victims,
                          y = reorder(armed, Victims),
                          label = Victims,
                          fill = armed)) +
               geom_bar(stat = 'identity') +
               labs(title = "Victim's Five Most Used Arms",
                    caption = "Data Retrieved from the Washington Post's Police Shooting Database",
                    x = "Number of Victims",
                    y = "") +
               theme_gdocs() +
               theme(axis.title = element_text()) +
               scale_fill_brewer(palette = "Set1") +
               guides(fill = "none")
chart_three