if(!require(dplyr))install.packages("dplyr", repos = "http://cran.us.r-project.org")
if(!require(ggplot2))install.packages("ggplot2", repos = "http://cran.us.r-project.org")
if(!require(rsconnect))install.packages("rsconnect", repos = "http://cran.us.r-project.org")
if(!require(shiny))install.packages("shiny", repos = "http://cran.us.r-project.org")
if(!require(data.table))install.packages("data.table", repos = "http://cran.us.r-project.org")
library(dplyr)
library(ggplot2)
library(data.table)
library(shiny)



my.server <- function(input, output) {
  silver_populations_state <- fread("./Data/silver_state.csv")
  var1 <- reactive({
    return(input$choice)
  })


  var2 <- reactive({
    return(input$radio)
  })
  
  output$a <- renderPlot(height = 900, width = 800, {
    ggplot(silver_populations_state) + geom_point(aes(x = nppes_provider_state, y = total_drug_cost))
  })
  
  
}

shinyServer(my.server)
