library(tidyverse)
library(rvest)

######################################################################
## gd = Glassdoor

gd_big_url <- "https://www.glassdoor.com/Award/Best-Places-to-Work-LST_KQ0,19.htm"

gd_big_html <- read_html(gd_big_url)

gd_big_comp <- html_nodes(gd_big_html, ".strong") %>%
    html_text(.)

