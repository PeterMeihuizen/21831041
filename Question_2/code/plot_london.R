plot_london <- function(data, avg_value, y_lab, y_title) {
    ggplot(data, aes(x = month, y = avg_value)) +
        stat_summary(geom = "bar", fill = "blue", fun = "mean") +
        labs(x = "Month", y = y_lab, title = y_title) +
        theme_bw()
}
