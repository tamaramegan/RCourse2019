
####  EXERCISES DATE/TIME  ####

setwd("/Users/huetestm/Google Drive/Data_analysis_in_R_for_Marine_Science/Day2_Plots_Maps_Dates/")
dates<-read.table("dates.txt", header=T)   # read the file
str(dates)  # structure of the file
head(dates)   # 6 first observations of dates


#Exercise 1: Convert character into date format (1)
dates$Date1 <- as.POSIXct(strptime(dates$date1, format="%m/%d/%y")) # m for month, d for day, y for year
str(dates$Date1)
#POSIXct[1:46], format: "2015-11-04" "2015-11-09" "2015-11-14" "2015-11-19" ...
dates$Date1
# [1] "2015-11-04" "2015-11-09" "2015-11-14" "2015-11-19" "2015-11-24"
# [6] "2015-11-29" "2015-12-04" "2015-12-09" "2015-12-11" "2015-12-13"
#[11] "2015-12-15" "2015-12-17" "2015-12-19" "2015-12-21" "2015-12-23"
#[16] "2015-12-25" "2015-12-27" "2015-12-29" "2016-01-03" "2016-01-08"
#[21] "2016-01-10" "2016-01-12" "2016-01-14" "2016-01-16" "2016-01-18"
#[26] "2016-01-20" "2016-01-22" "2016-01-24" "2016-01-26" "2016-01-28"
#[31] "2016-01-30" "2016-02-01" "2016-02-03" "2016-02-05" "2016-02-07"
#[36] "2016-02-09" "2016-02-11" "2016-02-13" "2016-02-15" "2016-02-17"
#[41] "2016-02-19" "2016-02-21" "2016-02-23" "2016-02-25" "2016-02-27"
#[46] "2016-02-29"

#Exercise 2: Convert character into date format (2)
dates$Date2 <- as.POSIXct(strptime(dates$date2, format="%m.%d.%Y")) # m for month, d for day, Y for year   #carreful / replaced by . here (see Ex1)
str(dates$Date2)
#POSIXct[1:46], format: "2015-11-04" "2015-11-09" "2015-11-14" "2015-11-19" ...
dates$Date2
# [1] "2015-11-04" "2015-11-09" "2015-11-14" "2015-11-19" "2015-11-24"
# [6] "2015-11-29" "2015-12-04" "2015-12-09" "2015-12-11" "2015-12-13"
#[11] "2015-12-15" "2015-12-17" "2015-12-19" "2015-12-21" "2015-12-23"
#[16] "2015-12-25" "2015-12-27" "2015-12-29" "2016-01-03" "2016-01-08"
#[21] "2016-01-10" "2016-01-12" "2016-01-14" "2016-01-16" "2016-01-18"
#[26] "2016-01-20" "2016-01-22" "2016-01-24" "2016-01-26" "2016-01-28"
#[31] "2016-01-30" "2016-02-01" "2016-02-03" "2016-02-05" "2016-02-07"
#[36] "2016-02-09" "2016-02-11" "2016-02-13" "2016-02-15" "2016-02-17"
#[41] "2016-02-19" "2016-02-21" "2016-02-23" "2016-02-25" "2016-02-27"
#[46] "2016-02-29"


#Exercise 3: Covert julian day and year into date
dates$date3_jdy <- paste(dates$date3_jd, dates$date3_year) #combine the 2 columns (Julian_day and year) in one column
str(dates$date3_jdy)    #date as a character chain
dates$Date3 <- as.POSIXct(strptime(dates$date3_jdy, format="%j %Y"))   #j for julian day and y for year
str(dates$Date3)
# POSIXct[1:46], format: "2015-09-30" "2015-10-01" "2015-10-02" "2015-10-03" ...
dates$Date3
# [1] "2015-09-30" "2015-10-01" "2015-10-02" "2015-10-03" "2015-10-04"
# [6] "2015-10-05" "2015-10-06" "2015-10-07" "2015-10-08" "2015-10-09"
#[11] "2015-10-10" "2015-10-15" "2015-10-20" "2015-10-25" "2015-10-30"
#[16] "2015-11-01" "2015-11-03" "2015-11-05" "2015-11-07" "2015-11-09"
#[21] "2015-11-11" "2015-11-13" "2015-11-15" "2015-11-17" "2015-11-19"
#[26] "2015-11-21" "2015-11-23" "2015-11-25" "2015-11-27" "2015-11-29"
#[31] "2015-12-04" "2015-12-09" "2015-12-11" "2015-12-13" "2015-12-15"
#[36] "2015-12-17" "2015-12-19" "2015-12-21" "2015-12-23" "2015-12-25"
#[41] "2015-12-27" "2015-12-29" "2016-01-01" "2016-01-02" "2016-01-04"
#[46] "2016-01-06"


#Exercise 4: extract values from dates
dates$date2_year <- format(dates$Date2,"%Y") # extract year from Date2
dates$date2_year
# [1] "2015" "2015" "2015" "2015" "2015" "2015" "2015" "2015" "2015" "2015" "2015" "2015" "2015"
#[14] "2015" "2015" "2015" "2015" "2015" "2016" "2016" "2016" "2016" "2016" "2016" "2016" "2016"
#[27] "2016" "2016" "2016" "2016" "2016" "2016" "2016" "2016" "2016" "2016" "2016" "2016" "2016"
#[40] "2016" "2016" "2016" "2016" "2016" "2016" "2016"

dates$date2_month <- format(dates$Date2, "%B") # extract month from Date2
dates$date2_month 
# [1] "November" "November" "November" "November" "November" "November" "December" "December"
# [9] "December" "December" "December" "December" "December" "December" "December" "December"
#[17] "December" "December" "January"  "January"  "January"  "January"  "January"  "January" 
#[25] "January"  "January"  "January"  "January"  "January"  "January"  "January"  "February"
#[33] "February" "February" "February" "February" "February" "February" "February" "February"
#[41] "February" "February" "February" "February" "February" "February"