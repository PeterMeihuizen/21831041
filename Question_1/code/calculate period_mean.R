calculate_period_mean <- function(data, period_column, value_column) {
    data <- data %>%
        group_by({{ period_column }}) %>%
        mutate(mean_value = mean({{ value_column }}, na.rm = TRUE)) %>%
        ungroup()

    return(data)
}
