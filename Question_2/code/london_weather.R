london_weather <- function(data, y_variable, y_lab, title, fill_color) {
    ggplot(data, aes(x = month, y = !!y_variable)) +
        stat_summary(geom = "bar", fill = fill_color, fun = "mean") +
        labs(x = "Month", y = y_lab, title = title) +
        theme_bw()
}
