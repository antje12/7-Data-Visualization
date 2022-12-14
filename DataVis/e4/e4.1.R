#Practice 1
(2022-2020)/(2022-1992)*100

#Practice 2
studyYears = 2022-2020
lifeYears = 2022-1992
studyYears/lifeYears*100

#Practice 3
vector = c(4,5,8,11)
sum(vector)

#Practice 4
samples = rnorm(1000, mean=10, sd=1.4)

#Practice 5
plot(samples)

#Practice 6
help(sqrt)
?sqrt

#Practice 7
samples = rnorm(100)
plot(samples)

#Practice 8
P = seq(from=31, to=60, by=1)
Q = matrix(data=P, nrow=6, ncol=5)

#Practice 9
x1 = rnorm(100)
x2 = rnorm(100)
x3 = rnorm(100)

t = data.frame(
  a = x1,
  b = x1+x2, 
  c = x1+x2+x3)

plot(t)
sd(unlist(t))

#Practice 10
plot(t$a, type="l", ylim=range(t),
     lwd=3, col=rgb(1,0,0,0.3))
lines(t$b, type="s", lwd=2,
      col=rgb(0.3,0.4,0.3,0.9))
points(t$c, pch=20, cex=4,
       col=rgb(0,0,1,0.3))

#t$a = column "A" of dataframe "T"
#rgb = color (red, green, blue, alpha) (transparency)
#lwd = The line width, a positive number, defaulting to 1
#pch = Either an integer specifying a symbol or a single character to be used as the default in plotting points
#cex = A numerical value giving the amount by which plotting text and symbols should be magnified relative to the default

#Practice 11
dates=strptime( 
  c("20220925",
  "20221224",
  "20230607"),
  format="%Y%m%d")
gifts = c(0,4,6)
plot(dates, gifts)

#Practice 12
pkgs <- c("ggplot2", "dplyr", "tidyr",
          "mosaicData", "carData",
          "VIM", "scales", "treemapify",
          "gapminder", "ggmap", "choroplethr",
          "choroplethrMaps", "CGPfunctions",
          "ggcorrplot", "visreg",
          "gcookbook", "forcats",
          "survival", "survminer",
          "ggalluvial", "ggridges",
          "GGally", "superheat",
          "waterfalls", "factoextra",
          "networkD3", "ggthemes",
          "hrbrthemes", "ggpol",
          "ggbeeswarm")
install.packages(pkgs)

library(readr)
library(readxl)

d1 = read_csv("SalariesDataset/Salaries.csv")

#Practice 13
d2 = read_tsv("SalariesDataset/Salaries.txt")

#Practice 14
d3 = read_excel("SalariesDataset/Salaries.xlsx")

summary(d1)

#Guide
# https://rkabacoff.github.io/datavis/DataPrep.html

#Practice 15
library(dplyr)

temp = starwars %>%
  select(name, height, gender)

#Practice 16
temp = starwars %>%
  select(name, mass:species)

#Practice 17
temp = starwars %>%
  select(!c(birth_year, gender))

#Practice 18
temp = starwars %>%
  filter(sex=="female")

#Practice 19
temp = starwars %>%
  filter(sex=="female" & homeworld=="Alderaan")

#Practice 20
temp = starwars %>%
  filter(homeworld=="Alderaan" 
         | homeworld=="Coruscant"
         | homeworld=="Endor")

#Practice 21
temp = starwars %>%
  select(name, mass, height) %>%
  mutate(
    height = height / 2.54,
    mass = mass * 2.2
  )

#Practice 22
temp = starwars %>%
  select(name, mass, height) %>%
  mutate(
    heightcat = if_else(height > 180, "tall", "short")
  )

#Practice 23
temp = starwars %>%
  select(name, eye_color) %>%
  mutate(
    eye_color = if_else(eye_color %in% c("black", "blue", "brown"), eye_color, "other")
  )

#Practice 24
temp = starwars %>%
  select(name, mass, height) %>%
  mutate(
    height = ifelse(
      height < 75 | height > 200,
      NA,
      height)
  )

#Practice 25
temp = starwars %>%
  summarize(mean_height = mean(height, na.rm=TRUE), 
            mean_mass = mean(mass, na.rm=TRUE))

#Practice 26
temp = starwars %>%
  group_by(sex) %>%
  summarize(mean_height = mean(height, na.rm=TRUE), 
            mean_mass = mean(mass, na.rm=TRUE))

#Practice 27
temp = starwars %>%
  filter(sex == "female") %>%
  group_by(species) %>%
  summarize(mean_height = mean(height, na.rm=TRUE))

#Practice 28
library(tidyr)

wide_data = read.csv(
  file="wide_data.csv",
  header=TRUE)

long_data = wide_data %>%
  gather(key="key", 
         value="value", 
         sex:income)

#Practice 29
wide_data_new = long_data %>%
  spread(key, value)
