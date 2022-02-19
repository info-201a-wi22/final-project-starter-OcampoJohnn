# INFO 201
# Police Violence Against Marginalized Groups and Why it Happens

# This is the library required to manage this data.
library(tidyverse)

# This code chunk is used to take in and wrangle the data to cut redundancy for
# the first three values.
shootings <- read.csv("../data/fatal-police-shootings-data.csv", stringsAsFactors = FALSE) %>% 
  mutate(Victims = 1) %>% 
  group_by(race) %>% 
  summarise(Victims = sum(Victims)) %>% 
  mutate(prop = round(Victims/(sum(Victims)/100), 2))

# This takes in the same data as above, but does not wrangle it.
prop_state_data <- read.csv("../data/fatal-police-shootings-data.csv", stringsAsFactors = FALSE)

# This is used to compare states with populations.
population_data <- read.csv("../data/pop_by_state.csv", stringsAsFactors = FALSE) %>% 
  select(STATE,STATEID, POPESTIMATE2019)

# This code chunk is used to wrangle the two data frames above to cut redundancy when
# calling the last five values.
state_victims_pop <- prop_state_data %>% 
  group_by(state) %>% 
  mutate(Victims = 1) %>% 
  summarise(Victims = sum(Victims)) %>% 
  left_join(population_data, by = c("state" = "STATEID")) %>% 
  mutate(`Pop Per 100k` = (POPESTIMATE2019/100000)) %>% 
  mutate(`Victims Per 100k` = round((Victims/`Pop Per 100k`), 2))

# Creates the list to store the values.
summary_info <- list()

# Value 1. Returns the percentage of Black people shot.
summary_info$black_people_proportion <- shootings %>% 
  filter("B" == race) %>% 
  pull(prop)

# Value 2. Returns the percentage of Hispanic people shot.
summary_info$hispanic_people_proportion <- shootings %>% 
  filter("H" == race) %>% 
  pull(prop)

# Value 3. Returns the percentage of White people shot.
summary_info$white_people_proportion <- shootings %>% 
  filter("W" == race) %>% 
  pull(prop)

# Value 4. Returns the national average of victims per 100k people.
summary_info$mean_victims_prop <- round(mean(state_victims_pop$`Victims Per 100k`), 2)

# Value 5. Returns the state with the highest number of victims per 100k people.
summary_info$most_victims_prop_state <- state_victims_pop %>% 
  filter(max(`Victims Per 100k`) == `Victims Per 100k`) %>% 
  pull(STATE)

# Value 6. Returns the highest number of victims per 100k people.
summary_info$most_victims_prop_num <- state_victims_pop %>% 
  filter(max(`Victims Per 100k`) == `Victims Per 100k`) %>%  
  pull(`Victims Per 100k`)

# Value 7. Returns the state with the lowest number of victims per 100k people.
summary_info$least_victims_pro_state <- state_victims_pop %>% 
  filter(min(`Victims Per 100k`) == `Victims Per 100k`) %>%  
  pull(STATE)

# Value 8. Returns the lowest number of victims per 100k people.
summary_info$least_victims_pro_num <- state_victims_pop %>% 
  filter(min(`Victims Per 100k`) == `Victims Per 100k`) %>%  
  pull(`Victims Per 100k`)

