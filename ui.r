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
  sidebarLayout(
    
    sidebarPanel(
      
      radioButtons("choice", label = h3("Plot Choice"),
                   choices = c("Brand vs Generic" = 1, "State Utilization" = 2),
                   selected = 1
      ),
      
      radioButtons("radio", label = h3("RadioName"),
                   choices = c("1" = 1, "2" = 2, "3" = 3, "4" = 4), 
                   selected = 1
      )
      
      
      
    ),
    
    mainPanel(
      plotOutput("PlotName")
    )
  )
)

my.ui2 <- fluidPage(
  sidebarLayout(
    
    sidebarPanel(
      
      radioButtons("choice", label = h3("Silver"),
                   choices = c("Brand vs Generic" = 1, "State Utilization" = 2),
                   selected = 1
      ),
      
      radioButtons("radio", label = h3("RadioName"),
                   choices = c("1" = 1, "2" = 2, "3" = 3, "4" = 4), 
                   selected = 1
      )
      
      
      
    ),
    
    mainPanel(
      plotOutput("PlotName")
    )
  )
)

shinyUI(navbarPage( "Medicare Utilization",
                    tabPanel("Brand vs Generic", my.ui),
                    tabPanel("State Utilization", my.ui2)
))
