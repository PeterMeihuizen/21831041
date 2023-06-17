create_scatterplot <- function(data, var1, var2, title = "Scatterplot") {

    ggplot(data, aes(x = {{ var1 }}, y = {{ var2 }})) +
        geom_point() +
        geom_smooth(method = "lm", se = FALSE, color = "red") +
        labs(x = deparse(substitute(var1)),
             y = deparse(substitute(var2)),
             title = title) +
        theme_bw()
}

