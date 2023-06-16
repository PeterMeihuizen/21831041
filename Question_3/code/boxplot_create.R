boxplot_create <- function(data, var2, y_lab = "y_lab", title = "Boxplot") {
    var2 <- enquo(var2)  # Convert var2 to a quosure

    data <- data %>%
        mutate(album_order = as.Date(release_date))  # Create a new variable for sorting albums

    data <- data[order(data$album_order), ]  # Sort the data by the album_order variable

    ggplot(data, aes(x = album, y = !!var2)) +
        geom_boxplot(fill = "lightblue", color = "black") +
        labs(x = "Album", y = y_lab, title = title) +
        theme_bw() +
        theme(
            axis.title = element_text(size = 12),
            axis.text = element_text(size = 10),
            legend.title = element_text(size = 10),
            legend.text = element_text(size = 8),
            axis.ticks = element_line(size = 0.5),
            panel.grid.major = element_line(color = "gray80"),
            plot.margin = margin(1, 1, 1, 1, "cm")
        )
}
