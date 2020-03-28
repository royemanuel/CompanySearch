library(tidyverse)
library(rvest)

######################################################################
## gd = Glassdoor

gd_big_url <- "https://www.glassdoor.com/Award/Best-Places-to-Work-LST_KQ0,19.htm"

gd_big_html <- read_html(gd_big_url)

gd_big_comp <- html_nodes(gd_big_html, ".m-0") %>%
    html_text(.)

top_companies_bg <- as_tibble(as.data.frame(gd_big_comp, col.names = "Company")) %>%
    transmute(Company = as.character(gd_big_comp)) %>%
    mutate(Size = "Large",
           Rank = as.integer(row.names(.)))



gd_ms_url <- "https://www.glassdoor.com/Award/Best-Small-and-Medium-Companies-to-Work-For-LST_KQ0,43.htm"

gd_ms_html <- read_html(gd_ms_url)

gd_ms_comp <- html_nodes(gd_ms_html, ".m-0") %>%
    html_text(.)

top_companies_ms <- as.data.frame(gd_ms_comp) %>%
    as_tibble(.)

top_companies_ms <- top_companies_ms[2:dim(top_companies_ms)[1],]
colnames(top_companies_ms) <- c("Company")

top_companies_ms <-
    top_companies_ms %>%
    mutate(Company = as.character(Company),
           Size = "Small_Medium",
           Rank = as.integer(row.names(.)))

top_companies <- bind_rows(top_companies_bg, top_companies_ms)
