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
  h1('Analysis of Medicare Drug Pricing'),
  p('This data demonstrates the cost imposed by each state and each drug through Medicare health insurance. Medicare health insurance is a federally funded
program for people who are 65 and older or disabled. It is funded by taxpayer money and falls under the branch of social security measures enacted by the government.
However, based on the cost imposed versus the population decrease generationally, these social security nets may not be sustainable long term. This data report is relevant because it
  helps policymakers visualize the costs of Medicare and thus, may have more support for reforming these programs long term. As it stands, reforming these programs is politically 
    contentious and hurts policymakers chances of re-election.'),
  
  
  p('Some interesting further reading on the topic can be found here:'),
    tags$li(
      a(href="https://www.forbes.com/sites/johnmauldin/2017/04/10/is-our-social-security-sustainable-lets-do-the-math/#789c346f3575","Is Our Social Security Sustainable? Lets Do The Math")), 
    tags$li(
      a(href="http://www.businessinsider.com/social-security-is-running-out-and-no-one-will-like-the-solution-2017-7", "Social Security Is Running Out")),
    tags$li(
      a(href="https://www.reuters.com/article/us-column-miller-socialsecurity/u-s-social-security-reform-the-clock-is-ticking-idUSKBN17M1BI", "U.S. Social Security reform: the clock is ticking")),
  
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