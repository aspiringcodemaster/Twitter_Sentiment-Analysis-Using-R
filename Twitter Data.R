library(ROAuth)
library (twitteR)
consumer_key <- "MgV8KzWCBGhZ2xwKvGLaRe68R"
consumer_secret <- "QwULkfg2ZfFLOaQRfIl1LRoczc78nfCTwekYG0WuRjvGSNv0B3"
access_token <-"169940015-JCDir3Ei0rqzN6nYfZEsTH9m5ofxfuYAAfigOc3F"
access_secret <- "QZh2RwtWsRPPRDvpCBuQjduMR5iU4oDbv7QDu7TDf6shx"

download.file(url="http://curl.haxx.se/ca/cacert.pem", destfile = "cacert.pem")

setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)

cred <- OAuthFactory$new(consumerKey = consumer_key, consumerSecret=consumer_secret, requestURL='https://api.twitter.com/oauth/request_token', 
accessURL='https://api.twitter.com/oauth/access_token',authURL='https://api.twitter.com/oauth/authorize')

cred$handshake (cainfo="cacert.pem")