#Estrutura if

# exemplo 1
 if (5 == 5) 6 + 6

 a <- 6
 b <- 5
 if(a == b){
   a * b
 } else {
   a + b
 }
 
# exemplo 2
 
 idade <- c(25,30)
 nome <- c("Maria", "Jo�o")
 df <- data.frame(nome,idade)
 summary(df)
 View(df)
 str(df) 
 df 
if(df$idade[df$nome=="Maria"] < df$idade[df$nome=="Jo�o"]){
  "mais velho Jo�o"
} else {
  "mais nova Maria" 
}

 df$idade[df$nome=="Maria"]
 df$idade

 df$nome[df$idade== 25]
if(df$nome[df$idade== 25] == "Maria"){
  df$nome[df$idade== 25]
  
}
 
 #Estrutura for
 
 for (i in df$idade) {
   print(i)
 }
 
 v <- 0
 for (i in df$idade) {
  if(i > v){
    v <- i
  }
 }
 v
 df$nome[df$idade == v]
 dfMaiorIdade <- c(df$nome[df$idade == v],v)
 View(dfMaiorIdade)
 str(dfMaiorIdade)
 dfMaiorIdade

# estrutura while
 
 x <- 1
 
 while (x <= 10) {
   print(x)
   x <- x + 1
 }
 
 idades <- c(25,30,24,29,31,12)
 nomes <- c("Jo�o", "Pedro", "Maria", "Leo", "Lia", "Jose")
 df2 <- data.frame(nomes, idades)

 # exemplo pratico
 
 cont <- 0 
 x <- 0 
 y <- 0
 idade100 <- 0
 
 while (y < 100) {
   
   cont = cont + 1
   
   idade100[cont] <- idades[cont]
   
   x <- x + idades[cont]
   y <- x + idades[cont + 1]
 }
 
 idade100
  x
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
  