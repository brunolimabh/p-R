
#Instalando pacotes necessarios
#install.packages("ggplot2")
#install.packages("dplyr")
#install.packages("broom")
#install.packages("ggpubr")
#install.packages("tidyverse")
#install.packages("ggmisc")

#Usando os pacotes
library(ggplot2)
library(dplyr)
library(broom)
library(ggpubr)
library(tidyverse)
library(tidyverse)


#Importanto o csv "income.data"
income.data <- read.csv("C:/Users/bruno/Documents/projetosR/income.data.csv")
#Removendo os ID da tabela
income.data$X <- NULL

summary(income.data)

#Normalidade
#Para verificar se a variável dependente segue uma distribuição normal , use a hist()função.
hist(income.data$happiness)

#Linearidade
#A relação entre a variável independente e dependente deve ser linear.


#Homocedasticidade
#Para realizar uma análise de regressão linear simples e verificar os resultados, você precisa executar duas linhas de código. A primeira linha de código cria o modelo linear e a segunda linha imprime o resumo do modelo
income.happiness.lm <- lm(happiness ~ income, data = income.data)
summary(income.happiness.lm)

#Estes são os gráficos residuais
par(mfrow=c(2,2))
plot(income.happiness.lm)
par(mfrow=c(1,1))

#A última etapa, é a visualização dos resultados por meio de gráficos, na regressão linear simples
# a) Plotando os pontos de dados em um gráfico
income.graph <- ggplot(income.data, aes(x=income, y=happiness)) + geom_point()
income.graph

# b) Adicionando a linha de regressão linear aos dados plotados
income.graph <- income.graph + geom_smooth(method = "lm", col="black")
income.graph

# c) Adicionando a equação para a linha de regressão
income.graph <- income.graph + 
stat_regline_equation(label.x = 3, label.y = 7)
income.graph

# d) Preparando o gráfico para publicação
income.graph + 
  theme_bw() +
  labs(title = "Reported happiness as a function of income",
    x = "Icome (x$10,000)",
    y = "Happiness score (0 to 10)")
