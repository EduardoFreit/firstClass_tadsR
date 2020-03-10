install.packages("rvest")
install.packages("xml2")

library(rvest)
library(xml2)
library(dplyr)

crawler_imdb <- function(imdb_url){ # pegando os dados da página que khe interessa (nota)
  rating <- read_html(imdb_url) %>% 
    html_nodes("strong span") %>% 
    html_text() %>%
    as.numeric()
  
  title <- read_html(imdb_url) %>% # pegando os dados da página que khe interessa (titlo)
                  html_nodes("h1") %>% 
                  html_text()
  
  #title <- gsub('  ','', title)#tirando espaços vazios do titulo
  
  data.frame(titulo = title, nota = rating)#colocando em um BD e exibindo
}

# criar uma tabela com os filmes
tabela_imdb <- function(filmes){
  tabela <- data.frame() # tabela em branco
  
  for(i in 1:length(filmes)){
    tabela <- tabela %>% 
      rbind(crawler_imdb(filmes[i]))
  }
  tabela %>% 
    arrange(nota)
}

#MAIN

url_movie <- c("https://www.imdb.com/title/tt7131622/",
               "https://www.imdb.com/title/tt7286456/",
               "https://www.imdb.com/title/tt1302006/",
               "https://www.imdb.com/title/tt8579674/",
               "https://www.imdb.com/title/tt6751668/")

tabela_imdb(url_movie)#chmando a função
