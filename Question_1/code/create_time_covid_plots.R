create_time_covid_plots <- function(data, continent_filter = NULL) {
    if (is.null(continent_filter)) {
        plot_data <- data
        title <- "Average Hospitalized Patients and ICU Patients per Million by Continent"
    } else {
        plot_data <- data[data$continent == continent_filter, ]
        title <- paste("Average Hospitalized Patients and ICU Patients per Million in", continent_filter)
    }

    ggplot(plot_data, aes(x = year_month, group = continent)) +
        geom_line(aes(y = cont_hosp, color = continent, linetype = "Hospitalized")) +
        geom_line(aes(y = cont_ICU, color = continent, linetype = "ICU")) +
        labs(x = "Month", y = "Value", color = "Continent", linetype = "Variable") +
        ggtitle(title) +
        theme_bw()
}
