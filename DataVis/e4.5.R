#Guide
# https://rkabacoff.github.io/datavis/Univariate.html

library(ggplot2)
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x=cut, color=cut, fill=cut))

ggplot(data = pressure) +
  geom_line(mapping = aes(x=temperature, y=pressure))

data(Marriage, package = "mosaicData")
ggplot(Marriage, aes(x = age)) +
  geom_histogram(fill = "cornflowerblue", 
                 color = "white", 
                 bins = 20) + 
  labs(title="Participants by age", 
       subtitle = "number of bins = 20",
       x = "Age")
