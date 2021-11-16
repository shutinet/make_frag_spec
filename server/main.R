output$input_table <- DT::renderDataTable(data.frame(matrix(, nrow = 0, ncol = 3, 
	dimnames = list(c(), c("m/z", "12 ev", "14 ev"))), 
	check.names = FALSE), 
selection = 'none', rownames = FALSE, server = FALSE, 
extensions = c("Buttons"), options = list(dom = 'Bfrtip', fixedColumns = TRUE, 
columnDefs = list(list(className = "dt-head-center dt-center", targets = "_all")), 
info = FALSE, searching = FALSE, buttons = list(
	list(
		extend = "collection", 
		text = 'New', 
		action = htmlwidgets::JS("function(e, dt, node, config){
				dt.row.add([
					'<input type=\"number\" step=\"any\" value = 0></input>',
					'<input type=\"number\" step=\"any\" value = 0></input>',
					'<input type=\"number\" step=\"any\" value = 0></input>'
				]).draw(false);
			}"
	)), list(
		extend = "collection", 
		text = 'Delete', 
		action = htmlwidgets::JS("function(e, dt, node, config){
				var n_rows = dt.rows().count() - 1;
				if (n_rows >= 0) dt.row(n_rows).remove().draw(false);
			}"
))), language = list(emptyTable = "No m/z")))

output$mass_spec <- plotly::renderPlotly({
	input$input_table_draw
	data <- if (is.null(input$input_table_vals)) data.frame()
		else data.frame(matrix(as.numeric(input$input_table_vals), ncol = 3, byrow = TRUE))
	plot_MS(data)
})