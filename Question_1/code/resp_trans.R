resp_trans <- function(data){
    data %>%
    filter(Entity %in% c("Bulgaria", "Serbia", "Lithuania", "Romania", "Hungary", "Norway", "Finland", "Iceland", "Denmark", "Netherlands")) %>%
    group_by(Entity) %>%
    summarise(avg_resp_deaths = mean(Deaths...Lower.respiratory.infections...Sex..Both...Age..All.Ages..Number., na.rm = TRUE)) %>%
    rename(location = Entity)

}