#install.packages(c("ggplot2", "ggpubr", "tidyverse", "broom", "AICcmodavg"))

library(ggplot2)
library(ggpubr)
library(tidyverse)
library(broom)
library(AICcmodavg)

medicamentos <- read.csv("C:/Users/bruno/Documents/projetosR/datasets/teste.anova.medicamento.csv", 
                         header = TRUE,
                         sep=";",
                         colClasses = c("factor", "numeric"))
summary(medicamentos)

unidirecional <- aov(tempo ~ medicamento, data = medicamentos)
summary(unidirecional)

par(mfrow=c(2,2))
plot(unidirecional)
par(mfrow=c(1,1))

tukey.unidirecional <-TukeyHSD(unidirecional)
tukey.unidirecional

tukey.plot.aov<-aov(tempo ~ medicamento, data=medicamentos)
tukey.plot.test<-TukeyHSD(tukey.plot.aov)
plot(tukey.plot.test, las = 1)

