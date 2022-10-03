library(shiny)
library(tidyverse)

#####Import Data
dat <- read_csv("DataExerciseShinyApps.csv")
dat <- dat %>% select(c("pid7","ideo5"))

#pid7: Generally speaking, do you think of yourself as a...?
# 1 Strong Democrat
# 2 Not very strong Democrat
# 3 Lean Democrat
# 4 Independent
# 5 Lean Republican
# 6 Not very strong Republican
# 7 Strong Republican

#ideo5: In general, how would you describe your own political viewpoint?
# 1 Very liberal
# 2 Liberal
# 3 Moderate
# 4 Conservative
# 5 Very conservative

#remove missing values 
dat <- drop_na(dat)

ui <- fluidPage(
  
  titlePanel("American political parties and viewpoints"),
  
  sidebarLayout(
    sidebarPanel(
      sliderInput("ideologyId",
                  "Select Five Point Ideology (1 = Very liberal, 5 = Very conservative)",
                  min = 1,
                  max = 5,
                  value = 3)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("distPlot")
    )
  )
)

server <- function(input, output) {
  
  output$distPlot <- renderPlot({
    
    temp = dat %>%
      filter(ideo5==input$ideologyId)
    x    <-  temp$pid7
    
    hist(x,
         breaks=seq(from=0, to=7, by=1),
         col = 'darkgray', border = 'black',
         xlab = '7 Point Party ID, 1 = very D, 7 = Very R',
         ylab = 'Count',
         main = 'Histogram of political parties')
  })
}

shinyApp(ui,server)
