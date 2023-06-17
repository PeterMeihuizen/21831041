transform_data <- function(data) {
    data %>%
        mutate(date = ymd(date)) %>%
        mutate(month = format(date, "%m")) %>%
        group_by(month) %>%
        mutate(avg_temp_month = mean(mean_temp, na.rm = TRUE),
               avg_prec_month = mean(precipitation, na.rm = TRUE),
               avg_sun_month = mean(sunshine, na.rm = TRUE),
               avg_cloud_month = mean(cloud_cover, na.rm = TRUE)) %>%
        filter(date >= ymd("2000-01-01"))
}