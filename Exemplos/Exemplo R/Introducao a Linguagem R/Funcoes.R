# Funções 
#--------- Exemplo para declarar uma função e usar ---------
a <- c(423,464,69,519,123,258)

b <- c(51,36,123,98,23,37,63,3)

soma <- function(y){
  
    x <- 0
    for (i in y) {
      x <- x + i
      
    }
    
    print(x)
}

soma(a)
soma(b)


soma2 <- function(y,z){
  a <- 0
  b <- 0
  for (i in y) {
    a <- a + 1
    b <- z[a] + i
    print(b)
    
  }
  
}

soma2(a,b)
soma2(b,a)

#---------- Função ja exitente para somar conteúdo de vetores----------

sum(a)
sum(b)















