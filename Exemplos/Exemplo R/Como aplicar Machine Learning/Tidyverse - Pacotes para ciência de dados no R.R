# Pacotes para ciencias de dados no R
# Importar dataset

setwd("C:/Users/Guido A Branco Jr/Desktop/Mestrado/DADOS")
dfTabela <- read.csv("TabelaFipe2018_Modificada.csv",header = TRUE,fileEncoding ="ISO-8859-1")
View(dfTabela)

# Conhecendo alguns pacote da linguagem R especificos para o processamento de dados

# 1º - tidyverse - é uma coleção de pacotes para ciencias de dados
# site para download
# https://www.tidyverse.org
# https://www.tidyverse.org/packages
# para instalar a coleção inteira usar o codido
# install.packages("tidyverse")
# Não é recomendado baixar e instalar a coleção inteira - pode ser instalado
# apenas os pacotes necessários

# pacote magrittr - operadores que simplificam os scripts
# https://magrittr.tidyverse.org
# https://www.rdocumentation.org/packages/magrittr
# https://www.rdocumentation.org/packages/magrittr/versions/2.0.3
summary(dfTabela$Preco)
str(dfTabela)

dfTabela$Preco <- as.numeric(dfTabela$Preco)
View(dfTabela)
summary(dfTabela$Preco)
str(dfTabela$Preco)

dfTabela <- dfTabela[!is.na(dfTabela$Preco), ]# remover os NAs da tabela

install.packages("magrittr")
library("magrittr")

mean(dfTabela$Preco)
dfTabela$Preco %>% mean

# dplyr
# consistente e rapido para manipular dados
# https://dplyr.tidyverse.org/

install.packages("dplyr")
library("dplyr")












