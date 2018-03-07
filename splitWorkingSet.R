library(dplyr)
library(ggplot2)
library(data.table)
library(shiny)
library(rlang)

#if you want to reedit the main data set
# data <- fread("./data/r.csv")
# working_data <- data %>%
# select(nppes_provider_city, nppes_provider_state, drug_name, generic_name, bene_count, total_claim_count, total_day_supply, total_drug_cost, total_claim_count_ge65, total_day_supply_ge65, total_drug_cost_ge65, bene_count_ge65)
# fwrite(working_data, "./data/working_data.csv")

# Elias
data <- fread("./Data/medicaredata.csv")
working_data <- data %>%
select(nppes_provider_city, nppes_provider_state, drug_name, generic_name, bene_count, total_claim_count, total_day_supply, total_drug_cost, total_claim_count_ge65, total_day_supply_ge65, total_drug_cost_ge65, bene_count_ge65)
fwrite(working_data, "./Data/working_data.csv")


dollarConv <- function(cost){
  final <- as.numeric(gsub('[$,]', '', cost))
}

brand_vs_drug <- working_data %>%
  select(drug_name, generic_name, bene_count, total_drug_cost) %>%
  group_by(drug_name, generic_name) %>%
  summarize(bene_count = sum(bene_count) , total_drug_cost = sum(dollarConv(total_drug_cost))) %>%
  arrange(generic_name)


fwrite(brand_vs_drug, "./Data/brand_vs_drug.csv")


# Kevin
# INSTRUCTIONS: RUN THIS ONE TIME AFTER YOU GENERATE WORKING_DATA
# Creates: /data/state/[state].csv
# This significantly accelerates initial load times
acs_d <- read.csv(file='data/working_data.csv', header=TRUE)


dumpToFile <- function (state) {
  filename = paste0('data/state/', state, '.csv')
  # Filter one state only and write to csv
  filtered_state = acs_d %>% filter(nppes_provider_state == state)
  write.csv(filtered_state, filename)
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

