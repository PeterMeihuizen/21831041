top200 <- function(data, type = "show/movie", x = x, var1, x_var, y_var, plot_type = "scatter") {
    data %>%
        filter(grepl(type, {{ type }})) %>%
        arrange(desc({{ x_var }})) %>%
        head(x) %>%
        if (plot_type == "scatter") {
            ggplot(data, aes(x = {{ x_var }}, y = {{ y_var }})) +
                geom_point() +
                labs(x = deparse(substitute(x_var)), y = deparse(substitute(y_var)))
        } else if (plot_type == "bar") {
            ggplot(data, aes(x = {{ x_var }}, y = {{ y_var }})) +
                geom_bar(stat = "identity") +
                labs(x = deparse(substitute(x_var)), y = deparse(substitute(y_var)))
        } else if (plot_type == "line") {
            ggplot(data, aes(x = {{ x_var }}, y = {{ y_var }})) +
                geom_line() +
                labs(x = deparse(substitute(x_var)), y = deparse(substitute(y_var)))
        } else if (plot_type == "pie") {
            ggplot(data, aes(x = "", y = {{ y_var }}, fill = {{ x_var }})) +
                geom_bar(stat = "identity", width = 1) +
                coord_polar("y") +
                labs(x = NULL, y = deparse(substitute(y_var)))
        } else {
            print("Invalid plot type. Please choose 'scatter', 'bar', 'line', or 'pie'")
        }
}
