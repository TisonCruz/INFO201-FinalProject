
library(shiny)
library(tidyverse)

#scores <- read_delim("df.csv") %>% 
#mutate(newRegion = factor(Region)) %>% 
#  rename(Admission_Rate = "Admission Rate")
#head(scores)
#region <- unique(scores$Region)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("U.S College and University Admissions and SAT & ACT Scores"),

    # Sidebar with a slider input for number of bins 
    mainPanel(
      tabsetPanel(
        tabPanel("Introduction",
                 tags$img(src="hp-gallery-red-squareC-16x12.jpg"),
                 mainPanel(
                   h1("Project Overview"),
                   p("Has COVID-19 impacted the importance of SAT scores within
                      college admissions in the U.S? Due to quarantine lockdown,
                      many students across the country were forced to halt their
                      in person classes and exams. This created a lot of stress 
                      and anxiety within students who were trying to apply for 
                      colleges/universities. Although the SAT used to be a huge 
                      part of the admission process, many universities went 
                      test-optional in order to “reduce the demand on students”,
                      according to collegeboard. This report provides the 
                      relationship between math/verbal SAT and ACTscores and the
                      admission rate in colleges and universities in the U.S.
                      Specifically, we are trying to show how some schools are 
                      moving away from SAT scores and how it has less prevalence
                      than it used to."),
                   h2("Audience"),
                   p("Our main target audience would be students who are
                      planning to apply for universities/colleges. This
                      information allows them to gain more knowledge on the
                      correlation between SAT/ACT scores and admission rate,
                      in order to help them understand how important these
                      standardized tests may be. Another target audience are
                      colleges and universities. They may want to learn more
                      about the number of applicants received, enrollment, and
                      the SAT/ACT scores of their potential students, which can
                      influence their admissions decisions."),
                   h3("Data Source"),
                   p("The data that the report refers to is the",
                     a("Kaggle US College & University Admissions 2020-2021", href='https://www.kaggle.com/datasets/jfschultz/us-college-admisions-2021-rates-and-test-scores'),
                     "database. This
                   dataset provides the broad overview of U.S admissions for
                   each college/university per state."),
                   h4("Plots & Table"),
                   p("The four plots that we have created intend to show the
                      relationship of the math/verbal SAT and ACT scores and
                      admissions rate by region. The table intends to compare
                      the two plots.")
                 ))
      )
    ),
)
# Main/Home Page ^



# Define server logic required to draw a histogram
server <- function(input, output) {

    output$distPlot <- renderPlot({
        # generate bins based on input$bins from ui.R
        x    <- faithful[, 2]
        bins <- seq(min(x), max(x), length.out = input$bins + 1)

        # draw the histogram with the specified number of bins
        hist(x, breaks = bins, col = 'darkgray', border = 'white',
             xlab = 'Waiting time to next eruption (in mins)',
             main = 'Histogram of waiting times')
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
