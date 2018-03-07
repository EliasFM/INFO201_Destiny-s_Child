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
# 
# silver_populations_state <- working_data %>%
#   select(nppes_provider_state, bene_count, total_claim_count, total_day_supply, total_drug_cost) %>%
#   group_by(nppes_provider_state) %>%
#   summarise(bene_count = sum(bene_count) , total_claim_count = sum(total_claim_count), total_day_supply = sum(total_day_supply), total_drug_cost = sum(dollarConv(total_drug_cost))) %>%
#   arrange(nppes_provider_state)
# 
# fwrite(silver_populations_state, "./Data/silver_state.csv")
# 

#basic framework, needs to be completely cleared out and rewritten
my.server <- function(input, output) {


  var1 <- reactive({
    
  })
  

  var2 <- reactive({
    
  })

    
    silver <- silver_populations_state$total_drug_cost %>% arrange_(sort)
    
  
  
  output$compare <- renderPlot(height = 600, width = 600, {
    ggplot(silver, aes(x = nppes_provider_state, y = total_drug_cost)) + geom_col() +
        coord_flip() + labs(title = "Total Cost of Drugs per State", x = "Total Drug Cost", y = "State")
  })
  
  
}

shinyServer(my.server)
