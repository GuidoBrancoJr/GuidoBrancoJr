setwd("C:/Users/Guido A Branco Jr/Desktop/Mestrado/DADOS")
df <- read.csv2("DataFrame2.csv")
#----------- exemplo --------------
#-------Retorno do maior valor da coluna--------- 
v <- 0
cont <- 0
  for (i in df$UPS) {
  if(i > v){
    v <- i
    cont <- cont + 1
  }
    
  }
v
cont
#----------- exemplo --------------
#-------Retorno do menor valor da coluna--------- 
v1 <- 5
cont1 <- 0
for (i in df$UPS) {
  if(i < v1){
    v <- i
    cont1 <- cont1 + 1
  }
  
}
v
cont1

#----------- exemplo --------------
#-------Contando valores da coluna---------  
  df$UPS[df$NOITE_DIA=="NOITE"]
cont <- 0  
#seq_along(df$UPS): Garante que o loop percorra cada �ndice dos elementos em df$UPS
for (i in seq_along(df$UPS)) {
  #verifica se ambos os crit�rios s�o atendidos para incrementar o contador cont
  if (df$UPS[i] >= 1 && df$NOITE_DIA[i] == "NOITE") {
    cont <- cont + 1
  }
}
cont

cont1 <- 0 
#seq_along(df$UPS): Garante que o loop percorra cada �ndice dos elementos em df$UPS
for (i in seq_along(df$UPS)) {
  #verifica se ambos os crit�rios s�o atendidos para incrementar o contador cont
  if (df$UPS[i] >= 0 && df$AUTO[i] == 2) {
    cont1 <- cont1 + 1
  }
}
cont1
#----------- exemplo --------------
#-------Alterando o campo cidade---------
nomes <- c("Jo�o", "Jose", "Maria", "Luana")
idades <- c(28,21,19,24)
telefone <- c("(14)9999-9999", "(14)9999-9999", "(14)9999-9999", "(14)9999-9999")
cidade <- c("Cabralia Paulista", "Duartina", "Bauru", "Bauru")

dfcadastro <- data.frame(nomes, idades, telefone, cidade)

summary(dfcadastro)

for (i in seq_along(dfcadastro$cidade)) {
    if(dfcadastro$cidade[i] >= 0 && dfcadastro$cidade[i] != "Bauru"){
      dfcadastro$cidade[i] <- "Bauru"
    }
}

str(dfcadastro)
View(dfcadastro)

#-------------- exemplo --------------
#-------Alterando um dado espec�fico---------
 

for (i in seq_along(dfcadastro$idades)) {
  if(dfcadastro$idades[i] == 28 && dfcadastro$telefone[i] == "(14)9999-8888"){
    dfcadastro$telefone[i] <- "(14)9999-1111"
  }
}

str(dfcadastro)

View(dfcadastro)



















