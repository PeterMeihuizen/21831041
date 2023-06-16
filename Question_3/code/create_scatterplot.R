create_scatterplot <- function(data, var1, var2) {
        ggplot(data, aes(x = {{ var1 }}, y = {{ var2 }})) +
            geom_point() +
            labs(x = deparse(substitute(var1)),
                 y = deparse(substitute(var2)),
                 title = "Scatterplot") +
            theme_bw()
    }