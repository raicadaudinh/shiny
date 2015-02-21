library(shiny)
data <- read.delim("data/mydata.txt", dec=",")
data$Value<- sapply(data$Value,function(x) as.numeric(gsub(",","",x)))

library(ggplot2)
shinyServer(
        function(input, output) {
                datacut<-reactive({
                        u<- (data$GEO==input$country) & (data$scenario==input$scenario)
                        data<- data[u,]
                        return(data)
                        })
                output$chart <- renderPlot({
                        data1<- datacut()
                        
                        plot(data1$Value~ data1$TIME, type="l")
                })
        }
)