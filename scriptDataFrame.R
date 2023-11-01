n<- 20000
p<- 200000

set.seed(1234)
idade <- abs(round(rnorm(n, 35, 7),0))

set.seed(1234)
altura <- abs(round(rnorm(n, 1.50, 0.1), 2))

set.seed(1234)
peso <- abs(round(rnorm(n, 55, 4), 2))

set.seed(1234)
imc <- round(peso/altura^2, 2)

set.seed(1234)
salario <- abs(round(rnorm(n, 3000, 400), 2))

pop.carros <- rep(c(0,1,2,3), p)
set.seed(1234)
carros <- sample(pop.carros, n)
rm(pop.carros)

pop.filhos <- rep(c(0,1,2),p)
set.seed(1234)
filhos <- sample(pop.filhos, n)
rm(pop.filhos)

pop.escolaridade <- rep(c(0, 1, 2, 3, 4, 5, 6), p)
set.seed(1234)
escolaridade.temp <- sample(pop.escolaridade, n)
escolaridade <- factor(escolaridade.temp,
                         levels = c(0, 1, 2, 3, 4, 5, 6),
                         labels = c("Analfabeto", "1º Grau", "2º Grau", "3º Grau",
                                    "Mestrado", "Doutorado", "PósDoc"),
                         ordered = TRUE)
rm(pop.escolaridade, escolaridade.temp)

set.seed(1234)
fumante.n <- rbinom(n, 1, .40)
fumante <- factor(fumante.n,
                      levels = c(0, 1),
                      labels = c("não", "sim"),
                      ordered = TRUE)
rm(fumante.n)

pop.sexo <- rep(c(1, 2), p)
set.seed(1234)
sexo.temp <- sample(pop.sexo, n)
sexo <- factor(sexo.temp,
                 levels = c(1, 2),
                 labels = c("M", "F"),
                 ordered = FALSE)
rm(pop.sexo, sexo.temp)

pop.profissao <- rep(0:2, p)
set.seed(1234)
profissao.temp <- sample(pop.profissao, n)
profissao <- factor(profissao.temp,
                      levels = c(0, 1, 2),
                      labels = c("Humanas", "Exatas", "Biológicas"),
                      ordered = FALSE)
rm(pop.profissao, profissao.temp)

df <- data.frame(id = 1:n,
                   idade,
                   altura,
                   peso,
                   imc,
                   sexo,
                   escolaridade,
                   profissao,
                   fumante,
                   salario,
                   carros,
                   filhos)

write.csv(df, file = "dafaFrame.csv", sep = ",", col.names = TRUE, fileEncoding = "UTF-8")


