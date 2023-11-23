#Modelo 1
# 1 
x <- c(201,225,305,380,560,600,685,735)
y <- c(17,20,21,23,25,24,27,27)
dados <- data.frame(x,y)
is.data.frame(dados)

# 2
regressao<-lm(y~x,data=dados)
regressao

# 3 
summary(regressao)

# 4 
regressao$fitted.values

# 5
regressao$coefficients

# 6
z = plot(x,y)
grid(z)
abline(regressao)

cor(x,y)

#Modelo2
# 7
z = plot(x,y)
grid(z)
dados <- data.frame(x,y)
is.data.frame(dados)

regressao<-lm(y~x,data=dados)


# 8
z = plot(x,y)
grid(z)
abline(regressao)

# 9
cor(x,y)

