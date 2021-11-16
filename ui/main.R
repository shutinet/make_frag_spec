shiny::tags$div(
	shinydashboard::box(width = 3, 
		DT::dataTableOutput("input_table"), 
		shiny::tags$div(style = "text-align: center", 
			shinyWidgets::actionBttn("draw", "Draw")
		)
	), 
	shinydashboard::box(width = 4, 
		plotly::plotlyOutput("mass_spec")
	)
)