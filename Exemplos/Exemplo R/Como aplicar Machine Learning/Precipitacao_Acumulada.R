#Esta??o Meteorol?gica Autom?tica IPMet - Bauru - SP
#https://www.ipmetradar.com.br/2estHist.php (02/09/2024)

setwd("C:/Users/Guido A Branco Jr/Desktop/Mestrado/DADOS")
dfPrecipitacao <- read.csv2("Precipitacao_Acumulada.csv",header = TRUE,fileEncoding ="ISO-8859-1")
View(dfPrecipitacao)
summary(dfPrecipitacao)
str(dfPrecipitacao)
# Converter todas as colunas de character para numeric
dfPrecipitacao[] <- lapply(dfPrecipitacao, function(x) as.numeric(as.character(x)))
summary(dfPrecipitacao)
summary(dfPrecipitacao$Jan)
max(dfPrecipitacao$Jan)

# Encontrar o valor correspondente na coluna 'produto'
ano_correspondente <- dfPrecipitacao$Ano[dfPrecipitacao$Jan == max(dfPrecipitacao$Jan)]
print(ano_correspondente)

min(dfPrecipitacao$Jan)
# Encontrar o valor correspondente na coluna 'produto'
ano_correspondente1 <- dfPrecipitacao$Ano[dfPrecipitacao$Jan == min(dfPrecipitacao$Jan)]
print(ano_correspondente1) 
print(paste("Maximo de Precipitacao no Mes de Janeiro no periodo de 2001/2024 ",max(dfPrecipitacao$Jan)))
print(paste("O ano que ocorreu a Maxima de Precipitacaoo no Mes de Janeiro ",ano_correspondente))
#paste() ou paste0() concatena a string e o valor de max(dfPrecipitacao$Jan),
#formando uma ?nica string que pode ser impressa corretamente.
#paste() - insere um espa?o entre os argumentos.
#paste0() - n?o insere espa?o extra

