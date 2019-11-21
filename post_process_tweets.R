# Processing Tweets after collection
# This script is design to process tweets in smaller chunks
# Diego Mazzotti
# November 2019

# Load necessary packages
library(rtweet)
library(dplyr)

# Get list of files to process
files_to_process <- dir(path = ".", pattern = "^segment*.[^Rdata]$")

# For each file in list, load, extract relevant information, process coordinates and save as Rdata object
i=1
for (f in files_to_process) {
        
        # If corresponding file already processed, skip
        if (file.exists(paste0(f, ".parsed_short.Rdata"))) {
                
                i=i+1
                next()
                
                }
        
        # Create counter to evaluate progression
        message(paste0("Processing: ", f))
        message(paste0((i/length(files_to_process))*100), " %")
        
        # Parse json tweets into R
        parsed <- parse_stream(f)
        
        # Select only columns that are relevant for this study
        parsed_short <- parsed %>%
                select(user_id, created_at,text, retweet_count, favorite_count, is_retweet, place_url, place_name, place_full_name, place_type, country,
                       country_code, bbox_coords) %>%
                lat_lng() %>% # Calculate latitude and longitude based on geocoordinates available in each tweet
                filter(!is_retweet) # Filter out re-tweets
        
        # Save in Rdata format
        saveRDS(parsed_short, paste0(f, ".parsed_short.Rdata"))
        
        i=i+1
        
        message("Done!")
}