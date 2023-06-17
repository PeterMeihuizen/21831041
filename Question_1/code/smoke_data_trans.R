smoke_data_trans<- function(data) {
    data %>%
    filter(continent == "Europe") %>%
    group_by(location) %>%
    summarise(mean_hosp = mean(mean_hosp, na.rm = TRUE), mean_pop = mean(population, na.rm = TRUE)) %>%
    filter(!is.na(mean_hosp)) %>%
    arrange(desc(mean_hosp)) %>%

        tibble()
}