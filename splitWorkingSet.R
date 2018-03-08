if (!require(data.table))
  install.packages("data.table", repos = "http://cran.us.r-project.org")
if(!require(dplyr))
  install.packages("dplyr", repos = "http://cran.us.r-project.org")
if (!require(ggplot2))
  install.packages("ggplot2", repos = "http://cran.us.r-project.org")
if (!require(rsconnect))
  install.packages("rsconnect", repos = "http://cran.us.r-project.org")
if (!require(shiny))
  install.packages("shiny", repos = "http://cran.us.r-project.org")
library(dplyr)
library(ggplot2)
library(data.table)
library(shiny)
library(rlang)
library(data.table)

# Create working_data.csv
data <- fread("./Data/medicaredata.csv")
working_data <- data %>%
  select(nppes_provider_city, nppes_provider_state, drug_name, generic_name, bene_count, total_claim_count, total_day_supply, total_drug_cost, total_claim_count_ge65, total_day_supply_ge65, total_drug_cost_ge65, bene_count_ge65)

#converts dollar string to integer
dollarConv <- function(cost){
  final <- as.numeric(gsub('[$,]', '', cost))
}

#state medicare information, turns money into out of millions
silver_populations_state <- working_data %>%
  select(nppes_provider_state, bene_count, total_claim_count, total_day_supply, total_drug_cost) %>%
  group_by(nppes_provider_state) %>%
  summarise(bene_count = sum(bene_count) , total_claim_count = sum(total_claim_count), total_day_supply = sum(total_day_supply), total_drug_cost = sum(dollarConv(total_drug_cost))) %>%
  arrange(nppes_provider_state)
fwrite(silver_populations_state, "./Data/silver_state.csv")



# INSTRUCTIONS: RUN THIS ONE TIME AFTER YOU GENERATE working_data.csv
# Creates: /data/state/[state].csv
# This significantly accelerates initial load times
dumpToFile <- function (state) {
  filename = paste0('data/state/', state, '.csv')
  # Filter one state only and write to csv
  filtered_state = working_data %>% 
    filter(nppes_provider_state == state) %>%
    group_by(generic_name) %>%
    summarise(claim_count = sum(total_claim_count))
  fwrite(filtered_state, filename)
}

states_dropdown = c(
  "AA",
  "AE",
  "AK",
  "AL",
  "AP",
  "AR",
  "AS",
  "AZ",
  "CA",
  "CO",
  "CT",
  "DC",
  "DE",
  "FL",
  "GA",
  "GU",
  "HI",
  "IA",
  "ID",
  "IL",
  "IN",
  "KS",
  "KY",
  "LA",
  "MA",
  "MD",
  "ME",
  "MI",
  "MN",
  "MO",
  "MP",
  "MS",
  "MT",
  "NC",
  "ND",
  "NE",
  "NH",
  "NJ",
  "NM",
  "NV",
  "NY",
  "OH",
  "OK",
  "OR",
  "PA",
  "PR",
  "RI",
  "SC",
  "SD",
  "TN",
  "TX",
  "UT",
  "VA",
  "VI",
  "VT",
  "WA",
  "WI",
  "WV",
  "WY",
  "XX",
  "ZZ"
)
for (i in states_dropdown) {
  dumpToFile(i)
}

