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
                mainPanel(plotOutput("chart"))
        ))
)