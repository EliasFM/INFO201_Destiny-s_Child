if(!require(dplyr))
  install.packages("dplyr", repos = "http://cran.us.r-project.org")
if (!require(ggplot2))
  install.packages("ggplot2", repos = "http://cran.us.r-project.org")
if (!require(rsconnect))
  install.packages("rsconnect", repos = "http://cran.us.r-project.org")
if (!require(shiny))
  install.packages("shiny", repos = "http://cran.us.r-project.org")
if (!require(data.table))
  install.packages("data.table", repos = "http://cran.us.r-project.org")
if (!require(plotly))
  install.packages("plotly", repos = "http://cran.us.r-project.org")
library(dplyr)
library(ggplot2)
library(data.table)
library(shiny)
library(rlang)
library(plotly)


my.server <- function(input, output) {


  output$dt <- renderDataTable({
    # Render total data table directly. Just group and sum the claim count.
    
    filtered_state <-
      fread(file = paste0('data/state/', input$state, '.csv'),
               header = TRUE)
    return(as.data.frame(filtered_state))
  })
  

  output$drugstate <- renderPlot({
    withProgress(message = 'Building chart data, this may take a while...', value = 0, {
      
      # User can select the sort for plot
      if (input$sort == "asc") {
        sort <- paste0("", "claim_count")
        sorted_by <- "ascending"
      }
      
      if (input$sort == "desc") {
        sort <- paste0("desc(", "claim_count", ")")
        sorted_by <- "descending"
      }
      
      filtered_state <-
        fread(file = paste0('data/state/', input$state, '.csv'),
                 header = TRUE)
      incProgress(0.75, detail = "Loaded data, sorting now")
      incProgress(0.9, detail = "Rendering plot")
      
      # Use NSE here for arrange_() - see above
      # Rank top and bottom 40/-40
      if (input$rankBy == "bot") {
        datum <- filtered_state %>% arrange_(sort) %>% top_n(-40)
      }
      if (input$rankBy == "top") {
        datum <- filtered_state %>% arrange_(sort) %>% top_n(40)
      }
      
      # Tell ggplot2 have a factored frame already so don't try to reorder it
      # This way we can control sorting
      datum$generic_name <-
        factor(datum$generic_name, levels = datum$generic_name)
      
      # Ggplot is a use the GENERIC NAME and CLAIM COUNTS summed across all cities in this state
      x <- ggplot(datum, aes(x = generic_name, y = claim_count)) +
        geom_bar(stat = "identity", width = .5) +
        labs(
          title = paste0(
            "Top 40 (sorted ", sorted_by," / ",
            input$rankBy,
            " ranked) Total Claim Counts by Medication for State or Territory ",
            input$state
          ),
          caption = "source: https://data.cms.gov/Medicare-Part-D/Medicare-Provider-Utilization-and-Payment-Data-201/3z4d-vmhm"
        ) +
        theme(axis.text.x = element_text(
          angle = 90,
          hjust = 1,
          vjust = 0.2
        ))
      
      incProgress(1, detail = "Done")
      return(x)
    })
    
  }, height = 650)

}

shinyServer(my.server)