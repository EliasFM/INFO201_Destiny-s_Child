states_dropdown <-
  c(
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


my.ui.state.drugs <- fluidPage(
  
  
  
  
  ## State Generic Drug Usage
  h3('State Generic Drug Usage'),
  p("This visualization helps policymakers understand the most commonly used drugs in a given state. Through this,
  policymakers can compare which drugs are most commonly used to the costs imposed by these said drugs. This can help 
  policymakers better understand which drugs burden the Medicare social security program most heavily so they may focus on those drugs as 
  part of their policy reform"),
  
  sidebarLayout(
    sidebarPanel(

      #allows user to choose which state they want to see data for
      selectInput("state", "State or territory:", states_dropdown),
      radioButtons("chart", "Select a format",
                   c("Chart" = "chart", "Table" = "table")),
      
      #allows users to choose what order they want the data displayed as
      conditionalPanel(condition = "input.chart == 'chart'",
                       radioButtons(
                         "sort",
                         "Sort by:",
                         choices = list("Ascending" = "asc", "Descending" = "desc")
                       )
      ),
      #allows user to choose if they want the bottom or the top of the data chart
      conditionalPanel(condition = "input.chart == 'chart'",
                       radioButtons(
                         "rankBy", "Rank by",
                         choices = list("Top" = "top", "Bottom" = "bot")
                       )),
      
      width = 3,
      tableOutput("data")

    ),
    
    #renders the graph from the server
    mainPanel(

      conditionalPanel(condition = "input.chart == 'chart'",  plotOutput("drugstate")),
      conditionalPanel(condition = "input.chart == 'table'",  dataTableOutput('dt'))
      
    )
  )
  
  
)


my.ui.state.money <- fluidPage(
  
  ##State Monetary Utilization
  
  h3("State Monetary Utilization"),
  p("This visualization further emphasizes the total costs of drugs on Medicare by state.
  By comparing this information to population size and drugs used most commonly, policymakers can assess where funds are being used efficently
on a state level and use this information to develop effective future reforms for Medicare."),
  sidebarLayout(
    sidebarPanel(
      #allows user to choose how they want to see the data displayed
      radioButtons("sorted", "Sort By",
                   c("Alphabetical" = "alphabetical", "Descending" = "descending", "Ascending" = "ascending"))
    ), 
    #renders graph for the data
    mainPanel(
      plotOutput("compare")
    )
  )
  
)

#displays the necessary information so that the user knows what all of the data means and
#the issue we are trying to solve
my.ui.background <- fluidPage(
  ##Background
  
  h3(
    'Relevance of Medicare Visualizations'
  ),
  p(
    'This data helps policymakers and constituents alike understand the sustainability of Medicare as a social security program.
    Medicare is a federally funded health insurance program funded by taxpayers for those over 65 or those who are disabled. In 
    recent years, the issue of whether or not the state can continue to fund the program in light of reduced population sizes has become
    a hot political issue. Reformation of these programs has become politically contentious as it may result in lower re-election chances
    and issues with raising taxes to continue these programs are highly unfavorable. Therefore, these visualizations set out to better understand
    the costs imposed by specific drugs and states alike as an exploration into a relevant policy issue.'
  ),
  
  
  p('Some interesting further reading on the topic can be found here:'),
  tags$ol(
    tags$li(
      a(href="https://www.forbes.com/sites/nextavenue/2017/08/29/when-can-you-expect-social-security-reform/#3bee315d32d6l", "When Can You Expect Social Security Reform")),
    tags$li(
      a(href="http://time.com/money/4547505/election-2016-social-security-donald-trump-hilary-clinton/", "Partisan Plans for Social Security Reform")),
    tags$li(
      a(href="https://www.ssa.gov/policy/docs/ssb/v70n3/v70n3p111.html", "The Future Financial Status of the Social Security Programs"))
  ),
  h3("Source"),
  p("The data was sourced from:", a(href = "https://data.cms.gov/Medicare-Part-D/Medicare-Provider-Utilization-and-Payment-Data-201/3z4d-vmhm",
                                      "Center for Medicare and Medicade Services")),
  h3("Credits"),
  p('Bethany Johnson, Elias Mendel, Karissa Shapard, Kevin Zhang')
  
)
#creates the tabs on the html document
shinyUI(navbarPage( "Medicare Utilization",
                    tabPanel("State Generic Drug Usage", my.ui.state.drugs),
                    tabPanel("State Monetary Utilization", my.ui.state.money),
                    tabPanel("Background", my.ui.background)
))

