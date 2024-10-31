# aplicar Machine Learning no R

setwd("C:/Users/Guido A Branco Jr/Desktop/Mestrado/DADOS")

df <- read.csv2("FipePrevAjustada2.csv")
View(df)

#definir uma semente para o gerador de numeros aleatorios por meio da funcao set.seed
set.seed(100)

#separar dados de treino e testes de forma randonica
# sample - cria uma amostra aleatoria com base nos par?metros fornecidos na chamada da fun??o.


linhas <- sample(1:nrow(df), nrow(df) * 0.7)


#dados de treino 70%
#dados de treino sao os dados que serao apresentados ao algoritmo de machine learning
# para criacao do modelo. Estes dados costumam representar cerca de 70% da totalidade dos dados.

treino <- df[linhas,]

# dados de teste 30%
#dados que serao apresentados ao modelo apos a sua criacao, simulando previsoes reais
# que o modelo realizara, permitindo assim que o desempenho real seja verificado.
# Estes dados costumam representar cerca de 30% da totalidade dos dados.

teste <- df[-linhas,]
View(teste)
#criar modelo
# Biblioteca library(rpart) - E uma poderosa biblioteca de aprendizado de maquina em R 
# usada para construir arvores de classificacao e regressao. 
# Esta biblioteca implementa particionamento recursivo e  muito facil de usar.
if(!require(rpart)) install.packages("rpart")
library(rpart)

# modelo aplicado
# esse codigo cria uma arvore de decisão para prever a variável Preço, 
# utilizando todas as outras variaveis do conjunto de dados treino como preditoras, 
# e com uma arvore completamente expandida, sem qualquer poda aplicada.
# texto anexo explicando melhor o modelo

teste$Nome <- factor(teste$Nome, levels = levels(df$Nome))

modelo <- rpart(Preco ~ ., data = treino, control = rpart.control(cp = 0))

#Realizar previsoes
teste$Previsao <- predict(modelo,teste)
View(teste)
summary(teste)
summary(df)
str(teste)
str(df)
 # Após executar o predict o erro foi apresentado: "fator 'Nome' tem novos níveis
 # 225i, 318iA, 330iA, 335i, 420i, 435iA, Aspire, CAMARO, Daimler, EC7, G-55,
 # GENESIS, Intrepid, M1, Micra, QUORIS, Veloster, VKN, Wagon, XJS-C"

 # Este erro ocorreu porque o fator 'Nome' possui novos níveis 
 #(por exemplo, '225i', '318iA', 'CAMARO', etc.) que não estavam 
 # no conjunto de dados original quando o modelo foi treinado. 
 # Isso acontece porque o modelo espera que todas as categorias 
 # dos fatores usados no treinamento estejam presentes também no 
 # novo conjunto de dados. Quando ele encontra novos níveis que 
 # não estavam no treinamento, ele gera esse erro.
 # Para resolver foi utilizada a função factor() para garantir 
 # que os níveis do fator no novo conjunto de dados sejam os mesmos
 # do conjunto de dados de treinamento:
 # teste$Nome <- factor(teste$Nome, levels = levels(df$Nome))

 # Analisar resultados
 # Este código está calculando a diferença percentual entre duas colunas
 # de um data frame chamado teste: a coluna Previsao e a coluna Preco. 
 # Este código está criando uma nova coluna P no data frame teste, onde 
 # cada valor é a diferença percentual absoluta entre a previsão (Previsao)
 # e o preço real (Preco). O valor percentual é arredondado a quatro casas
 # decimais. O resultado final indica o quão próximo a previsão estava do 
 # preço real, expressando isso em uma forma percentual.
 
 teste$P <- abs(round(teste$Previsao/teste$Preco,4)-1)
 R_1 <- summary(teste$P)
 R_1

 #teste$Previsao/teste$Preco:
 # Esta operação divide os valores da coluna Previsao pelos valores 
 # correspondentes da coluna Preco em cada linha do data frame teste. 
 # round(..., 4):
 # A função round(..., 4) arredonda o resultado da divisão para quatro 
 # casas decimais.
 #abs(... - 1):
 # A função abs(... - 1) calcula a diferença entre o valor arredondado 
 # e 1, e então aplica a função abs, que retorna o valor absoluto 
 # (ou seja, sem sinal negativo).
 # teste$P <-:
 #  Finalmente, o resultado dessa operação é atribuído a uma nova 
 # coluna chamada P no data frame teste. 

 # Analisar distribuicao dos precos excluindo os 10% mais caros
 
 hist(df$Preco[df$Preco<quantile(df$Preco,0.90)], breaks = 10, labels = T)
 
 R_Final_1 <- summary(teste$P[teste$Preco>10000 & teste$Preco<70000])
 R_1
 R_Final_1
 

