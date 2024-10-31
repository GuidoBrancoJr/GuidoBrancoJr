# Referência - https://mapainterativo.cemaden.gov.br/

setwd("C:/R_Home/Exemplos/DADOS")
dfCemadenJan24 <- read.csv2("DadosCemaden-01-24.csv",header = TRUE,fileEncoding ="ISO-8859-1")
View(dfCemadenJan24)
summary(dfCemadenJan24$valorMedida)

# Filtrando os valores maiores que 0
indiceChuva <- dfCemadenJan24$valorMedida[dfCemadenJan24$valorMedida > 0]

print(indiceChuva)

class(dfCemadenJan24$nomeEstacao)
class(indiceChuva)

indiceChuva <- as.character(indiceChuva)

class(indiceChuva)

# verificando se tem espaços nulos
sum(is.na(dfCemadenJan24$nomeEstacao))
sum(is.na(indiceChuva))

# Normalizando os valores para minúsculas e removendo espaços
nomeEstacao_normalizado <- tolower(trimws(dfCemadenJan24$nomeEstacao)) 
indiceChuva_normalizado <- tolower(trimws(indiceChuva))

# Comparando os valores normalizados
# o operador %in% é utilizado para verificar se elementos de um vetor estão presentes
# em outro vetor e retorna um vetor lógico (TRUE ou FALSE)

nomeEstacao_indiceChuva <- dfCemadenJan24$nomeEstacao[dfCemadenJan24$valorMedida %in% indiceChuva_normalizado]
print(nomeEstacao_indiceChuva)

# Criando um novo DF
novo_df_DadosCemaden <- data.frame(
                          nomeEstacao = nomeEstacao_indiceChuva,
                          indiceChuva = indiceChuva_normalizado
                                   )
summary(novo_df_DadosCemaden)
View(novo_df_DadosCemaden)
str(novo_df_DadosCemaden)

# Filtrar campos valorMedida e indiceChuva_normalizado referente ao campo datahora


DataHora <- dfCemadenJan24$datahora[dfCemadenJan24$valorMedida %in% indiceChuva_normalizado]
summary(DataHora)

# Incluir o campo DataHora no novo_df_DadosCemaden

novo_df_DadosCemaden$DataHora <- DataHora

summary(novo_df_DadosCemaden)

View(novo_df_DadosCemaden)

# Excluindo os registro que o nome da estacao é igual a TIbiriça

novo_df_DadosCemaden <- novo_df_DadosCemaden[novo_df_DadosCemaden$nomeEstacao != "Tibiriça", ]

View(novo_df_DadosCemaden)

summary(novo_df_DadosCemaden$indiceChuva)

# Alterando novo_df_DadosCemaden$indiceChuva de caracter para numérico

novo_df_DadosCemaden$indiceChuva <- as.numeric(novo_df_DadosCemaden$indiceChuva)
str(novo_df_DadosCemaden$indiceChuva)
summary(novo_df_DadosCemaden$indiceChuva)

# Selecionando os campos com o nomeEstacao = Vila Universitária

Estacao_Universitaria <- novo_df_DadosCemaden[novo_df_DadosCemaden$nomeEstacao == "Vila Universitária",]
View(Estacao_Universitaria)

# Alterando o campo datahora para apenas data
# Transformar um campo de texto em um campo de data

novo_df_DadosCemaden$text_date <- as.Date(strptime(novo_df_DadosCemaden$DataHora, format="%d/%m/%Y"))
View(novo_df_DadosCemaden)


# Filtrar o data frame pelo nomeEstacao e text_date

# Definir os critérios de filtro nomeEstacao e text_date
 
  novo_df_DadosCemaden <- novo_df_DadosCemaden[novo_df_DadosCemaden$nomeEstacao == "Vila Universitária" & novo_df_DadosCemaden$text_date == "2024-01-31" ,]
  summary(novo_df_DadosCemaden)
  View(novo_df_DadosCemaden)
  
  summary(novo_df_DadosCemaden$indiceChuva)

  # Somar todos os valores da coluna "indiceChuva"
   
  soma_total <- sum(novo_df_DadosCemaden$indiceChuva, na.rm = TRUE)
  print(soma_total)
  
  # preparando o R para cria Dashboard - instalar o rmarkdown, verificar o caminho dos templates 
  # e caso o flexdashboard não estiver instalado, é só instalar.
  install.packages("rmarkdown")
  system.file("rmarkdown", "templates", package = "rmarkdown")
  install.packages("flexdashboard")
  
  
  
