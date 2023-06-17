top200 <- function(data) {
gen_freq <-  data %>%
    arrange(desc(imdb_votes)) %>%
    head(200) %>%
    select(title, release_year, genres, imdb_votes)

    genres <- function(data, Terms = c("documentation", "crime", "drama", "fantasy", "comedy", "family", "animation", "romance", "history", "scifi", "war", "thriller", "horror")){
      gen_freq <-
        shows %>%
        group_by(release_year) %>%
        summarise(freq = sum(grepl(paste(Terms, collapse = "|"), genres))) %>%
        mutate(Term = glue::glue_collapse(Terms, sep = ",", last = " and"))
    }


        genre_df <- bind_rows(genres(data, Terms = c("documentation")),
                     genres(data, Terms = c("crime")),
                     genres(data, Terms = c("drama")),
                     genres(data, Terms = c("fantasy")),
                     genres(data, Terms = c("comedy")),
                     genres(data, Terms = c("family")),
                     genres(data, Terms = c("animation")),
                     genres(data, Terms = c("romance")),
                     genres(data, Terms = c("history")),
                     genres(data, Terms = c("scifi")),
                     genres(data, Terms = c("war")),
                     genres(data, Terms = c("thriller")),
                     genres(data, Terms = c("horror"))) %>%
    as.data.frame()

plot_genres <- genre_df %>%
        group_by(Term) %>%
        summarise(tot_sum = sum(freq)) %>%

   top200_plot <- ggplot(plot_genres, aes(x = Term, y = tot_sum)) +
        geom_bar(stat = "identity") +
    labs(x = "Genre",
        y = "Votes",
        title = "Genres of Top 200 Shows")
    theme(axis.text.x = element_text(angle = 45, hjust = 1))

top200_plot
}
