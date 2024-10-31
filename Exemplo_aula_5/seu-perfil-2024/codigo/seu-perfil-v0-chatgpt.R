# Verificar se os pacotes necessários estão instalados no ambiente.
# se não, instalar na primeira vez! 
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

# Caminho do dadosset
arquivo <- ("./dados/perfil-2024.csv")
# Carregar o arquivo CSV
dados <- read.csv(arquivo, sep = ";")

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

# Visualização da distribuição das variáveis numéricas
dados %>%
  select_if(is.numeric) %>%
  gather() %>%
  ggplot(aes(value)) +
  geom_histogram(bins = 30, fill = "blue", color = "black") +
  facet_wrap(~key, scales = "free") +
  theme_minimal()

# Boxplots para identificar outliers
dados %>%
  select_if(is.numeric) %>%
  gather() %>%
  ggplot(aes(x = key, y = value)) +
  geom_boxplot(fill = "blue", color = "black") +
  theme_minimal()

# Análise de correlação
numeric_dados <- select_if(dados, is.numeric)
correlation_matrix <- cor(numeric_dados, use = "complete.obs")
corrplot(correlation_matrix, method = "color", tl.cex = 0.7)
