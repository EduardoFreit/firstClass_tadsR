install.packages("rvest")
install.packages("xml2")

library(rvest)
library(xml2)

crawler_imdb <- function(imdb_url){ # pegando os dados da página que khe interessa (nota)
  rating <- read_html(imdb_url) %>% 
    html_nodes("strong span") %>% 
    html_text() %>% 
    as.numeric()
  
  title <- read_html(imdb_url) %>% # pegando os dados da página que khe interessa (titlo)
                  html_nodes("h1") %>% 
                  html_text()
  
  title <- gsub('  ','', title)#tirando espaços vazios do titulo
  
  data.frame(title, rating)#colocando em um BD e exibindo
}

url_movie <- "https://www.imdb.com/title/tt1490017/"

crawler_imdb(url_movie)#chmando a função