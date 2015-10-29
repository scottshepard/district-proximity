# Districts in Proximity

Find districts within a given proximity.

Given a location (lat and long), and a distance in miles, 
return a table of American public school districts that 
fall within x miles of that point.

## Data

The data ultimately come from the [National Center for Education Statistics](https://nces.ed.gov/).  

Proximately, the data come from the [R school districts data package](https://github.com/scottshepard/schooldistricts) 
that nicely loads the data in an R readable format.

## Run locally

Install R at CRAN or through Homebrew

https://cran.r-project.org/

Clone and cd into the repo.

Open up an R instance on the terminal 

    R
		
Install the needed packages

    install.packages("shiny", "devtools")
		devtools::install_github("scottshepard/schooldistricts")

Run the app

    shiny::runApp()
