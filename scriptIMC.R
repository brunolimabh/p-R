name <- readline(prompt = "Digite seu nome:")
print(name)
peso <- readline("Informe seu peso:")
peso <- as.integer(peso)
altura <- readline("Informe sua altura:")
altura <- as.double(altura)
IMC <- peso/altura**2
print(round(IMC,2))
