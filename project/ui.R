library(shiny)
data <- read.delim("data/mydata.txt", dec=",")

shinyUI(fluidPage(
        titlePanel("Europe Demography Projection 2015-2080"),
        
        sidebarLayout(
                sidebarPanel(
                        helpText("Create demographic maps with 
                                 information from the Eurostata data."),
                        
                        selectInput("country", 
                                    label = "Choose a variable to display",
                                    choices = as.character(unique(data$GEO)),
                                    selected = "European Union(28 countries)"),
                        radioButtons("scenario", "Choose a scenario", choices=c("Main Scenario"=1, "No migrant"=2, "Higher expectancy"=3, "Lower fertility rate"=4), selected = 1, inline = FALSE)    
                       
                       
                ),
                mainPanel(
                        tabsetPanel(
                                tabPanel("output", plotOutput("chart")),
                                tabPanel("Documentation", p(p("Hello, in this document I present how to use my first shiny app!! "),
                                                                    
                                                                    p("This application show us the projection of European Union's and its members' demography from 2015-2060(80) (depend on case)."),
                                                                    
                                                                    p("You can find the data in data folder. The raw data has been downloaded from Eurostat web page"),
                                                                    p("You can choose a country by the select bar."),
                                                                    p("Then You can choose a scenario for the projection."), 
                                                                    p("The projection changes from a scenario to another"),
                                                                    p("There are 4 scenarii in total: main scenario, a scenario when there are no migration, a scenario when we have a higher age expectancy and a scenario with lower fertility rate.")
                                )
                        )
                )
                )
        ))
)