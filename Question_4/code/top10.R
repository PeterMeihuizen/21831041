top10 <- function(data, var1, var2, var3, var4, var5, var6, x = x){
    data %>%
        arrange(desc({{var1}})) %>%
        select({{var2}}, {{var1}}, {{var3}}, {{var4}}, {{var5}}, {{var6}}) %>%
        head(x) %>%
    tibble()
}

