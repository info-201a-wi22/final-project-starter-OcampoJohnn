# Data Wrangling ----------------------------------------------------------
# This part formats the data frame in a more usable way for us to visualize.
raw_shootings_df <- read.csv(file = "data/fatal-police-shootings-data.csv", stringsAsFactors = FALSE) %>% 
  rename(abv = state)

states <- read.csv(file = "data/states.csv", stringsAsFactors = FALSE) %>% 
  select(State, Abbreviation) %>% 
  rename(abv = Abbreviation)

# For clearer tags
police_shootings_df <- raw_shootings_df %>% 
  mutate(year = substring(date, 0, 4)) %>% 
  left_join(states, by = "abv") %>% 
  select(id, name, date, year, 
         manner_of_death:city, 
         State, signs_of_mental_illness:is_geocoding_exact) %>% 
  rename(state = State)

# For clearer variable names
police_shootings_df$race[police_shootings_df$race == "W"] <- "White, non-Hispanic"
police_shootings_df$race[police_shootings_df$race == "B"] <- "Black, non-Hispanic"
police_shootings_df$race[police_shootings_df$race == "A"] <- "Asian"
police_shootings_df$race[police_shootings_df$race == "N"] <- "Native American"
police_shootings_df$race[police_shootings_df$race == "H"] <- "Hispanic"
police_shootings_df$race[police_shootings_df$race == "O"] <- "Other"
police_shootings_df$race[police_shootings_df$race == ""] <- "Unknown"

police_shootings_df$gender[police_shootings_df$gender == "M"] <- "Male"
police_shootings_df$gender[police_shootings_df$gender == "F"] <- "Female"
police_shootings_df$gender[police_shootings_df$gender == ""] <- "Unknown"

police_shootings_df$name[police_shootings_df$name == ""] <- "Unknown"

police_shootings_df$armed[police_shootings_df$armed == ""] <- "unknown"

police_shootings_df$age[is.na(police_shootings_df$age)] <- "Unknown"

police_shootings_df$flee[police_shootings_df$flee == ""] <- "Unknown"

# Visualization variables ------------------------------------------------------

# Map visualization style
g <- list(
  scope = 'usa',
  projection = list(type = 'albers usa'),
  showland = TRUE,
  landcolor = toRGB("gray95"),
  subunitcolor = toRGB("gray10"),
  countrycolor = toRGB("gray10"),
  countrywidth = 0.5,
  subunitwidth = 0.5
)


#Bar Graph Visualization information
armed_visualization <- police_shootings_df %>% 
  mutate(Victims = 1) %>% 
  group_by(armed) %>% 
  summarise(Victims = sum(Victims)) %>% 
  arrange(-Victims) %>% 
  slice_head(n = 7)

my_bar_colors <- c("#9e6702", "#71a35b", "#8a0606", 
                   "#a16d62", "#dede02", "#029e7a",
                   "#8a0674")


# Data information changed for the Pie graphs.
pie_visualization <- police_shootings_df %>% 
  rename("Signs of Mental Illness" = signs_of_mental_illness) %>% 
  rename("Threat Level" = threat_level) %>% 
  rename("Victim Fleeing" = flee) %>% 
  rename("Wearing Camera" = body_camera)


# Summary ------------------------------------------------------------------
population_data <- read.csv("data/pop_by_state.csv", stringsAsFactors = FALSE) %>% 
  select(STATE,STATEID, POPESTIMATE2019)

summary_shootings <- police_shootings_df %>% 
  group_by(state) %>% 
  mutate(Victims = 1) %>% 
  summarise(Victims = sum(Victims))

state_victims_pop_data <- summary_shootings %>% 
  left_join(population_data, by = c("state" = "STATE")) %>% 
  mutate(Pop_Per_100k = (POPESTIMATE2019/100000)) %>% 
  mutate(Victims_Per_100k = round((Victims/Pop_Per_100k), 2))

pop_map_geo <- list(
  scope = 'usa',
  projection = list(type = 'albers usa'),
  showlakes = TRUE,
  lakecolor = toRGB('white')
)

victims_by_race <- police_shootings_df %>% 
  mutate(count = 1) %>% 
  filter(race != "Unknown") %>% 
  group_by(race) %>% 
  summarise(count = sum(count))

# Report -----------------------------------------------------------------
shootings <- read.csv("data/fatal-police-shootings-data.csv", stringsAsFactors = FALSE) %>% 
  mutate(Victims = 1) %>% 
  group_by(race) %>% 
  summarise(Victims = sum(Victims)) %>% 
  mutate(prop = round(Victims/(sum(Victims)/100), 2))

# This takes in the same data as above, but does not wrangle it.
prop_state_data <- read.csv("data/fatal-police-shootings-data.csv", stringsAsFactors = FALSE)

# This is used to compare states with populations.
population_data <- read.csv("data/pop_by_state.csv", stringsAsFactors = FALSE) %>% 
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

summary_info$fleeing_percent <- prop_state_data %>% 
  mutate(Victims = 1) %>% 
  group_by(flee) %>% 
  summarise(Victims = sum(Victims)) %>% 
  mutate(prop = round(Victims/(sum(Victims)/100), 2)) %>% 
  filter("Not fleeing" == flee) %>% 
  pull(prop)

