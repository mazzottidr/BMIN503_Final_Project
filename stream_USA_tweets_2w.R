## Load packages
library(rtweet)

## store api keys (these are fake example values; replace with your own keys)
api_key <- "2fS8eVCg0SL8OfVYKDSuYEOh8"
api_secret_key <- "9qfoKeeJOwKLACh6baNsqCsEwONL2kerNg4mn3DHh4NmYw8CiG"
access_token <- "1588255170-lHkE95h7u7oxqIcX8L33XPNCP9n5Z3w9jniO7Jg"
access_token_secret <- "VOeq0PLg4Ak4nacTqPJ4vHwKXxJIIbC529wwNVRV43HuH"

## authenticate via web browser
token <- create_token(
        app = "sleep_tweet_mazzottidr",
        consumer_key = api_key,
        consumer_secret = api_secret_key,
        access_token = access_token,
        access_secret = access_token_secret)

t <- gsub(" ", "", gsub(":", "", gsub("-", "", Sys.time())))

fname <- paste0("USA_tweets_", t, ".json")

# Stream tweets in the USA for 2 weeks
stream_tweets(lookup_coords("usa"), timeout = 60*60*24*14, parse = F, gzip=T, language = "en", file_name = fname)
#stream_tweets(lookup_coords("usa"), timeout = 10, parse = F, gzip=T, language = "en", file_name = fname)

