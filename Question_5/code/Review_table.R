Review_table <- function(data) {
    data %>%
        filter(Sentiment %in% c("Positive", "Negative", "Neutral")) %>%
        filter(Category %in% c("COMMUNICATION", "ENTERTAINMENT", "GAME", "NEWS_AND_MAGAZINES", "PHOTOGRAPHY", "PRODUCTIVITY", "SOCIAL", "TOOLS", "TRAVEL_AND_LOCAL", "VIDEO_PLAYERS")) %>%
        group_by(Category) %>%
        summarise(pos_percent = sum(Sentiment == "Positive") / n() * 100,
                  neg_percent = sum(Sentiment == "Negative") / n() * 100,
                  neu_percent = sum(Sentiment == "Neutral") / n() * 100,) %>%
        tibble()
}
