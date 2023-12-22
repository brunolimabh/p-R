epIV <- read.csv("C:/Users/bruno/Documents/projetosR/datasets/SW_EpisodeIV_ptBR.txt", sep="")
epV <- read.csv("C:/Users/bruno/Documents/projetosR/datasets/SW_EpisodeV_ptBR.txt", sep="")
epVI <- read.csv("C:/Users/bruno/Documents/projetosR/datasets/SW_EpisodeVI_ptBR.txt", sep="")

#Em relação ao sentimento, eu não consegui, tentei implementar a biblioteca 
# "sentimentr" e a "syuzhet", mas não consegui chegar a lugar nenhum.


#install.packages(c("wordcloud","RColorBrewer","wordcloud2","tm","syuzhet"))
library(wordcloud)
library(RColorBrewer)
library(wordcloud2)
library(tm)
library(syuzhet)

#Ep IV

docsIV <- Corpus(VectorSource(epIV$personagem))

dtmIV <- TermDocumentMatrix(docsIV)
matrixIV <- as.matrix(dtmIV)
wordsIV <- sort(rowSums(matrixIV),decreasing = TRUE)
dfIV <- data.frame(word = names(wordsIV),freq=wordsIV)

wordcloud(words = dfIV$word, 
          freq = dfIV$freq,
          min.freq = 1, 
          random.order = FALSE, 
          rot.per = 0.35,
          colors = brewer.pal(8, "Dark2"),
          scale = c(2,1))

cloud_dois_IV <- wordcloud2(data = dfIV, 
           size = 0.7, 
           color = 'random-light', 
           backgroundColor = 'black', 
           rotateRatio = 0, 
           shape = 'circle')

#EP V

docsV <- Corpus(VectorSource(epV$personagem))

dtmV <- TermDocumentMatrix(docsV)
matrixV <- as.matrix(dtmV)
wordsV <- sort(rowSums(matrixV),decreasing = TRUE)
dfV <- data.frame(word = names(wordsV),freq=wordsV)

wordcloud(words = dfV$word, 
          freq = dfV$freq,
          min.freq = 1, 
          random.order = FALSE, 
          rot.per = 0.35,
          colors = brewer.pal(8, "Dark2"),
          scale = c(2,1))

cloud_dois_V <- wordcloud2(data = dfV, 
                           size = 0.7, 
                           color = 'random-light', 
                           backgroundColor = 'black', 
                           rotateRatio = 0, 
                           shape = 'circle')



#EP VI

docsVI <- Corpus(VectorSource(epVI$personagem))

dtmVI <- TermDocumentMatrix(docsVI)
matrixVI <- as.matrix(dtmVI)
wordsVI <- sort(rowSums(matrixVI),decreasing = TRUE)
dfVI <- data.frame(word = names(wordsVI),freq=wordsVI)

wordcloud(words = dfVI$word, 
          freq = dfVI$freq,
          min.freq = 1, 
          random.order = FALSE, 
          rot.per = 0.35,
          colors = brewer.pal(8, "Dark2"),
          scale = c(2,1))

cloud_dois_VI <- wordcloud2(data = dfVI, 
                           size = 0.7, 
                           color = 'random-light', 
                           backgroundColor = 'black', 
                           rotateRatio = 0, 
                           shape = 'circle')

