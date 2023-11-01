num1 <- readline(prompt = "Digite o 1° numero:")
num2 <- readline(prompt = "Digite o 2° numero:")

if(num1 == num2) {
  print("Os numeros são iguais")
} else if(num1 > num2) {
  print("Os 1° numero é maior que o 2°")
} else {
  print("Os 2° numero é maior que o 1°")
  
}