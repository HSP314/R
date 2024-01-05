# Created by H Patel
# Draft Version .01
# Note following items pending:
# Add a Shiny theme 
# Fully implement CDISC JSON standards
# https://www.cdisc.org/dataset-json


library(shiny)
library(haven)
library(jsonlite)

# Define the %||% function if not using purrr package
`%||%` <- function(a, b) {
  if (!is.null(a)) a else b
}

# Define the user interface
ui <- fluidPage(
  titlePanel("SAS to JSON Converter with Metadata"),
  sidebarLayout(
    sidebarPanel(
      fileInput("file1", "Choose SAS File",
                accept = c(".sas7bdat")),
      downloadButton("downloadData", "Download JSON")
    ),
    mainPanel(
      textOutput("fileName"),      # Display the uploaded file name
      textOutput("dataInfo"),      # Display the number of rows and columns
      tableOutput("contents"),     # Display the table
      uiOutput("progress_ui")      # UI for the progress bar
    )
  )
)

# Define server logic
server <- function(input, output, session) {
  
  # Reactive expression to read the SAS file
  data <- reactive({
    req(input$file1)  # Require the input before proceeding
    inFile <- input$file1
    read_sas(inFile$datapath)
  })
  
  # Extract and prepare metadata including attributes
  metadata <- reactive({
    req(input$file1)
    sasData <- data()
    
    # Extract column labels
    column_labels <- sapply(sasData, function(x) {
      attr(x, "label") %||% ""  # Use the label attribute, or "" if it doesn't exist
    })
    
    # Extract file attributes (adjust based on what's available/needed)
    attributes <- attributes(sasData)
    dataset_label <- attr(sasData, "label") %||% ""
    dataset_format <- attr(sasData, "format") %||% ""
    
    # Basic metadata - now including column labels and some file attributes
    meta <- list(
      fileName = input$file1$name,
      rowCount = nrow(sasData),
      columnCount = ncol(sasData),
      columnNames = colnames(sasData),
      columnLabels = column_labels,
      datasetLabel = dataset_label,
      datasetFormat = dataset_format,
      otherAttributes = attributes  # Or select specific attributes you need
    )
    return(meta)
  })
  
  # Show the file name
  output$fileName <- renderText({
    req(input$file1)
    paste("File uploaded:", input$file1$name)
  })
  
  # Show data information
  output$dataInfo <- renderText({
    sasData <- data()
    paste("Number of rows:", nrow(sasData), "Number of columns:", ncol(sasData))
  })
  
  # Render the table output
  output$contents <- renderTable({
    data()
  })
  
  # Progress bar UI
  output$progress_ui <- renderUI({
    req(input$file1)
    withProgress(message = 'Conversion in progress', value = 0, {
      for (i in 1:10) {
        incProgress(1/10)
        Sys.sleep(0.1)  # simulate a long process
      }
    })
    NULL
  })
  
  # Downloadable json file with metadata
  output$downloadData <- downloadHandler(
    filename = function() {
      paste(tools::file_path_sans_ext(input$file1$name), ".json", sep = "")
    },
    content = function(file) {
      sasData <- data()
      meta <- metadata()
      
      # Combine data and metadata
      combined <- list(metadata = meta, data = sasData)
      
      # Convert to JSON
      json_data <- toJSON(combined, pretty = TRUE)
      write(json_data, file)
    }
  )
}

# Run the application 
shinyApp(ui = ui, server = server)
