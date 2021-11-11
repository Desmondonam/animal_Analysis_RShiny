library(shiny)

# ui object

ui <- fluidPage(
  titlePanel("title"),
  sidebarLayout(
    sidebarPanel("sidebar panel for inputs"),
    mainPanel("main panel for outputs")
  )
)

# server()
server <- function(input, output){ }

# shinyApp()
shinyApp(ui = ui, server = server)
