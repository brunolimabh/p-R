vetor <- c(1,5,3)
vetorNovo <- c()
for(i in seq_along(vetor)){
  if(i == 1) {
  vetorNovo[i] <- vetor[i]
  } else {
    vetorNovo[i] <- vetor[i]+vetor[i-1]
  }
  print(vetorNovo)
}