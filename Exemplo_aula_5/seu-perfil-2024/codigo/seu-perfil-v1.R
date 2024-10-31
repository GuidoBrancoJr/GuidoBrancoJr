# Verificar se os pacotes necessários estão instalados no ambiente.
# Se não estiverem, o script instala apenas na primeira vez que se executar o programa! 
if(!('tidyverse') %in% installed.packages()) install.packages('tidyverse') 
if(!('readr') %in% installed.packages()) install.packages('readr') 
if(!('summarytools') %in% installed.packages()) install.packages('summarytools') 
if(!('ggplot2') %in% installed.packages()) install.packages('ggplot2') 
if(!('corrplot') %in% installed.packages()) install.packages('corrplot') 

# Carregar os pacotes necessários
library(tidyverse)
library(readr)
library(summarytools)
library(ggplot2)
library(corrplot)

# Caminho do dataset
arquivo <- ("./dados/perfil-2024.csv")
# Carregar o arquivo CSV
dados <- read.csv(arquivo, sep = ";", stringsAsFactors = TRUE)

# Verificar as primeiras linhas do dadosset
head(dados)


# Verificar a estrutura dos dados
str(dados)

# Verificar se há valores ausentes
summary(is.na(dados))

# Resumo estatístico das variáveis numéricas
summary(select_if(dados, is.numeric))

# Contagem de frequências para variáveis categóricas
summary(select_if(dados, is.factor))

# Identificar variáveis categóricas (fatores ou variáveis do tipo character)
categorical_vars <- dados %>% select_if(is.factor) %>% names()

# Visualizar a distribuição das variáveis categóricas
for (var in categorical_vars) {
  # Criar um gráfico de barras para cada variável categórica
  p <- dados %>%
    ggplot(aes_string(x = var)) +
    geom_bar(fill = "blue", color = "black") +
    labs(title = paste("Distribuição da variável:", var),
         x = var,
         y = "Frequência") +
    theme_minimal() +
    theme(axis.text.x = element_text(angle = 45, hjust = 1)) # Rotacionar os labels para melhor visualização
  
  # Exibir o gráfico
  print(p)
}

# Visualizar a variável "expectativa" como uma nuvem de palavras
# Verificar se os pacotes necessários estão instalados no ambiente.
# Se não estiverem instalados, o script instala apenas na primeira vez que se executar o programa!
if(!('tm') %in% installed.packages()) install.packages('tm') 
if(!('wordcloud') %in% installed.packages()) install.packages('wordcloud')
if(!('RColorBrewer') %in% installed.packages()) install.packages('RColorBrewer')

# Carregar pacotes necessários
# library(tidyverse)
library(tm)
library(wordcloud)
library(RColorBrewer)

# Selecionar a variável expectativa
text_dados <- dados$expectativa
  
# Criar um corpus de texto
corpus <- Corpus(VectorSource(text_dados))
  
# Pré-processamento do texto
corpus <- corpus %>%
    tm_map(content_transformer(tolower)) %>%  # Converter para minúsculas
    tm_map(removePunctuation) %>%  # Remover pontuação
    tm_map(removeNumbers) %>%  # Remover números
    tm_map(removeWords, stopwords("pt")) %>%  # Remover stopwords em português
    tm_map(stripWhitespace)  # Remover espaços em branco extras
  
# Criar uma matriz de termos
dtm <- TermDocumentMatrix(corpus)
matrix <- as.matrix(dtm)
words <- sort(rowSums(matrix), decreasing=TRUE)
df <- data.frame(word = names(words), freq = words)
  
# Gerar a nuvem de palavras
set.seed(1234)  # Para reprodutibilidade
wordcloud(words = df$word, freq = df$freq, min.freq = 2,
            max.words=100, random.order=FALSE, rot.per=0.35,
            colors=brewer.pal(8, "Dark2"))

