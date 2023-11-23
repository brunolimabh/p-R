cnae <- read.csv("C:/Users/bruno/Downloads/Dados empresas x CNAE.csv", sep=";")

# exibindo todos os estabelecimentos
barplot(cnae$Estabelecimentos)

# exibindo os 5 maiores
maiores <- subset(cnae, Estabelecimentos > 470000)
pie(maiores$Estabelecimentos, labels = maiores$Estabelecimentos, main = "5 maiores estabelecimentos", col = rainbow(8))
legend("bottomleft",
       legend = maiores$CNAE,
       pch = 21,
       col = rainbow(8),
       cex = 0.8,
       bty = "n")


# exibindo os 5 menores
menores <- subset(cnae, Estabelecimentos < 2)
pie(menores$Estabelecimentos, labels = menores$Estabelecimentos, main = "5 menores estabelecimentos", col = rainbow(8))
legend("bottomleft",
       legend = menores$CNAE,
       pch = 21,
       col = rainbow(8),
       cex = 0.8,
       bty = "n")
