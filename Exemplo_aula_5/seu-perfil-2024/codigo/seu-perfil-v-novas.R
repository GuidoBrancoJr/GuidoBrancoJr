# Carregar pacotes necessários
library(tidyverse)

# Caminho do dadosset
arquivo <- ("./dados/perfil-2024.csv")

# Carregar o arquivo CSV
data <- read.csv(arquivo, , sep = ";")

# Verificar a estrutura original dos dados
str(data)

# Transformar TODAS variáveis do tipo character em fatores
#data <- data %>%
#  mutate(across(where(is.character), as.factor)) # versão 1

# Solicitado refazer o código para converter todas as variáveis menos  'expectativa'
# Transformar variáveis do tipo character em fatores, exceto 'expectativa'
#data <- data %>%
#  mutate(across(where(~ is.character(.x) & names(.) != "expectativa"), as.factor)) # Versão 2: com erro ! Não funcionou!

# Refazer o código!
# Converter todas as variáveis do tipo character em fatores, exceto a variável 'expectativa'
data <- data %>%
  mutate(across(.cols = where(is.character) & !c("expectativa"), as.factor)) # Ok ! Na versão 3, funcionou!

# Verificar a nova estrutura dos dados
str(data)

# Carregar pacotes necessários
library(tidyverse)

# Identificar as variáveis categóricas (fatores ou do tipo character)
categorical_vars <- data %>% select(where(is.factor))

# Atribuindo um nome mais descritivo para as variáveis no título
titulo_grafico = c("Gênero", "Tipo de Aluno", "Formação Básica", "Nome do Curso", "Faixa Etária", "Possui Computador?", 
                  "Tipo do Computador", "Sistema Operaciona Utilizado","Fabricante do Computador", 
                  "Conhecimento em Ciência de Dados", "Linguagem que Conhece")
indice = 1
# Gerar gráficos de barras para cada variável categórica
for (var_name in names(categorical_vars)) {
  # Selecionar a variável atual
  var_data <- categorical_vars[[var_name]]
  
  # Título do gráfico
  title <- paste("Distribuição da variável:", titulo_grafico[indice])
  
  # Gerar o gráfico de barras
  plot(var_data, 
       main = title,          # Título do gráfico
#       xlab = titulo_grafico[indice],       # Rótulo do eixo X
       ylab = "Frequência",   # Rótulo do eixo Y
       col = "lightblue",     # Cor das barras
       las = 2)               # Rotacionar os rótulos do eixo X para facilitar a leitura
  
  # Pausar a exibição do gráfico para visualizar um gráfico de cada vez
  readline(prompt="Pressione [Enter] para continuar para o próximo gráfico.")
  indice = indice + 1
}

# Carregar pacotes necessários
library(tidyverse)

# Identificar as variáveis categóricas (fatores ou do tipo character)
categorical_vars <- data %>% select(where(is.factor))

indice = 1
# Gerar gráficos de barras para cada variável categórica
for (var_name in names(categorical_vars)) {
  # Gerar o gráfico de barras usando ggplot2
  p <- ggplot(data, aes_string(x = var_name)) +
    geom_bar(fill = "lightblue", color = "black") +
    labs(title = paste("Distribuição da variável:", titulo_grafico[indice]),
         x = titulo_grafico[indice],
         y = "Frequência") +
    theme_minimal() +
    theme(axis.text.x = element_text(angle = 45, hjust = 1)) # Rotacionar os rótulos do eixo X
  
  # Exibir o gráfico
  print(p)
  
  # Pausar a exibição do gráfico para visualizar um gráfico de cada vez
  readline(prompt="Pressione [Enter] para continuar para o próximo gráfico.")
  indice = indice + 1
}

# Encontrar as correlações
# Carregar pacotes necessários
library(tidyverse)
library(corrplot)

# Excluir a variável expectativa
data_no_expectativa <- data %>%
  select(-expectativa)

# Verificar se as variáveis categóricas foram transformadas em fatores
# Se não, transformamos as variáveis categóricas em números usando as.numeric
data_numeric <- data_no_expectativa %>%
  mutate(across(where(is.factor), as.numeric))

# Calcular a matriz de correlação
cor_matrix <- cor(data_numeric, use = "complete.obs")

# Exibir a matriz de correlação
corrplot(cor_matrix, method = "color", tl.cex = 0.8)

