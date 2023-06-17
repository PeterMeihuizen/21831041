plot_smoke <- function(data) {
    data %>%
        ggplot(aes(x = percent_resp_deaths, y = mean_hosp, color = location)) +
        geom_point() +
        labs(x = "Historical Respiratory Deaths", y = "Daily Covid Hospitalizations") +
        ggtitle("Scatterplot of European Countries Covid Hospitillzations and Historical Respiratory Deaths") +
        theme_bw()
}