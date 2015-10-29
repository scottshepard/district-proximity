
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(schooldistricts)

shinyServer(function(input, output) {

  districts <- reactive({
    districtproximity::districtsWithinRange(as.numeric(input$lat), as.numeric(input$long), input$radius)
  })
  
  output$districts_table <- renderDataTable({
    districts()
  })
  
  output$download_districts_table <- downloadHandler(
    filename = function() {
      paste0("Disticts_within_",round(input$radius), "_miles_of_lat_", input$lat, "_long_", input$long)},
    content = function(file) {
      write.csv(districts(), file)
    }
  )
})
