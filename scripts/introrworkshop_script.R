
# Installing the tidyverse
#install.packages("tidyverse")
library(tidyverse)

# Load in the gapminder data
gapminder <- read.csv("data/gapminder_data.csv")
gapminder

# head command to view first few rows
head(gapminder)

# Using select to choose columns
gapminder_select <- select(gapminder, country, year, lifeExp, pop)
head(gapminder_select)

# Using the pipe
gapminder_select2 <- gapminder %>% select(country, year, lifeExp, pop)
head(gapminder_select2)

# Challenge quesion 1
x <- gapminder %>%
  select(continent, gdpPercap, lifeExp, year)

# Using filter for Canada
gapminder_canada <- gapminder %>%
  filter(country == "Canada")

# Using filter for numeric value
gapminder_LE <- gapminder %>%
  filter(lifeExp > 50)
head(gapminder_LE)

# Using filter for multiple conditions
gapminder_CLE <- gapminder %>%
  filter(country == "Canada", lifeExp > 80)
gapminder_CLE

# Using "or" instead
gapminder_or <- gapminder %>%
  filter(country == "Canada" | lifeExp > 80)

# Answer for challenge 2
y <- gapminder %>%
  filter(continent == "Africa", year >= 1980)

# Grab top or bottom x rows
z <- head(gapminder, n = 20)
u <- tail(gapminder, n = 20)

# Creating a new column with mutate()
gapminder_gdpBil <- gapminder %>%
  mutate(gdp_billion = gdpPercap * pop / 10^9)
head(gapminder_gdpBil)

# Combining functions with pipes
gapminder_multi <- gapminder %>%
  select(country, year, lifeExp, pop, gdpPercap) %>%
  filter(country == "Canada")

# Adding mutate to the pipes
gapminder_multi_2 <- gapminder %>%
  select(country, year, lifeExp, pop, gdpPercap) %>%
  filter(country == "Canada") %>%
  mutate(gdp_billion = gdpPercap * pop / 10^9)

# Using group_by and summarise
gapminder_grouped <- gapminder %>%
  group_by(country) %>%
  summarise(mean_LE = mean(lifeExp))
head(gapminder_grouped)

# Calcultaing mean and sd of gdp
gapminder_GDP <- gapminder %>%
  group_by(country) %>%
  summarise(mean_GDP = mean(gdpPercap), sd_GDP = sd(gdpPercap))
head(gapminder_GDP)

# Running left join
fruit1 <- read.csv("data/fruits_table1.csv")
fruit2 <- read.csv("data/fruits_table2.csv")

fruit_joined <- left_join(fruit1, fruit2, by = "FruitID")

# Final example
gapminder_final <- gapminder %>%
  select(country, year, pop, gdpPercap) %>%
  filter(year >= 1980) %>%
  mutate(gdp_bil = gdpPercap * pop / 10^9) %>%
  group_by(country) %>%
  summarise(mean_gdpbil = mean(gdp_bil), sd_gdpbil = sd(gdp_bil))
head(gapminder_final)

