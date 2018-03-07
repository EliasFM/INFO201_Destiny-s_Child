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
  p('This data demonstrates the differences between generic drug pricing versus specific brand pricing.
  The data visualizations help insurance companies understand which drugs are reasonably priced versus ones which
  intentionally raise prices. Through this, policy makers and insurance companies alike can promote good policy
  and pharmaceutical companies can be held responsible for ethical drug pricing when using government funded health care.
    By identifying how the distribution of drug prices differs across state lines, policy makers can better utilize research to focus
    on which states utilize insurance funds most wastefully or perhaps focus on efficient use of funds as a model for future
    cases.'),
  
  
  p('Some interesting further reading on the topic can be found here:'),
    tags$li(
      a(href="http://www.latimes.com/business/la-fi-hemophilia-drugs-cost-20180305-story.html","Drug Prices Soar for Rare Diseases")), 
    tags$li(
      a(href="http://www.washingtonpost.com/business/economy/pharma-under-attack-for-drug-prices-started-an-industry-war/2017/12/29/800a3de8-e5bc-11e7-a65d-1ac0fd7f097e_story.html?utm_term=.f0e861b04e15", "Pharma Under Attack for Drug Prices")),
    tags$li(
      a(href="http://www.npr.org/sections/health-shots/2018/02/13/585183996/trumps-budget-proposal-swings-at-drug-prices-but-may-land-only-a-glancing-blow", "Trump Proposes Lowering Drug Prices")),
  
  titlePanel("Name"),
  
  sidebarLayout(
    
    sidebarPanel(
        

      
    ),
    
    mainPanel(
      plotOutput("compare")
    )
  )
  
  
)


shinyUI(my.ui)