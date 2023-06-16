create_mean_barplot <- function(data, y_var,
                                y_lab = "Y Variable") {

    ggplot(data, aes(x = continent, y = {{y_var}}, fill = continent)) +
        geom_bar(stat = "summary", fun = "mean", position = "dodge") +
        facet_wrap(~ period, scales = "free_x") +
        labs(x = "Period", y = y_lab, fill = "Continent") +
        theme_bw() +
        theme(axis.text.x = element_blank())
}

ggplot(data, aes(x = continent, y = mean_cases, fill = continent)) +
    geom_bar(stat = "summary", fun = "mean", position = "dodge") +
    facet_wrap(~ period, scales = "free_x") +
    labs(x = "Period", y = "Mean Cases Per Million", fill = "Continent") +
    theme_bw() +
    theme(axis.text.x = element_blank())