# Resumo das principais correlações
summary(cor_matrix)

# Agora, verificar a variável caracter expectativa

# Carregar pacotes necessários
library(tm)
library(wordcloud)
library(RColorBrewer)

# Selecionar a variável expectativa
text_data <- data$expectativa

# Criar um corpus de texto
corpus <- Corpus(VectorSource(text_data))

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

# Exibir as palavras mais frequentes
head(df, 10)

# Programa em R para Análise de Conteúdo da Variável expectativa

# Carregar pacotes necessários
library(tidyverse)
library(tm)
library(SnowballC)
library(wordcloud)
library(RColorBrewer)
library(tidytext)

# Selecionar a variável expectativa
text_data <- data$expectativa
  
# Converter para um tibble e remover NAs
text_data <- tibble(text = text_data) %>%
    drop_na() %>% # Remover valores NA
    filter(text != "") # Remover linhas vazias
  
# Tokenização: Quebrar o texto em palavras
tidy_text <- text_data %>%
    unnest_tokens(word, text)
  
# Remover stopwords em português
stop_words_pt <- stopwords("pt")
    tidy_text <- tidy_text %>%
    filter(!word %in% stop_words_pt)
  
# Remover pontuações e palavras muito curtas (ex: de, a)
tidy_text <- tidy_text %>%
    filter(!str_detect(word, "[:punct:]")) %>%
    filter(str_length(word) > 2)
  
# Obter a frequência das palavras
word_freq <- tidy_text %>%
    count(word, sort = TRUE)
  
# Exibir as 10 palavras mais frequentes
  print(head(word_freq, 10))
  
# Gerar uma nuvem de palavras
set.seed(1234)
wordcloud(words = word_freq$word, freq = word_freq$n,
            min.freq = 2, max.words = 100, random.order = FALSE,
            rot.per = 0.35, colors = brewer.pal(8, "Dark2"))

# Instalar o pacote quanteda (caso não esteja instalado)
if(!('quanteda') %in% installed.packages()) install.packages("quanteda")
if(!('quanteda.textstats') %in% installed.packages()) install.packages("quanteda.textstats")
if(!('quanteda.textplots') %in% installed.packages()) install.packages("quanteda.textplots")

# Carregar pacotes necessários
library(tidyverse)
library(quanteda)
library(quanteda.textstats)
library(quanteda.textplots)
library(readr)

# Selecionar a variável expectativa
text_data <- data$expectativa
  
# Remover NAs e entradas vazias
text_data <- text_data[!is.na(text_data) & text_data != ""]
  
# Criar um corpus com quanteda
corpus_expectativa <- corpus(text_data)
  
# Tokenizar o texto (convertendo para palavras)
tokens_expectativa <- tokens(corpus_expectativa, 
                               remove_punct = TRUE, 
                               remove_numbers = TRUE) %>%
    tokens_remove(stopwords("pt")) %>% # Remover stopwords em português
    tokens_wordstem() # Aplicar stemming (reduzir palavras à sua raiz)
  
# Criar uma matriz de documentos e termos (Document-Feature Matrix - DFM)
dfm_expectativa <- dfm(tokens_expectativa)
  
# Exibir as palavras mais frequentes
top_terms <- textstat_frequency(dfm_expectativa, n = 10)
print(top_terms)
  
# Plotar as 10 palavras mais frequentes
ggplot(top_terms, aes(x = reorder(feature, frequency), y = frequency)) +
    geom_bar(stat = "identity", fill = "blue") +
    coord_flip() +
    labs(title = "Palavras mais frequentes na variável 'expectativa'",
         x = "Palavras",
         y = "Frequência") +
    theme_minimal()
  
# Gerar uma nuvem de palavras
textplot_wordcloud(dfm_expectativa, max_words = 100, 
                     color = RColorBrewer::brewer.pal(8, "Dark2"))
  
# Versão sugerida pelo Copilot
# Install and load the quanteda package
install.packages("quanteda")
library(quanteda)

# Load your text data
texts <- data$expectativa

# Create a corpus
corpus <- corpus(texts)

# Tokenize the text
tokens <- tokens(corpus)

# Create a document-feature matrix
dfm <- dfm(tokens)

# Perform a word frequency analysis
topfeatures(dfm)
