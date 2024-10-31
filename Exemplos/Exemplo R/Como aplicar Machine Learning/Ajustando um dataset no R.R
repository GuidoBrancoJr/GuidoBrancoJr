# Exemplo para otimizar dataset

# codigo usado para definir o diretório de trabalho do DF
setwd("C:/Users/Guido A Branco Jr/Desktop/Mestrado/DADOS")
?setwd # help

# Carregar base de dados
 dfTabela <- read.csv2("TabelaFipe2018.csv", header = TRUE, encoding = "UTF-8")
 View(dfTabela) # exibir tabela
 str(dfTabela) # exibir Data Frame
 #'data.frame':	21797 obs. of  7 variables:
 #  $ Column1        : int  1 2 3 4 5 6 7 8 9 10 ...
 #$ brand          : chr  "Acura" "Acura" "Acura" "Acura" ...
 # $ vehicle        : chr  "Legend 3.2/3.5" "Legend 3.2/3.5" "Legend 3.2/3.5" "Legend 3.2/3.5" ...
 # $ year_model     : int  1998 1997 1996 1995 1994 1993 1992 1991 1995 1994 ...
 # $ fuel           : chr  "Gasoline" "Gasoline" "Gasoline" "Gasoline" ...
 # $ price_reference: chr  "01/06/2018" "01/06/2018" "01/06/2018" "01/06/2018" ...
 # $ price          : int  27942 23392 22682 20648 18343 16563 15331 14693 43622 42154 ...

 # Observando dfTabela foi identificado a necessidade de realizar melhorias
 # para facilitar a interpretação e visualização dos dados:
 # 1ª melhoria - excluir as colunas column1 e price_reference
 
  dfTabela$Column1 <- NULL
  dfTabela$price_reference <- NULL
  
  View(dfTabela) # exibir tabela
  
  # 2ª melhoria - Renomear nome dos campos do dfTabela
  
  names(dfTabela)
  names(dfTabela) <- c("Marca", "Carro", "Ano_Modelo", "Combustivel", "Preco") 
  names(dfTabela)  
  View(dfTabela)  
  
  # 3ª melhoria - a coluna Ano_Modelo contem alguns registro com valor
  # igual a 32000, e após analize foi identificado que este valor corresponde
  # ao registro de Zero KM. Vamos realizar esta alteração:
  # Tipo de Variável
  
  summary(dfTabela$Ano_Modelo)
  dfTabela$Ano_Modelo[dfTabela$Ano_Modelo == 32000] <- "Zero KM"
  dfTabela$Ano_Modelo <- as.factor(dfTabela$Ano_Modelo)
  summary(dfTabela$Ano_Modelo)
  str(dfTabela$Ano_Modelo)
 
  # 4ª melhoria - transformar a coluna preco de caracter para numerico  
  
  summary(dfTabela$Preco)
  str(dfTabela$Preco)
  dfTabela$Preco1 <- as.numeric(dfTabela$Preco)  
  View(dfTabela)
  
  # caso necessário a retirada de caracteres neste campo utilizar o código:
  # dfTabela$Preco1 <- sub("R\\$|\\.| ","",dfTabelaPreca)
  # Este código vai retirar os caracteres do registro no campo Preco e 
  # substituir por ""
  
  dfTabela$Preco <- as.numeric(dfTabela$Preco)
  dfTabela$Preco1 <- NULL  
  View(dfTabela)
  summary(dfTabela$Preco)
  str(dfTabela$Preco)
  
  #Salvar novo dataset
  
  write.table(dfTabela,file ="TabelaFipe2018_Modificada.csv", row.names = FALSE,sep = ",",fileEncoding = "UTF-8")
  dfTabelaModificada <- read.csv("TabelaFipe2018_Modificada.csv")
  View(dfTabelaModificada)
  
  
  
  
  
  
  