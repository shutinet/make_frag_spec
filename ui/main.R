shiny::tags$div(
	shinydashboard::box(width = 3, 
		DT::dataTableOutput("input_table"), 
		shiny::tags$div(style = "text-align: center", 
			shinyWidgets::actionBttn("draw", "Draw")
		), 
		shiny::tags$hr(), 
		shiny::column(width = 6, 
			shiny::numericInput("ymin", "y min", value = 0)
		),
		shiny::column(width = 6, 
			shiny::numericInput("ymax", "y max", value = 100)
		)		
	), 
	shinydashboard::box(width = 4, 
		plotly::plotlyOutput("mass_spec")
	)
)