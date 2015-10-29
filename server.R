library(shiny)
library(schooldistricts)

shinyServer(function(input, output) {

  districts <- reactive({
    districtsWithinRange(as.numeric(input$lat), as.numeric(input$long), input$radius)
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

districtsWithinRange <- function(lat, long, dist_in_miles) {
  # Fetch a data.frame of public school districts near some point
  df <- schooldistricts::publicschooldistricts
  df$dist_to_city <- geosphere::distm(
    df[, c("loc_LONG_centroid","loc_LAT_centroid")],
    c(long, lat)
  )
  df$dist_to_city_miles = df$dist_to_city * meterToMile()
  subset(df, dist_to_city_miles <= dist_in_miles)
}


meterToMile <- function() {
  # Numeric converter from meter to mile
  0.000621371
}
