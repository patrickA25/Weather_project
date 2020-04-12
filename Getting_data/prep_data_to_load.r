library(tidyverse)
library(lubridate)

setwd("g:/Weather_data/2_Raw_data")


load_files <- list.files()
load_files <- load_files[str_detect(load_files,".csv")]


for(i in 1:length(load_files))
{
  whole_data_file <- read_csv(load_files[i])
  whole_data_file$country_code <- substr(whole_data_file$Station_name,start = 1, stop = 2)
  load_data_file <- whole_data_file %>%
                     filter(country_code == 'US') %>%
                     filter(Factors %in% c('PRCP','SNOW','SNWD','TMAX','TMIN','TAVG'))
  load_data_file[,c('X5','X6','X7','X8','country_code')] <- NULL 
  load_data_file <- load_data_file %>% spread(Factors,X4)
  load_data_file[ ,c('TMAX','TMIN','TAVG')] <- load_data_file[ ,c('TMAX','TMIN','TAVG')]*0.10
  whole_data_file <- NULL
  load_data_file$date <- ymd(load_data_file$data)
  write_delim(load_data_file,
              paste0(substr(load_files[i],start = 1,stop = 4),"_upload_ready.csv"),
              delim = "|")
  load_data_file <- NULL
  whole_data_file <- NULL
  gc()
}


