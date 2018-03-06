# setwd("/Users/Elias/Documents/UW/INFO_201/Assignments/INFO201_Destiny-s_Child")
# getwd()

if(!require(dplyr))install.packages("dplyr", repos = "http://cran.us.r-project.org")
if(!require(ggplot2))install.packages("ggplot2", repos = "http://cran.us.r-project.org")
if(!require(shiny))install.packages("shiny", repos = "http://cran.us.r-project.org")
library(dplyr)
library(ggplot2)
library(shiny)


#needs to be redone, just for framework
my.ui <- fluidPage(
  
  titlePanel("Name"),
  
  sidebarLayout(
    
    sidebarPanel(
      sliderInput("slide", label = h3("SlideName"), min = 0, 
                  max = 100, value = c(0, 100)
      ),
      
      radioButtons("radio", label = h3("RadioName"),
                   choices = list("1" = 1, "2" = 2, "3" = 3, "4" = 4), 
                   selected = 1
      )
      
    ),
    
    mainPanel(
      plotOutput("PlotName")
    )
  )
  
  
)

shinyUI(my.ui)