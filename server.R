# ---- app6-server ----

library(shiny)
library(dplyr)
library(leaflet)
library(ggplot2)
library(lubridate)



shinyServer(function(input, output,session) {
  
  filtered_food <- reactive({
    input$date1
    
    isolate({
      food %>%
        filter(FoodDate >= input$date1[1]) %>%
        filter(FoodDate <= input$date1[2])
    })
  })
  
  observe({
    input$date1
    
    updateDateRangeInput(session, "date2",
                         "Select dates to visualize.",
                         start = input$date1[1],
                         end = input$date1[2],
                         min = min(food$FoodDate), max = max(food$FoodDate))
  })
  
  observe({
    input$date2
    
    updateDateRangeInput(session, "date1",
                         "Select dates to visualize.",
                         start = input$date2[1],
                         end = input$date2[2],
                         min = min(food$FoodDate), max = max(food$FoodDate))
  })
  
  
  
  
  
  output$mymap <- renderLeaflet({
    filtered_food() %>%
      leaflet() %>% 
      setView(lng = "-87.624160", lat = "41.872861", zoom = 10) %>%
      addProviderTiles(providers$Stamen.Toner)%>%
      addMarkers(clusterOptions = markerClusterOptions(),
                 popup = ~Address)
  })
  
  output$total_crimes <- renderText({
    as.character(nrow(filtered_food()))
  })
  
  output$common_crime <- renderText({
    names(tail(sort(table(filtered_food()$Risk)), 1))
  })
  
  output$weekday_crime <- renderText({
    names(tail(sort(table(wday(filtered_food()$FoodDate, label = TRUE, abbr = FALSE))), 1))
  })
  
  output$daily_plot <- renderPlot({
    daily_crime <- filtered_food() %>%
      group_by(FoodDate) %>%
      dplyr::summarize(Crimes_Per_Day = n())
    
    ggplot(daily_crime, aes(FoodDate, Crimes_Per_Day)) + geom_line()
  })
  
  output$desc_plot <- renderPlot({
    desc_crime <- filtered_food() %>%
      group_by(Risk) %>%
      dplyr::summarize(Total = n())
    
    ggplot(desc_crime, aes(Risk, Total)) + geom_bar(stat = "identity") + coord_flip()
  })
  
  
  
  
  
}
)