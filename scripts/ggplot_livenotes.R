# load libraries
library(tidyverse)

#first way
#install.packages("gapminder")
library(gapminder)

#second way
gapminder <- read.csv("data/gapminder_data.csv")

# simple plot
ggplot(gapminder, aes(x = gdpPercap, y = lifeExp)) +
  geom_point()

# Challenge 1
# Modify the example so that the figure shows how life expectancy has changed over time:

ggplot(gapminder, aes(x = year, y = lifeExp, colour = continent)) +
  geom_point()

# make it into lines
ggplot(gapminder, aes(x = year, y = lifeExp, by = country)) +
  geom_line(aes(colour = continent)) +
  geom_point()

#playing with the colours
ggplot(gapminder, aes(x = year, y = lifeExp, by = country)) +
  geom_line(colour = "blue") +
  geom_point()

ggplot(gapminder, aes(x = gdpPercap, y = lifeExp)) +
  geom_point(alpha = 0.5) +
  scale_x_log10()

ggplot(gapminder, aes(x = gdpPercap, y = lifeExp, colour = continent)) +
  geom_point(alpha = 0) +
  scale_x_log10()

ggplot(gapminder, aes(x = gdpPercap, y = lifeExp, colour = continent)) +
  geom_point(alpha = 1) +
  scale_x_

# add lm
ggplot(gapminder, aes(x = gdpPercap, y = lifeExp)) +
  geom_point(alpha = 0.5, size = 10) +
  scale_x_log10() +
  geom_smooth(method = "lm", size = 5)

# filter data
gapminder_small <- gapminder %>%
  filter(country %in% c("Canada", "Australia", "France", "United States"))

# plot your data
plot1 <- ggplot(gapminder_small, aes( x = year, y = lifeExp, colour = continent)) +
  geom_line() +
  facet_wrap(~ country)

#save plot
ggsave(plot1, file = "mynewplot.png")

# another way to save
ggplot(gapminder_small, aes( x = year, y = lifeExp, colour = continent)) +
  geom_line() +
  facet_wrap(~ country) +
  ggsave(file = "mynewplot2.png")


# filter data
gapminder %>%
  filter(country %in% c("Canada", "Australia", "France", "United States")) %>%
  ggplot( aes( x = year, y = lifeExp, colour = continent)) +
  geom_line() +
  facet_wrap(~ country)
