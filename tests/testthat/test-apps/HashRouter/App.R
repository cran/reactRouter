library(shiny)

ui <- fluidPage(
  reactRouter::HashRouter(
    reactRouter::NavLink.shinyInput(
      inputId = "NavLinkHome",
      to = "/",
      "Home"
    ),
    div(),
    reactRouter::NavLink.shinyInput(
      inputId = "NavLinkPage",
      to = "page",
      "Page"
    ),
    hr(),
    reactRouter::Routes(
      reactRouter::Route(
        path = "/",
        element = div(
          uiOutput(outputId = "outputHome")
        )
      ),
      reactRouter::Route(
        path = "page",
        element = div(
          uiOutput(outputId = "outputPage")
        )
      )
    )
  )
)

server <- function(input, output, session) {
  output$outputHome <- renderUI({
    p("home content")
  })
  output$outputPage <- renderUI({
    p("page content")
  })
  # observe({
  #   # print full URL hash
  #   client_data <- reactiveValuesToList(session$clientData)
  #   url_hostname <- client_data$url_hostname
  #   url_port <- client_data$url_port
  #   url_hash <- client_data$url_hash
  #   print(paste0(url_hostname, ":", url_port, "/", url_hash))
  # })
}

shinyApp(ui, server)
