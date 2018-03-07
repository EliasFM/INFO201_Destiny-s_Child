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

fluidPage(
  titlePanel('Project Name'),
  h3('Bethany Johnson, Elias Mendel, Karissa Shapard, Kevin Zhang'),
  p(
    'This data demonstrates the differences between generic drug pricing versus specific brand pricing.'
  ),
  p(
    'The data visualizations help insurance companies understand which drugs are reasonably priced compared to other drugs that
    have been intentionally raised in price. Through this, policy makers and insurance companies alike can promote good policy
    and pharmaceutical companies can be held responsible for ethical drug pricing when using government-funded health care.
    By identifying how the distribution of drug prices across states, policy makers can better utilize research to focus
    on which states utilize insurance funds most wastefully or perhaps focus on efficient use of funds as a model for future
    cases.'
  ),
  
  
  p('Some interesting further reading on the topic can be found here:'),
  HTML(
    '<ul>
    <li><a href="http://www.latimes.com/business/la-fi-hemophilia-drugs-cost-20180305-story.html">http://www.latimes.com/business/la-fi-hemophilia-drugs-cost-20180305-story.html</a></li>
    <li><a href="https://www.washingtonpost.com/business/economy/pharma-under-attack-for-drug-prices-started-an-industry-war/2017/12/29/800a3de8-e5bc-11e7-a65d-1ac0fd7f097e_story.html">https://www.washingtonpost.com/business/economy/pharma-under-attack-for-drug-prices-started-an-industry-war/2017/12/29/800a3de8-e5bc-11e7-a65d-1ac0fd7f097e_story.html</a></li>
    <li><a href="https://www.npr.org/sections/health-shots/2018/02/13/585183996/trumps-budget-proposal-swings-at-drug-prices-but-may-land-only-a-glancing-blow">https://www.npr.org/sections/health-shots/2018/02/13/585183996/trumps-budget-proposal-swings-at-drug-prices-but-may-land-only-a-glancing-blow</a></li>
    </ul><br>'
  ),
  
  sidebarLayout(
    sidebarPanel(
      selectInput("state", "State or territory:", states_dropdown),
      radioButtons("chart", "Select a format",
                   c("Table" = "table", "Chart" = "chart")),
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
                       )
      ),
      
      width = 3,
      tableOutput("data")
    ),
    mainPanel(
      conditionalPanel(condition = "input.chart == 'table'",  dataTableOutput('dt')),
      conditionalPanel(condition = "input.chart == 'chart'",  plotOutput("drugstate"))
    )
  )
  
  
  )