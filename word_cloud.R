snapchat_text = sapply(Snapchat.tweets, function(x) x$getText()) #sapply returns a vector 
df <- do.call("rbind", lapply(Snapchat.tweets, as.data.frame)) #lapply returns a list
snapchat_text <- sapply(df$text,function(row) iconv(row, "latin1", "ASCII", sub=""))
str(snapchat_text) #gives the summary/internal structure of an R object

library(tm) #tm: text mining
snapchat_corpus <- Corpus(VectorSource(snapchat_text)) #corpus is a collection of text documents
snapchat_corpus
inspect(snapchat_corpus[1])

#clean text
library(wordcloud)
snapchat_clean <- tm_map(snapchat_corpus, removePunctuation)
snapchat_clean <- tm_map(snapchat_clean, removeWords, stopwords("english"))
snapchat_clean <- tm_map(snapchat_clean, removeNumbers)
snapchat_clean <- tm_map(snapchat_clean, stripWhitespace)
wordcloud(snapchat_clean, random.order=F,max.words=80, col=rainbow(50), scale=c(3.5,1))