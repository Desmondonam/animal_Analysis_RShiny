library(shiny)

# ui object

# ui object
ui <- fluidPage(
  titlePanel(p("Spatial app", style = "color:#3474A7")),
  sidebarLayout(
    sidebarPanel(
      p("Made with", a("Shiny",
                       href = "http://shiny.rstudio.com"
      ), "."),
      img(
        src = "imageShiny.png",
        width = "70px", height = "70px"
      )
    ),
    mainPanel("main panel for outputs")
  )
)

# server()
# server()
server <- function(input, output){ }

# shinyApp()
shinyApp(ui = ui, server = server)
