############################
### DATES and TIMES   ###### 
############################

####  1. ONLY DATE  ####
# special class Date
class(as.Date("2011-6-17")) 

# direct formats to covert form charcter to date:
as.Date("2011/6/17")
as.Date("6/17/2011")

# transform from other formats:
as.Date("6/17/2011","%m/%d/%Y")
as.Date("17/6/2001","%d/%m/%Y")
as.Date("17/6/01","%d/%m/%y")
as.Date("June 17, 2011","%B %d, %Y")
as.Date("17JUN-11","%d%b-%y")


####  2. DATE AND TIME  ####
# special class POSIXlt or POSIXct
# POSIXct stores date/time values as a NUMBER in seconds since January 1, 1970
# POSIXlt stores date/time values as a LIST in seconds since January 1, 1970
class(as.POSIXct("2005-06-24 11:25"))

## direct formats:
as.POSIXct("2005-06-24")
as.POSIXct("2005-06-24 11:25")
as.POSIXct("2005-06-24 11:25:00")
as.POSIXct("2005/06/24 11:25")
as.POSIXct("2005/06/24 11:25:00")

## specify timezone
as.POSIXct("2005/06/24 11:25:00",tz="Asia/Riyadh")
as.POSIXct("2005/06/24 11:25:00",tz="GMT")
# change timezone ( Sys.timezone() shows the timezone on your computer)
format(as.POSIXct("2005/06/24 11:25:00",tz="GMT"),tz="Asia/Riyadh")

# transform from other formats:
strptime("24/Jun/2005:07:51:00",format="%d/%b/%Y:%H:%M:%S") # class POSIXlt 
as.POSIXct(strptime("24/Jun/2005:07:51:00",format="%d/%b/%Y:%H:%M:%S")) # class POSIXct 



####  3. OPERATIONS WITH DATE/TIME  ####

# extract day of week from date
weekdays(as.Date("28-Jan-2019", format="%d-%b-%Y"))

# get the difference in time units between two dates
difftime("2019-01-20","2017-07-07", units="weeks") # in weeks
difftime("2019-01-20","2017-07-07", units="days") # in days
difftime("2019-01-20","2017-07-07", units="hours") # in hours

format(as.POSIXct("2019-01-20"),"%Y") # year
format(as.POSIXct("2019-01-20"),"%B") # full month
format(as.POSIXct("2019-01-20"),"%a") # day of week
