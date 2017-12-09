library(shiny)
library(miniUI)

myFirstGadget <- function (numbers1, numbers2){
    ui <- miniPage(
        gadgetTitleBar("My First Gadget"),
        miniContentPanel(
            selectInput("num1", "First Number", choices = numbers1),
            selectInput("num2", "Second Number", choices = numbers2)
        )
    )
    server <- function(input,output,session){
        observeEvent(input$done, {
            num1 <- as.numeric(input$num1)
            num2 <- as.numeric(input$num2)
            stopApp( num1 * num2)        
        })
    }
    runGadget(ui, server)
}

pickTrees <- funciton() {
    ui <- miniPage(
        gadgetTitleBar("Select pOINTS BY dRagging"),
        miniContentPanel(
            plotOutput("plot", height = "100%", brush = "brush")
        )
    )
    server <- function(input, output, session){
        output$plot <- renderPlot({
            plot(trees$Girth, trees$Volume, main = "Trees", xlab="Girth", ylab="Volume")
        })
        observeEvent(input$done, {
            stopApp(brushedPoints(trees, input$brush, xvar = "Girth", yvar = "Volume"))
        })
    }
    runGadget(ui, server)
}

