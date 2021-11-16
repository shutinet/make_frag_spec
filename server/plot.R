plot_empty_MS <- function(title = "Mass Spectra", yTitle = 'Intensity') {
	p <- plotly::plot_ly(
		type = 'scatter', 
		mode='markers'
	) 
	p <- plotly::layout(p,  
		title = list(
			text = sprintf('<b>%s</b>', title), 
			y = .95, 
			x = .5, 
			font = list(
				family = '"Open Sans",verdana,arial,sans-serif', 
				size = 18
			), 
			xanchor = "center", 
			yanchor = "bottom"
		), 
        margin = list(t = 50),
		hoverdistance = 10, 
		hovermode = "x",
		xaxis = list(
			title = 'm/z', 
			titlefont = list(
				family = '"Open Sans",verdana,arial,sans-serif', 
				size = 18
			), 
			showspikes = FALSE, 
			showticksuffix = "all",
			hoverformat = ".5f"
		), 
		yaxis = list(
			exponentformat = 'e', 
			title = '',
			hoverformat = '.2e'
		), 
		hoverlabel = list(
			namelength = -1
		), 
		annotations=list(list(
			xref = 'paper', 
			yref = 'paper', 
			x = 0, 
			y = 1, 
			xanchor = 'left', 
			yanchor = 'bottom', 
			text = yTitle, 
			showarrow = FALSE, 
			font = list(
				family = '"Open Sans",verdana,arial,sans-serif', 
				size = 18
			)
		))
	)
	p <- plotly::config(p,  
		responsive = TRUE, 
		scrollZoom = TRUE, 
		displaylogo = FALSE, 
		editable = TRUE, 
		# edits = list(
			# annotationText = TRUE, 
			# annotationPosition = TRUE
		# ), 
		modeBarButtons = list(
			list(list(
				name = 'toImage', 
				title = 'Download plot as a png',
				icon = htmlwidgets::JS('Plotly.Icons.camera'),
				click = htmlwidgets::JS("function(gd){Plotly.downloadImage(gd, {format:'png', width:600, height:600, filename:'MS'})}")
			)), 
			list('zoom2d', 'autoScale2d')
		)
	)
	p
}

plot_MS <- function(data) {
	if (nrow(data) == 0) return(plot_empty_MS(title = "Mass spectra"))
	
	p1 <- plotly::layout(
		plotly::add_annotations(
				plotly::add_segments(
				plot_empty_MS(title = "Mass spectra"), 
				x = data[, 1], 
				xend = data[, 1], 
				y = data[, 2], 
				yend = 0, 
				color = I("black"),
				showlegend = FALSE
			), 
			x = data[, 1], 
			y = data[, 2] + 5, 
			hoverinfo = "text", 
			text = data[, 1], 
			xref = 'x', 
			yref = 'y', 
			showarrow = FALSE
		), 
		xaxis = list(
			range = c(
				min(data[, 1]) - 1, 
				max(data[, 1]) + 1
			)
		), 
		yaxis = list(range = c(0, 100))
	)
	p2 <- plotly::layout(
		plotly::add_annotations(
			plotly::add_segments(
				plot_empty_MS(title = "Mass spectra", yTitle = ""), 
				x = data[, 1], 
				xend = data[, 1], 
				y = data[, 3], 
				yend = 0, 
				color = I("black"),
				showlegend = FALSE
			),  
			x = data[, 1], 
			y = data[, 3] + 5, 
			hoverinfo = "text", 
			text = data[, 1], 
			xref = 'x', 
			yref = 'y', 
			showarrow = FALSE
		), 
		xaxis = list(
			range = c(
				min(data[, 1]) - 1, 
				max(data[, 1]) + 1
			)
		), 
		yaxis = list(range = c(0, 100))
	)
	plotly::toWebGL(plotly::subplot(p1, p2, nrows = 2, shareX = TRUE))
}