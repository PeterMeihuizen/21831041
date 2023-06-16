mean_country <- function(data, variable) {
    periods <- list(
        period1 = list(start = as.Date("2020-01-01"), end = as.Date("2020-06-30")),
        period2 = list(start = as.Date("2020-06-01"), end = as.Date("2020-07-31")),
        period3 = list(start = as.Date("2021-01-01"), end = as.Date("2021-06-30")),
        period4 = list(start = as.Date("2021-06-01"), end = as.Date("2021-07-31")),
        period5 = list(start = as.Date("2022-01-01"), end = as.Date("2022-06-30"))
    )

    for (i in seq_along(periods)) {
        period <- periods[[i]]
        start_date <- period$start
        end_date <- period$end

        period_mean <- data %>%
            filter(date >= start_date, date <= end_date) %>%
            group_by(location) %>%
            summarise(mean_value = mean(!!sym(variable), na.rm = TRUE))

        data <- data %>%
            left_join(period_mean, by = "location")
    }

    return(data)
}
