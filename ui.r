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
  p("This visualization helps drug advertisers understand the most commonly used drugs in a given state via Medicare. Through this,
  advertisers can choose which drugs to focus on when marketing to the target audience. Because it is a Medicare data set, the target audience in this case would 
    be the over 65 population in each state as those are the qualifications for Medicare health insurance. Drug manufacturers can determine which drugs are in demand for each state."),
  
  sidebarLayout(
    sidebarPanel(
      selectInput("state", "State or territory:", states_dropdown),
      radioButtons("chart", "Select a format",
                   c("Chart" = "chart", "Table" = "table")),
      conditionalPanel(condition = "input.chart == 'chart'",
                       radioButtons(
                         "sort",
                         "Sort by:",
                         choices = list("Ascending" = "asc", "Descending" = "desc")
                       )
      ),
      conditionalPanel(condition = "input.chart == 'chart'",
                       radioButtons(
                         "rankBy", "Rank by",
                         choices = list("Top" = "top", "Bottom" = "bot")
                       )),
      
      width = 3,
      tableOutput("data")
    ),
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
  By comparing this information to population size and drugs used most commonly, policymakers can assess where funds are being used efficiently
on a state level and use this information to develop effective future reforms for Medicare. By visualizing the data, we can see large differences between.
    The inference we can draw from this graph is which states bear the biggest burden on the Medicare system. From the graph, we can see California, New York, Florida
    and Texas impose the biggest costs on the Medicare health insurance. We can assume then that policymakers in these states have a vested interest in maintaining the current Medicare system
    in order to appeal to its constituents and therefore may be most opposed to reforming Medicare."),
  sidebarLayout(
    sidebarPanel(
      radioButtons("sorted", "Sort By",
                   c("Alphabetical" = "alphabetical", "Descending" = "descending", "Ascending" = "ascending"))
    ), 
    mainPanel(
      plotOutput("compare")
    )
  )
  
)

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
  
  h3("Takeaway for Future Analysis"),
  p("Based on the visualizations, there are several ways in which the data could be utilized more meaningfully for future cases. By comparing the population size of Medicare beneficiaries to total drug cost,
     poicymakers can better understand the costs imposed per person in a given state, region or city. This would help policymakers focus in on efficient reform for the program through a public health lens. Furthermore,
    claim count compared to rates of diseases could reflect which states are most unhealthy or which states prescribe drugs more liberally. Applying the Medicare data in cross-comparative analyses with relevant population, health
    age, gender, racial or even economic status would help policymakers and manufacturers better understand and appeal to their audiences/constituents."),
  
  h3("Credits"),
  p('Bethany Johnson, Elias Mendel, Karissa Shapard, Kevin Zhang')
  
)
shinyUI(navbarPage( "Medicare Utilization",
                    tabPanel("State Generic Drug Usage", my.ui.state.drugs),
                    tabPanel("State Monetary Utilization", my.ui.state.money),
                    tabPanel("Background", my.ui.background)
))

