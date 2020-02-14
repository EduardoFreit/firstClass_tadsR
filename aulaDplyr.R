# Poderia ser apenas um caminho direcionado para operar




# instalar o pacote 
install.packages("dplyr")

#
library (dplyr)
glimpse(iris)

select(iris, Petal.Length, Petal.Width)           # fazer seleção de determinadas colunas de uma tabela
filter(iris, Petal.Length > 2)                    # fazer uma filtragem dos elementos
mutate(iris, Petal.Length = Petal.Length + 2)     # Modificar caracteristicas de uma tabela
  
iris %>%                                          #
  filter(Petal.Length > 2) %>% 
  mutate(Petal = Petal.Length + 2) %>% 
  select(Species, Petal) %>% 
  glimpse()

t <- iris %>%                                     #Transformar a tabela 
  transmute(Petal = Petal.Length + 2) %>% 
  glimpse()

iris %>% 
  group_by(Species) %>% 
  summarise(media = mean(Petal.Length), media2 = mean(Petal.Width))
