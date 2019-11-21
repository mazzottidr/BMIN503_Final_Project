# Load all tweets and create one data frame, get time zone and calculate local time of the tweet, according to time zone
library(dplyr)
library(lutz)
library(lubridate)

# Get all files to process based on regular expressions
files_to_process <- dir(path = ".", pattern = "^segment*.+Rdata")

# Load each file as a list
tweet_list <-  list()
for (f in files_to_process) {
        
        message(paste0("Processing: ", f))
        
        tweet_list[[f]] <- readRDS(f)
        
}

# Convert to data frame
tweet_df <-  bind_rows(tweet_list)

rm(tweet_list) # Remove list to save memory


# Find which timezones have DST changes and calculate local time
tweet_df_final <- tweet_df %>%
        # Find timezones. Caveat: "fast" might be less accurate
        mutate(Timezone=tz_lookup_coords(lat, lng, method = "fast")) %>%
        # Select only relevant columns
        select(user_id, created_at, text, place_url, place_name, place_full_name, place_type, country,
               country_code, lat, lng, coords_coords, Timezone) %>%
        # remove tweets that were not mapped to any Timezone (is.na(Timezone)) - only small number of tweets - N=185
        filter(!is.na(Timezone)) %>%
        
        # Convert created_at UTC to corresponding time zone and extract the offset given considering daylight savings time (DST)
        rowwise() %>%
        mutate(created_at_TZadj=force_tz(created_at, Timezone),
               tz_offset=tz_offset(created_at_TZadj, tz =Timezone)$utc_offset_h) %>%
        as.data.frame() %>%
        # Calculate final Local Time, taking into account DST
        mutate(LocalTime=created_at + hours(tz_offset))
        
# Save dataset (N tweets = 4699612)
saveRDS(tweet_df_final, "Processed_Tweets_11202019.Rdata")
