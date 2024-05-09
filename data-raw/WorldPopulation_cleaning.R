library(tidyverse)
library(readxl)

#Reading in the data, cleaning it up until we have our desired pivot_longer
worldpopdata <- read_excel('data-raw/World_Population.xlsx', sheet='ESTIMATES', range='A17:BZ306')
WorldPopulation = worldpopdata %>%
  filter(Type == "Country/Area") %>%
  rename("CountryName" = "Region, subregion, country or area *") %>%
  select("CountryName", 8:78)
WorldPopulationpiv <- WorldPopulation %>%
  pivot_longer(
    "1950":"2020",
    names_to  = 'Year',
    values_to = 'Population')
WorldPopulation = WorldPopulationpiv %>%
  mutate(Population = as.numeric(Population)) %>%
  mutate(Year = as.numeric(Year))


# Saving the data frame to the data/ directory as WorldPopulation.rda
usethis::use_data(WorldPopulation, overwrite = TRUE)
