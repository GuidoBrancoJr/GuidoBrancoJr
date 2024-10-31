# Acessar, extrair e modificar dados em variáveis
# criando variaveis para exemplo
vogais <- c("a","b","c","d","e")
vogais

# acessar o conte?do em uma posi??o espec?fica
vogais[3]
vogais[4]
 # acessar todos menos uma determinada posi??o
vogais[-3]
vogais[-4]
# dados entre posi??es
vogais[3:5]
vogais[1:3]
# dados considerando o comprimento
length(vogais) # tamanho do vetor
vogais[3:length(vogais)] # exibe da 3? posi??o at? o final
vogais[length(vogais)-2:length(vogais)] #exibe as 3 ultimas posi??es
# dados considerando vari?veis
a <- 3
b <- 5
vogais[a:b]
# acessar atrav?s de condi??es
vogais[vogais == "e"]
vogais[vogais != "e"]

a <- c(1,2,3,4,5)
a[a<2]
a[a>2]
a[a<=2]
a[a!=2]
