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

#Use mpg data and produce the following graph
library(dplyr)
library(ggrepel)

temp = mpg %>%
  group_by(class) %>%
  summarize(mean_cty = mean(cty, na.rm=TRUE), 
            mean_hwy = mean(hwy, na.rm=TRUE))

ggplot(data = temp,
       mapping = aes(x = mean_cty, y = mean_hwy, label=class)) +
  geom_point(color = "cornflowerblue",
             alpha = .7,
             size = 3) +
  geom_smooth(method = "lm") +
  geom_label_repel()

#Produce the following barchart for the diamond data set:
ggplot(diamonds, 
       aes(x = cut, 
           fill = clarity)) + 
  geom_bar(position = position_dodge(preserve = "single"))
