scatterplot <- function(data){
    data %>%
        group_by(Category) %>%
        summarise(avg_review = mean(Reviews),
                  avg_install = mean(Installs)) %>%
        arrange(desc(avg_install)) %>%
        slice(1:10) %>%
        mutate(Category = factor(Category)) %>%
        ggplot(aes(x = avg_review, y = avg_install, color = Category)) +
        geom_point() +
        scale_y_continuous(labels = function(x) paste0(x / 1000000, "M")) +
        labs(x = "Average Reviews",
             y = "Average Installs (in millions)",
             title = "Scatter Plot of Average Reviews and Installs (Top 10 Categories)") +
        theme_bw()
}














