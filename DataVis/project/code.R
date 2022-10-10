library(tidyverse)
library(ggplot2)
library(dplyr)

dat <- read_csv("project/data.csv")
dat <- dat %>% select(c("countryName","eprtrSectorName","facilityName","Longitude","Latitude","City","pollutant","emissions","reportingYear"))

samp <- sample_n(dat, 50)

summarize(samp %>% group_by(eprtrSectorName),
          mean = mean(emissions, na.rm=TRUE))

plot(samp$reportingYear, dat$emissions, main = "Emissions each year",
     xlab = "Emission Year", ylab = "Kg of pollutant",
     pch = 19)

ggplot(dat, aes(
  x = reportingYear,
  y = emissions,
  color=eprtrSectorName)) +
  geom_point() +
  geom_line()
