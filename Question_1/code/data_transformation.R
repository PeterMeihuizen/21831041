data_transformation <- function(data) {
    data <- data %>%
        group_by(location) %>%
        mutate(period = case_when(
            date >= as.Date("2020-01-01") & date <= as.Date("2020-06-01") ~ "2020_01",
            date >= as.Date("2020-07-01") & date <= as.Date("2020-12-31") ~ "2020_07",
            date >= as.Date("2021-01-01") & date <= as.Date("2021-06-01") ~ "2021_01",
            date >= as.Date("2021-07-01") & date <= as.Date("2021-12-31") ~ "2021_07",
            date >= as.Date("2022-01-01") & date <= as.Date("2022-06-01") ~ "2022_01",
            TRUE ~ NA_character_
        )) %>%
        group_by(location, period) %>%
        mutate(mean_cases = mean(total_cases_per_million, na.rm = TRUE),
               mean_vacs = 1000 * mean(total_vaccinations_per_hundred, na.rm = TRUE),
               mean_deaths = mean(total_deaths_per_million, na.rm = TRUE),
               mean_hosp = mean(hosp_patients_per_million, na.rm = TRUE)) %>%
        ungroup()
}