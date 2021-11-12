library(shiny)
library(shinydashboard)
dashboardPage(
  dashboardHeader(),
  dashboardSidebar(),
  dashboardBody()
)

# data import
animals <- read.csv("D:/work3/Animal/Austin_Animal_Center_Intakes.csv")
head(animals)


# the user interface

ui <- dashboardPage(
  dashboardHeader(title = 'DOG ADOPTION IN AUSTIN'),
  #Sidebar layout
  dashboardSidebar(width = 290,
                   sidebarMenu(menuItem("Plots", tabName = "plots", icon = icon('poll')),
                               menuItem("Dashboard", tabName = "dash", icon = icon('tachometer-alt')))),

  #Tabs layout
  dashboardBody(tags$head(tags$style(HTML('.main-header .logo {font-weight: bold;}'))),
                #Plots tab content
                tabItems(tabItem('plots', 
                                 #Histogram filter
                                 box(status = 'primary', title = 'Filter for the histogram plot',
                                     selectInput('num', "Numerical variables:", c('Temperature', 'Feeling temperature', 'Humidity', 'Wind speed', 'Casual', 'New', 'Total')),
                                     footer = 'Histogram plot for numerical variables'),
                                 #Frequency plot filter
                                 box(status = 'primary', title = 'Filter for the frequency plot',
                                     selectInput('cat', 'Categorical variables:', c('DateTime', 'MonthYear', 'Found.Location', 'Intake.Type', 'Intake.Condition', 'Sex.Upon.Intake', 'Breed', 'Color')),
                                     footer = 'Frequency plot for categorical variables'),
                                 #Boxes to display the plots
                                 box(plotOutput('histPlot')),
                                 box(plotOutput('freqPlot'))),
                         
                         #Dashboard tab content
                         tabItem('dash',
                                 #Dashboard filters
                                 box(title = 'Filters', status = 'primary', width = 12,
                                     splitLayout(cellWidths = c('4%', '42%', '40%'),
                                                 div(),
                                                 radioButtons('MOnthYear', 'MOnthYear:', c('2013 and 2014', '2015', '2019')),
                                                 radioButtons('condition', 'condition choice:', c('Normal', 'SIck', 'Injured')))),
                                 #Boxes to display the plots
                                 box(plotOutput('linePlot')),
                                 box(plotOutput('barPlot'), 
                                     height = 550, 
                                     h4('condition interpretation:'),
                                     column(6, 
                                            helpText('- Good: In good condition.'),
                                            helpText('- Fair: sick or injured.')),
                                     helpText('- Bad: '),
                                     helpText('- Very Bad: '))),
                         
                         
                )
  )

)



#########################   The server  ############################
server <- function(input, output) { }
shinyApp(ui, server)
