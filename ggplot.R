a <- read.csv("C:/Users/bruno/Documents/R/as.txt", sep="")

names(a) <- c("peso","genero","idade","altura")

library(ggplot2)

retas <- ggplot(mapping = aes(a$peso, a$altura)) +
  geom_point() +
  geom_smooth(se = FALSE, method = 'lm') +
  geom_hline(yintercept = mean(a$altura))

linhasRed <- retas + geom_segment(aes(x = a$peso, y = a$altura,
  xend = a$peso, yend = mean(a$altura)), color="red")

linhasRed2 <- retas + geom_segment(aes(x = a$peso, y = a$altura,
  xend = a$peso, 
  yend = predict(lm(a$altura ~ a$peso))), color="red")

ondas <- ggplot(mapping = aes(a$peso, a$altura)) +
  geom_point() +
  geom_smooth(method = "lm")

SQt = sum((mean(a$altura) - a$altura)**2)
SQres = sum((predict(lm(a$altura ~ a$peso)) - a$altura)**2)
R2 = (SQt - SQres) / SQt
R2

summary(lm(a$altura ~ a$peso))

predict(lm(a$peso ~ a$altura))

