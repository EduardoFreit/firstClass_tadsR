install.packages("rvest")
install.packages("xml2")

library(rvest)
library(xml2)

crawler_imdb <- function(imdb_url){
  rating <- read_html(imdb_url) %>% 
    html_nodes("strong span") %>% 
    html_text() %>% 
    as.numeric()
  
  title <- gsub('  ','', read_html(imdb_url) %>% 
                  html_nodes("h1") %>% 
                  html_text())
  
  data.frame(title, rating)
}

url_movie <- "https://www.imdb.com/title/tt1490017/"

crawler_imdb(url_movie)