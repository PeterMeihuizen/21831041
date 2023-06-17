midlands_transform <- function(data) {
    data %>%
        mutate(date = as.character(DATE)) %>%
        mutate(date = as.Date(paste0(date, "-01"), format = "%Y-%m-%d")) %>%
        mutate(date = ymd(date)) %>%
        mutate(month = format(date, "%m")) %>%
        group_by(month) %>%
        mutate(avg_temp_month = mean(TAVG, na.rm = TRUE),
               avg_prec_month = mean(EMXT, na.rm = TRUE)) %>%
        filter(date >= ymd("2000-01-01"))
}