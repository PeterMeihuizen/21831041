time_series <- function(data){
    data %>%
    mutate(date = as.Date(date)) %>%
    group_by(continent, year_month = format(date, "%Y-%m")) %>%
    summarise(cont_hosp = mean(hosp_patients_per_million, na.rm = TRUE),
              cont_ICU = mean(icu_patients_per_million, na.rm = TRUE),
              .groups = 'drop')

}