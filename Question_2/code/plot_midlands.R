plot_midlands <- function(data, y_var, y_lab, title, fill_color) {
    ggplot(data, aes(x = month, y = !!y_var)) +
        stat_summary(geom = "bar", fill = fill_color, fun = "mean") +
        labs(x = "Month", y = y_lab, title = title) +
        theme_bw()
}
