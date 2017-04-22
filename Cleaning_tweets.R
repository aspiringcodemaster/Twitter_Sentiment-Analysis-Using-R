#Extract tweets
Snapchat.tweets = searchTwitter("Snapchat", n=1500)
#Convert it to data frame
df <- do.call("rbind", lapply(Snapchat.tweets, as.data.frame))
df$text <- sapply(df$text, function(row) iconv(row,"latin1","ASCII",sub=""))
df$text=gsub("(f|ht)tp(s?)://(.*)[.][a-z]+","",df$text)
sample <- df$text
