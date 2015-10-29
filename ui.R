
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(
  
  titlePanel("Search for Nearby Districts"),

  sidebarLayout(
    sidebarPanel(
      a("Geolocate an address", href="http://itouchmap.com/latlong.html", target="_blank"),
      HTML("<br><br>"),
      textInput("lat",
                "Latitude:"),
      textInput("long",
                "Longitude:"),
      sliderInput("radius",
                  "Radius to search in miles",
                  min = 1,
                  max = 250,
                  value = 40)
    ),
    

    # Show a plot of the generated distribution
    mainPanel(
      dataTableOutput("districts_table"),
      downloadButton('download_districts_table','Download Table')
    )
  )
))
