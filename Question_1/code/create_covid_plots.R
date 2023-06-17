create_covid_plots <- function(data, y_var, y_lab, fill_var, x_lab, facet_var) {
    ggplot(data[!is.na(data$period), ], aes_string(x = facet_var, y = y_var, fill = fill_var)) +
        geom_bar(stat = "summary", fun = "mean", position = "dodge") +
        facet_wrap(as.formula(paste0("~", facet_var)), scales = "free_x") +
        labs(x = x_lab, y = y_lab, fill = fill_var) +
        theme_bw() +
        theme(axis.text.x = element_blank())
}
