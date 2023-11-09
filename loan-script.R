#install.packages("tidyverse") 
#install.packages("ggthemes")
#install.packages("corrplot")
#install.packages("GGally")
#install.packages("DT")
#install.packages("caret")
#install.packages("magrittr")
#install.packages("Amelia")


library(tidyverse) # trabalha com vários tipos de estruturas de dados
library(ggthemes) # pacotes de temas e escalas aplicados a financeiro
library(corrplot)# pacote gráfico de matrix de correlação
library(GGally)# combina dados de matrix em interações geométricas
library(DT)# matrizes ou data frame que podem ser representados em HTML
library(caret)# simplificação de modelos preditivos
library(magrittr)
library(Amelia)


loan <- read.csv("C:/Users/bruno/Documents/projetosR/loan.set.csv")

colnames(loan)

loanteste1 = loan %>%
  select(Loan_Status, LoanAmount, Credit_History, Gender, ApplicantIncome, Loan_Amount_Term)

#Verificando quantos NA existem na base de dados
sapply(loanteste1, function(x) sum(is.na(x)))

#Retirando os NA dos dados
loanteste2 = loanteste1 %>%
  filter(!is.na(Loan_Amount_Term),
    !is.na(LoanAmount),
    !is.na(Credit_History))

#Outra maneira de retirar os NA
loan1<-na.omit(loan)
sapply(loan1 , function(x) sum(is.na(x)))



#Análise Exploratória dos dados
#empréstimo_status
loanteste2 %>%
  count(Loan_Status) %>%
  ggplot(aes(x = reorder(Loan_Status , desc(n)), y = n , fill = n )) +
  geom_col() +
  coord_flip() +
  labs(x = 'Status Empréstimo', y = 'Count')
  
#Análises de concessão de crédito:
#Renda do Requerente do empréstimo e graduação
ggplot(loan, aes(x = Education, y = ApplicantIncome, fill = Education)) +
  geom_boxplot() +
  theme_gray()+
  labs(y='Renda Requerente', x= 'Graduação')
#Vamos limpar esses outliers.
loanteste3 = loan %>%
  select(Loan_Status, LoanAmount,Credit_History,Gender, ApplicantIncome,Loan_Amount_Term, Education)
loanteste3
#Vamos retirar os NAs
loansubset1<-na.omit(loanteste3)
loansubset1
summary(loansubset1)

#Vamos localizar os valores outliers para remoção. Observando o valor máximo de 81000 em ApplicantIncome.
loansubset2<-loansubset1[loansubset1$ApplicantIncome>80000,]
#O subset loansubset2 mostra as linhas com valores acima de 80000, para localizar a linha a ser removida.

#Vamos fazer um subset novo a partir da remoção da linha encontrada com o outlier. No entando precisamos incluir uma coluna de ID.
summary(loansubset1)
loansubset1$id<-c(1:529)

loansubset2<-loansubset1[loansubset1$ApplicantIncome>80000,]
loansubset2

#E o id que porcuramos relativo ao outlier 81000 é o 352.
#Vamos remover agora:
loanremove<-loansubset1[-352,]
summary(loanremove)

#O máximo valor de ApplicantIncome é 63337. Vamos ver como ficam o boxplot.

#Vamos ajustar um novo subset desta vez removendo os outliers acima de 40000, mas vamos verificar qunatos teremos que remover
loansubset2<-loansubset1[loansubset1$ApplicantIncome>40000,]

#Vamos remover os três id, lembre-se que não removemos da base original já tratada criamos outro subset de remoção
loanremove1<-loansubset1[-352,]
loanremove2<-loanremove1[-285,]
loanremove3<-loanremove2[-144,]
loanremove3




#Vamos trabalhar com um modelo de Regressão Logística:
library(Amelia)
missmap(loanremove3,main = "valores ausentes")
#Verificamos que não temos valores ausentes no dataset loanremove3.

