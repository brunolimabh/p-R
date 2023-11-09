#Importando o csv
heart <- read.csv("C:/Users/bruno/Documents/projetosR/heart.data.csv")
summary(heart)

# a) Independência das observações
cor(heart$biking, heart$smoking)

# b) Normalidade
hist(heart$heart.disease)

# c) Linearidade
plot(heart.disease ~ biking, data=heart)
plot(heart.disease ~ smoking, data=heart)

# d) Homocedasticidade
heart.disease.lm <- lm(heart.disease ~ biking + smoking, data = heart)
summary(heart.disease.lm)

par(mfrow=c(2,2))
plot(heart.disease.lm)
par(mfrow=c(1,1))


plotting.data<-expand.grid(
  biking = seq(min(heart$biking), max(heart$biking), length.out=30),
  smoking=c(min(heart$smoking), mean(heart$smoking), max(heart$smoking)))

plotting.data$predicted.y <- predict.lm(heart.disease.lm, newdata=plotting.data)

#Arredondando a coluna smoking para 2 casas decimais
plotting.data$smoking <- round(plotting.data$smoking, digits = 2)

#Mudando a variavel smoking para um fator
plotting.data$smoking <- as.factor(plotting.data$smoking)

#Plotando os dados originais
heart.plot <- ggplot(heart, aes(x=biking, y=heart.disease)) +
  geom_point()

#Adicionando as linhas de regressão
heart.plot <- heart.plot +
  geom_line(data=plotting.data, aes(x=biking, y=predicted.y, color=smoking), size=1.25)

#Preparando o gráfico para publicação
heart.plot <- 
  heart.plot +
  theme_bw() +
  labs(title = "Rates of heart disease (% of population) \n as function of biking to word and smoking",
    x = "Biking to work (% of population)",
    y = "Heart disease (% of population)",
    color = "Smoking \n (% of population)")

#Adicionando modelo de regrassão ao gráfico
heart.plot + annotate(geom="text", x=30, y=1.75, label=" = 15 + (-0.2*biking) + (0.178*smoking)")