#Dados numéricos na Linguagem R

#Arredondamento

salario <- 3250.85
horas <- 220

valorhora <- salario / horas

valorhora

#utilizando somente a parte inteira do resultado
# função as.integer

valorinteiro <- as.integer(valorhora)

valorinteiro

#arredondando o valor da variável
# função round

valorarredondado <- round(valorhora)
valorarredondado


#Armazenamento de caracteres

nome_1 <- "Guido"
nome_2 <- "João"
idade <- "53"
idade / 2 #Error in idade/2 : argumento não-numérico para operador binário
nomes <- c(nome_1,nome_2)
nomes
 nome_1 == nome_2
 
#Armazenamento de fatores 
 cargahoraria <- c(220, 220, 150, 100, 100)
 summary(cargahoraria)
 # Uma das vantagens de uso do as.factor é o retorno quantitativo de valores repetidos
 # a variável novacargahoraria sera do tipo factor 
 novacargahoraria <- as.factor(c(220, 220, 150, 100, 100))
 summary(novacargahoraria)
 
#Armazenamento lógico
 
 valor1 <- 5
 valor2 <- 7
 
 L1 <- valor1 == valor2
 L1
 
 valor3 <- 5
 valor4 <- 5
 
 L2 <- valor3 == valor4
 L2
 
 logico1 = TRUE
 logico2 = FALSE
 logico1
 logico2
 
 logico3 <- c(4,logico1,5) #retorna valores numéricos True = 1
 logico3
 
 logico4 <- c(4,logico2,5) #retorna valores numéricos False = 0
 logico4
 
 #vetor estrutura básica de dados do mesmo tipo
 Nome <- c("Guido","João", "Maria")
 is.vector(Nome)
 mode(Nome)
 Nome #imprime o conteúdo do vetor
 Nome[1] # imprime uma posição especifica do vetor
 Nome[2]
 Nome[3]
 
 
 idade <- c(53, 27, 22)
 is.vector(idade)
 mode(idade)
 idade #imprime o conteúdo do vetor
 idade[1] # imprime uma posição especifica do vetor
 idade[2]
 idade[3]
 
 # Lista 
 a <- c(1, 2, 3, 4, 5) # criou um vetor numérico
 b <- c(1, "2", 3, 4, 5) # o mesmo vetor com um dado caracter.
 
 a # dados numéricos [1] 1 2 3 4 5
 b # após encontrar um dado como caracter ("2") transformou todos em caracter [1] "1" "2" "3" "4" "5"
 
 is.list(a) # [1] FALSE
 is.list(b) # [1] FALSE
 
 is.vector(a) # [1] TRUE
 is.vector(b) # [1] TRUE
 
 b <- as.numeric(b) # converter todo conteúdo para numerico
 
 b
 
 b <- c(1, "a", 3, 4, 5)
 b <- as.numeric(b) # converter todo conteúdo para numerico 
                    # vai gerar uma mensagem ao executar
                    # Mensagen de aviso: NAs introduzidos por coerção 
 b #resutado ao imprimir [1]  1 NA  3  4  5
 
 # Para resolver este problema vamos criar uma lista
 
 d <- list(10, "2", 8)# criar a lista
 is.list(d) # testar se é lista
 mode(d) # tipo
 str(d) # conteúdo List of 3 $ : num 10 $ : chr "2" $ : num 8
 
 e <- list(c(10, 5, 4),"2", 8)
 str(e)
# List of 3
# $ : num [1:3] 10 5 4
# $ : chr "2"
# $ : num 8 
 
 e[[1]] # posição 1 [1] 10  5  4
 e[[1]][1]# posição 1 de 1 [1] 10
 e[[1]][2]
 e[[2]]
 
# Matrizes
 m <- matrix(1:9, nrow = 3) #criar a matriz: 1º parametro - valores, 2º parametro quantidade de linhas
 m
 #      [,1] [,2] [,3]
 #[1,]    1    4    7
 #[2,]    2    5    8
 #[3,]    3    6    9
 mode(m)
 class(m)
# percorrer a matriz
 m[1, 3]
 m[1, 3] <- "a" # com a troca de um valor para caracter, todos os valores passaram para este tipo
 m
#      [,1] [,2] [,3]
# [1,] "1"  "4"  "a" 
# [2,] "2"  "5"  "8" 
# [3,] "3"  "6"  "9" 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 




