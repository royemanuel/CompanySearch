library(tidyverse)
library(rvest)

######################################################################
## gd = Glassdoor

gd_big_url <- "https://www.glassdoor.com/Award/Best-Places-to-Work-LST_KQ0,19.htm"

gd_big_html <- read_html(gd_big_url)

gd_big_comp <- html_nodes(gd_big_html, ".m-0") %>%
    html_text(.)

top_companies <- as_tibble(as.data.frame(gd_big_comp, col.names = "Company")) %>%
    mutate(Size = "Large",
           Rank = as.integer(row.names(top_companies)))

