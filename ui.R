# ---- app6-ui ----

library(shiny)
library(leaflet)
library(shinydashboard)


rsconnect::setAccountInfo(name='ziqin',
                          token='2A2E2CBD2F94143669132C2D7ED5FB53',
                          secret='iqCNUUBssJl1SoOV/zjCNYHChhewG9BDFFR6btBi')

library(rsconnect)
rsconnect::deployApp('D:/study/MUSA620/musa620_12/assignment')


dashboardPage(skin = "black",
  dashboardHeader(title = "Chicago Inspection"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Map of Baltimore", tabName = "map", icon = icon("map")),
      menuItem("Graphs & Metrics", tabName = "graphs", icon = icon("signal", lib = "glyphicon")),
      menuItem("About", tabName = "about", icon = icon("question-circle")),
      menuItem("Source Code", href = "http://github.com/seankross/Baltimore_Crime_Browser", icon = icon("github-alt"))
    )
  ),
  
  dashboardBody(
    tabItems(
      tabItem(tabName ="map",
      fluidRow(
        column(width = 8,
               box(width = NULL,
                   leafletOutput("mymap", height = 500))
        ),
        column(width = 3,
               box(width = NULL,
                   dateRangeInput("date1", "Select dates to visualize.",
                                  start = "2016-01-01", end = "2016-06-31"
                    )),
               box(width = NULL,
                   h3("Number of Crimes"),
                   h4(textOutput("total_crimes"))),
               box(width = NULL,
                   h3("Most Common Crime"),
                   h4(textOutput("common_crime"))),
               box(width = NULL,
                   h3("Day of the Week with the Most Crime"),
                   h4(textOutput("weekday_crime")))

          )
      )
      ),
               
      
      tabItem(tabName = "graphs",
      fluidRow(
        column(width = 6,
               box(width = NULL,
                   plotOutput("daily_plot"))),
        column(width = 6,
               box(width = NULL,
                   plotOutput("desc_plot")))
      ),
      fluidRow(
        column(width = 3,
               box(width = NULL,
                   dateRangeInput("date2", "Select dates to visualize.",
                                  start = "2015-06-01", end = "2015-07-01"
                                  #min = min(crime$CrimeDate), max = max(crime$CrimeDate)
                                  )
               )
        )
      )
      )
      
      #tabItem(tabName = "about",
      #fluidRow(
       # column(width = 6,
       #        box(width = NULL,
      #             includeMarkdown("about.md")))
      #)
      #)
      
      
      
      
    )
  )
)