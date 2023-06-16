mean_country <- function(deathdf, variable) {
    periods <- list(
        period1 = list(start = "2020-01-01", end = "2020-06-30"),
        period2 = list(start = "2020-06-01", end = "2020-07-31"),
        period3 = list(start = "2021-01-01", end = "2021-06-30"),
        period4 = list(start = "2021-06-01", end = "2021-07-31"),
        period5 = list(start = "2022-01-01", end = "2022-06-30")
    )

    means <- list()

    for (i in seq_along(periods)) {
        period <- periods[[i]]
        start_date <- as.Date(period$start)
        end_date <- as.Date(period$end)

        subset_data <- data[data$date >= start_date & data$date <= end_date, ]
        mean_value <- mean(subset_data[[variable]], na.rm = TRUE)
        means[[i]] <- mean_value
    }

    return(means)
}
