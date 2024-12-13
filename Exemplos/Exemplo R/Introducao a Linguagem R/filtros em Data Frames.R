# Trabalhando com filtros em Data Frames
# definir area de trabalho
setwd("C:/Users/Guido A Branco Jr/Desktop/Mestrado/DADOS")

# importando base de dados
df <- read.csv2("DataFrame2.csv")
df[1] # carrega o conte�do da 1� coluna
df[1,] # carrega o 1� registro inteiro

#df[linha,coluna]

df[1:6] # carrega da coluna 1 ate a coluna 6
df[-4] # carrega todas as colunas menos a 4�
df[4]
df[1,1] # carrega a primeira 1� linha com a 1� coluna
df[1, 1:6] # carrega a 1� linha e as colunas de 1 a 6
df[1, -4] # carrega a 1� linha todas as colunas menos a 4 coluna
df[1:3,1:6] # carrega 1� at� a 3� linha e 1� at� a 6 coluna
df[-1, -4] # carregar todas as linhas menos 1� e todas as colunas menos a 4�
df[c(-3,-4,-5,-6)] #carrega o data frame menos as colunas 3, 4, 5 e 6

# modificando o data frame
 df <- df[c(-3,-4,-5,-6)] # utilizando o mesmo comando e atribuindo para o 
                          # mesmo DF - vai excluir as colunas 3,4,5 e 6
 # filtrando as vari�veis
 df[1,1] # carrega a primeira 1� linha com a 1� coluna
 df$DIA_SEM[1] # carrega a primeiro registro da coluna DIA_SEM
 df$AUTO[2:4] # carrega o conte�do coluna $AUTO de 2 a 4
 df[df$UPS == 1,]# carrega somente as linhas que tenha o dado  = 1 na coluna UPS
 # carregar somente ous conte�dos onde UPS = 1 e MOITE_DIA == DIA
 df[(df$UPS == 1 & df$NOITE_DIA == "DIA"),]
 
 # modificando o data frame
 df <- df[df$UPS == 1,] #deixando o DF com apenas os registros UPS = 1
 
 # df x df1
 df1 <- read.csv2("DataFrame2.csv") #importando novamente o DF original
View(df1)
View(df)
 
 
 
 
 
 
 
 
 