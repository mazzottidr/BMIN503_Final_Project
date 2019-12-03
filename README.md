# BMIN503/EPID600 Final Project

This repository contains templates for your final written report and GitHub repository. Follow the instructions below to clone this repository, and then turn in your final project's code via a pull request to this repository.

1. To start, **fork** this BMIN503_Final_Project repository.
1. **Clone** the forked repository to your computer.
1. Modify the files provided, add your own, and **commit** changes to complete your final project.
1. **Push**/sync the changes up to your GitHub account.
1. Create a **pull request** on this, the original BMIN503_Final_Project, repository to turn in your final project.

Follow the instructions [here][forking] if you are unsure what the above steps mean.

DUE DATE FOR FINAL VERSION: 12/13/19 11:59PM. This is a hard deadline. Turn in whatever you have by this date.


### Identification of sleep complaints using social media: geographic distribution and effect of changes from daylight savings time to standard time

Author: Diego R. Mazzotti, Ph.D.
Final Project for Data Science for Biomedical Informatics BMIN503/EPID600

This study extracted data from Twitter to identify tweets mentioning sleep complaints at the time of posting. Using the results of a simple machine learning classifier, based on manual annotation of tweets according to their status of whether the tweet reports a sleep complaint at the time of posting, this study classified geotagged tweets posted in the United States. Then, the prevalence of sleep complaints in different geographic regions and the number of tweets posted at different times of the day were investigated. Comparisons of the the number of tweets before and after the change from daylight savings time to standard time were also evaluated in this project.

#### Available files

- `Final_Project_MAZZOTTI.Rmd` and `Final_Project_MAZZOTTI.html`: Main Rmarkdown file where the detailed report is presented, including code, results and plots.

- `stream_USA_tweets_2w.R`: Script to collect Twitter data based on the Twitter API. API keys and tokens were removed from this file for security reasons.

- `post_process_tweets.R`: Script to load tweets in `.json` and parse them into R.

- `load__getTZ_calcTime.R`:  Script to format, adjust the time of posting to the corresponding time zone and correct for daylight savings time (DST)

- `ManualAnnotation_22112019_500.csv`: File containing manual annotations of each tweet (up to first 500 tweets)

- `FINAL_PROJECT_Mazzotti.pptx`: Final project PowerPoint presentation





<!-- Links -->
[forking]: https://guides.github.com/activities/forking/


