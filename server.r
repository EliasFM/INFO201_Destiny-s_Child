if(!require(dplyr))install.packages("dplyr", repos = "http://cran.us.r-project.org")
if(!require(ggplot2))install.packages("ggplot2", repos = "http://cran.us.r-project.org")
if(!require(rsconnect))install.packages("rsconnect", repos = "http://cran.us.r-project.org")
if(!require(shiny))install.packages("shiny", repos = "http://cran.us.r-project.org")
if(!require(data.table))install.packages("data.table", repos = "http://cran.us.r-project.org")
library(dplyr)
library(ggplot2)
library(data.table)
library(shiny)

#if you want to reedit the main data set
# data <- fread("./Data/medicaredata.csv")
# working_data <- data %>%
#   select(nppes_provider_city, nppes_provider_state, drug_name, generic_name, bene_count, total_claim_count, total_day_supply, total_drug_cost, total_claim_count_ge65, total_day_supply_ge65, total_drug_cost_ge65, bene_count_ge65)
# fwrite(working_data, "./Data/working_data.csv")
dollarConv <- function(cost){
  final <- as.numeric(gsub('[$,]', '', cost))
}
brand_vs_drug <- working_data %>%
  select(drug_name, generic_name, bene_count, total_drug_cost, bene_count_ge65, total_drug_cost_ge65) %>%
  group_by(drug_name, generic_name) %>%
  summarize(bene_count = sum(bene_count) , total_drug_cost = sum(dollarConv(total_drug_cost)), bene_count_ge65 = sum(bene_count_ge65), total_drug_cost_ge65 = sum(dollarConv(total_drug_cost_ge65))) %>%
  arrange(generic_name)

#basic framework, needs to be completely cleared out and rewritten
my.server <- function(input, output) {
  working_data <- fread("./Data/working_data.cv")
  

  var1 <- reactive({
    
  })
  

  var2 <- reactive({
    
  })
  
  output$proteinComparison <- renderPlot(height = 900, width = 800, {
    
  })
  
  
}

shinyServer(my.server)
