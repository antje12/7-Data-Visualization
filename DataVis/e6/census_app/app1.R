library(shiny)

ui <- fluidPage(

    titlePanel("censusVis"),

    sidebarLayout(
        sidebarPanel(
          helpText("Create demographic maps with information from the 2010 US Census. "),
          selectInput("select", h3("Choose a variable to display"), 
                      choices = list("Choice 1" = 1, "Choice 2" = 2,
                                     "Choice 3" = 3), selected = 1),
          sliderInput("slider", "Range of interest:",
                      min = 0, max = 100, value = c(25, 75))
        ),

        # Show a plot of the generated distribution
        mainPanel(
          textOutput("selected_var"),
          plotOutput("distPlot")
        )
    )
)

server <- function(input, output) {
  output$selected_var <- renderText(
    paste("You have selected", input$select)
  )
}

shinyApp(ui = ui, server = server)
