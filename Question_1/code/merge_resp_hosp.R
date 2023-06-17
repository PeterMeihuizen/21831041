merge_resp_hosp <- function(data){
    data %>%
    left_join(select(avg_resp_deaths, location, avg_resp_deaths), by = "location") %>%
    filter(!is.na(avg_resp_deaths)) %>%
    mutate(percent_resp_deaths = (avg_resp_deaths / mean_pop) * 1000000)

}