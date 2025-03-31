## Data Cleaning

## First Dataset (3/12/2016 - 4/11/2016)

## Cleaning process for dailyActivity_1_cleaned

## Checking for missing or null values
sum(is.na(dailyActivity_1_cleaned))

## Understanding the data structure
head(dailyActivity_1_cleaned)
glimpse(dailyActivity_1_cleaned)
View(dailyActivity_1_cleaned)

## Changing datatype of Activity_Date from character to date
dailyActivity_1_cleaned$Activity_Date <- lubridate::mdy(dailyActivity_1_cleaned$Activity_Date)

## Checking date range
summarize(dailyActivity_1_cleaned, min_date = min(Activity_Date), max_date = max(Activity_Date))
## This dataframe contains data from 3/29/2016 to 4/12/2016

## to ensure column names are consistent and formatted
dailyActivity_1_cleaned <- clean_names(dailyActivity_1_cleaned)

## Checking for duplicates
dailyActivity_1_cleaned %>%
  count(id, activity_date) %>%
  filter(n > 1)


## Cleaning process for heartrate_seconds_1_cleaned

## Checking for missing or null values
sum(is.na(heartrate_seconds_1))

## Separating Time column into Date and Time
heartrate_seconds_1_cleaned <- heartrate_seconds_1 %>%
  mutate(Time = mdy_hms(Time, tz = "UTC"),
         date = as.Date(Time),                
         time = format(Time, "%H:%M:%S"))

heartrate_seconds_1_cleaned <- select(heartrate_seconds_1_cleaned, - Time)

glimpse(heartrate_seconds_1_cleaned)

## Changing datatype of Time from character to time
heartrate_seconds_1_cleaned$time <- lubridate::hms(heartrate_seconds_1_cleaned$time)

## Checking date range
summarize(heartrate_seconds_1_cleaned, min_date = min(date), max_date = max(date))
## This dataframe contains data from 3/29/2016 to 4/12/2016

## Removing 4/12/2016 data from Date column
heartrate_seconds_1_cleaned <- subset(heartrate_seconds_1_cleaned, date != "2016-04-12")

## to ensure column names are consistent and formatted
heartrate_seconds_1_cleaned <- clean_names(heartrate_seconds_1_cleaned)

## Checking for duplicates
heartrate_seconds_1_cleaned %>%
  count(id, date, time) %>%
  filter(n > 1)


## Cleaning process for hourlyCalories_1_cleaned

## Checking for missing or null values
sum(is.na(hourlyCalories_1))

## Understanding the data structure
head(hourlyCalories_1)
glimpse(hourlyCalories_1)
View(hourlyCalories_1)

## Separating Time column into Date and Time
hourlyCalories_1_cleaned <- hourlyCalories_1 %>%
  mutate(ActivityHour = mdy_hms(ActivityHour, tz = "UTC"),
        date = as.Date(ActivityHour),                
         time = format(ActivityHour, "%H:%M:%S"))

hourlyCalories_1_cleaned <- select(hourlyCalories_1_cleaned, - ActivityHour)

glimpse(hourlyCalories_1_cleaned)

## Changing datatype of Time from character to time
hourlyCalories_1_cleaned$time <- lubridate::hms(hourlyCalories_1_cleaned$time)

## Checking date range
summarize(hourlyCalories_1_cleaned, min_date = min(date), max_date = max(date))
## This dataframe contains data on 4/12/2016

## Removing 4/12/2016 data from Date column
hourlyCalories_1_cleaned <- subset(hourlyCalories_1_cleaned, date != "2016-04-12")

## to ensure column names are consistent and formatted
hourlyCalories_1_cleaned <- clean_names(hourlyCalories_1_cleaned)

## Checking for duplicates
hourlyCalories_1_cleaned %>%
  count(id, date, time) %>%
  filter(n > 1)


## Cleaning process for hourlyIntensities_1_cleaned

## Checking for missing or null values
sum(is.na(hourlyIntensities_1))

## Understanding the data structure
head(hourlyIntensities_1)
glimpse(hourlyIntensities_1)
View(hourlyIntensities_1)

## Separating Time column into Date and Time
hourlyIntensities_1_cleaned <- hourlyIntensities_1 %>%
  mutate(ActivityHour = mdy_hms(ActivityHour, tz = "UTC"),
         Date = as.Date(ActivityHour),                
         Time = format(ActivityHour, "%H:%M:%S"))

hourlyIntensities_1_cleaned <- select(hourlyIntensities_1_cleaned, - ActivityHour)

glimpse(hourlyIntensities_1_cleaned)

## Changing datatype of Time from character to time
hourlyIntensities_1_cleaned$Time <- lubridate::hms(hourlyIntensities_1_cleaned$Time)

## Checking date range
summarize(hourlyIntensities_1_cleaned, min_date = min(Date), max_date = max(Date))
## This dataframe contains data on 4/12/2016

## Removing 4/12/2016 data from Date column
hourlyIntensities_1_cleaned <- subset(hourlyIntensities_1_cleaned, Date != "2016-04-12")

##Renaming TotalIntensity to Total_Intensity
hourlyIntensities_1_cleaned <- rename(hourlyIntensities_1_cleaned, Total_Intensity = TotalIntensity)

##Renaming AverageIntensity to Average_Intensity
hourlyIntensities_1_cleaned <- rename(hourlyIntensities_1_cleaned, Average_Intensity = AverageIntensity)

## to ensure column names are consistent and formatted
hourlyIntensities_1_cleaned <- clean_names(hourlyIntensities_1_cleaned)

## Checking for duplicates
hourlyIntensities_1_cleaned %>%
  count(id, date, time) %>%
  filter(n > 1)


## Cleaning process for hourlySteps_1_cleaned

## Checking for missing or null values
sum(is.na(hourlySteps_1))

## Understanding the data structure
head(hourlySteps_1)
glimpse(hourlySteps_1)
View(hourlySteps_1)

## Separating ActivityHour column into Date and Time
hourlySteps_1_cleaned <- hourlySteps_1 %>%
  mutate(ActivityHour = mdy_hms(ActivityHour, tz = "UTC"),
         Date = as.Date(ActivityHour),                
         Time = format(ActivityHour, "%H:%M:%S"))

hourlySteps_1_cleaned <- select(hourlySteps_1_cleaned, - ActivityHour)

glimpse(hourlySteps_1_cleaned)

## Changing datatype of Time from character to time
hourlySteps_1_cleaned$Time <- lubridate::hms(hourlySteps_1_cleaned$Time)

## Checking date range
summarize(hourlySteps_1_cleaned, min_date = min(Date), max_date = max(Date))
## This dataframe contains data on 4/12/2016

## Removing 4/12/2016 data from Date column
hourlySteps_1_cleaned <- subset(hourlySteps_1_cleaned, Date != "2016-04-12")

## Renaming StepTotal to Step_Total
hourlySteps_1_cleaned <- rename(hourlySteps_1_cleaned, Step_Total = StepTotal)

## to ensure column names are consistent and formatted
hourlySteps_1_cleaned <- clean_names(hourlySteps_1_cleaned)

## Checking for duplicates
hourlySteps_1_cleaned %>%
  count(id, date, time) %>%
  filter(n > 1)


## Cleaning process for minuteCaloriesNarrow_1_cleaned

## Checking for missing or null values
sum(is.na(minuteCaloriesNarrow_1))

## Understanding the data structure
head(minuteCaloriesNarrow_1)
glimpse(minuteCaloriesNarrow_1)
View(minuteCaloriesNarrow_1)

## Separating ActivityMinute column into Date and Time
minuteCaloriesNarrow_1_cleaned <- minuteCaloriesNarrow_1 %>%
  mutate(ActivityMinute = mdy_hms(ActivityMinute, tz = "UTC"),
         Activity_Date = as.Date(ActivityMinute),                
         Activity_Time = format(ActivityMinute, "%H:%M:%S"))

minuteCaloriesNarrow_1_cleaned <- select(minuteCaloriesNarrow_1_cleaned, - ActivityMinute)

glimpse(minuteCaloriesNarrow_1_cleaned)

## Changing datatype of Time from character to time
minuteCaloriesNarrow_1_cleaned$Activity_Time <- lubridate::hms(minuteCaloriesNarrow_1_cleaned$Activity_Time)

## This dataframe contains data from 3/12/2016 to 4/12/2016
## Removing data on 4/12/2016
minuteCaloriesNarrow_1_cleaned <- subset(minuteCaloriesNarrow_1_cleaned, Activity_Date != "2016-04-12")

## to ensure column names are consistent and formatted
minuteCaloriesNarrow_1_cleaned <- clean_names(minuteCaloriesNarrow_1_cleaned)

## Checking for duplicates
minuteCaloriesNarrow_1_cleaned %>%
  count(id, activity_date, activity_time) %>%
  filter(n > 1)


## Cleaning process for minuteIntensitiesNarrow_1_cleaned

## Checking for missing or null values
sum(is.na(minuteIntensitiesNarrow_1))

## Understanding the data structure
head(minuteIntensitiesNarrow_1)
glimpse(minuteIntensitiesNarrow_1)
View(minuteIntensitiesNarrow_1)

## Separating ActivityMinute column into Date and Time
minuteIntensitiesNarrow_1_cleaned <- minuteIntensitiesNarrow_1 %>%
  mutate(ActivityMinute = mdy_hms(ActivityMinute, tz = "UTC"),
         Activity_Date = as.Date(ActivityMinute),                
         Activity_Time = format(ActivityMinute, "%H:%M:%S"))

minuteIntensitiesNarrow_1_cleaned <- select(minuteIntensitiesNarrow_1_cleaned, - ActivityMinute)

glimpse(minuteIntensitiesNarrow_1_cleaned)

## Changing datatype of Time from character to time
minuteIntensitiesNarrow_1_cleaned$Activity_Time <- lubridate::hms(minuteIntensitiesNarrow_1_cleaned$Activity_Time)

## This dataframe contains data from 3/12/2016 to 4/12/2016
## Removing data on 4/12/2016
minuteIntensitiesNarrow_1_cleaned <- subset(minuteIntensitiesNarrow_1_cleaned, Activity_Date != "2016-04-12")

## to ensure column names are consistent and formatted
minuteIntensitiesNarrow_1_cleaned <- clean_names(minuteIntensitiesNarrow_1_cleaned)

## Checking for duplicates
minuteIntensitiesNarrow_1_cleaned %>%
  count(id, activity_date, activity_time) %>%
  filter(n > 1)


## Cleaning process for minuteMETsNarrow_1_cleaned

## Checking for missing or null values
sum(is.na(minuteMETsNarrow_1))

## Understanding the data structure
head(minuteMETsNarrow_1)
glimpse(minuteMETsNarrow_1)
View(minuteMETsNarrow_1)

## Separating ActivityMinute column into Date and Time
minuteMETsNarrow_1_cleaned <- minuteMETsNarrow_1 %>%
  mutate(ActivityMinute = mdy_hms(ActivityMinute, tz = "UTC"),
         Activity_Date = as.Date(ActivityMinute),                
         Activity_Time = format(ActivityMinute, "%H:%M:%S"))

minuteMETsNarrow_1_cleaned <- select(minuteMETsNarrow_1_cleaned, - ActivityMinute)

glimpse(minuteMETsNarrow_1_cleaned)

## Changing datatype of Time from character to time
minuteMETsNarrow_1_cleaned$Activity_Time <- lubridate::hms(minuteMETsNarrow_1_cleaned$Activity_Time)

## This dataframe contains data from 3/12/2016 to 4/12/2016
## Removing data on 4/12/2016
minuteMETsNarrow_1_cleaned <- subset(minuteMETsNarrow_1_cleaned, Activity_Date != "2016-04-12")

## to ensure column names are consistent and formatted
minuteMETsNarrow_1_cleaned <- clean_names(minuteMETsNarrow_1_cleaned)

## renaming METs column
minuteMETsNarrow_1_cleaned <- rename(minuteMETsNarrow_1_cleaned, met_s = me_ts)

## Checking for duplicates
minuteMETsNarrow_1_cleaned %>%
  count(id, activity_date, activity_time) %>%
  filter(n > 1)


## Cleaning process for minuteSleep_1_cleaned

## Checking for missing or null values
sum(is.na(minuteSleep_1))

## Understanding the data structure
head(minuteSleep_1)
glimpse(minuteSleep_1)
View(minuteSleep_1)

## Separating date column into Date and Time
minuteSleep_1_cleaned <- minuteSleep_1 %>%
  mutate(date = mdy_hms(date, tz = "UTC"),
         Date = as.Date(date),                
         Time = format(date, "%H:%M:%S"))

minuteSleep_1_cleaned <- select(minuteSleep_1_cleaned, - date)

glimpse(minuteSleep_1_cleaned)

## Changing datatype of Time from character to time
minuteSleep_1_cleaned$Time <- lubridate::hms(minuteSleep_1_cleaned$Time)

## This dataframe contains data from 3/11/2016 to 4/12/2016
## Removing data on 3/11/2016 and 4/12/2016
minuteSleep_1_cleaned <- subset(minuteSleep_1_cleaned, Date != "2016-04-12" & Date != "2016-03-11")

##Renaming TotalIntensity to Total_Intensity
minuteSleep_1_cleaned <- rename(minuteSleep_1_cleaned, log_id = logId)

## to ensure column names are consistent and formatted
minuteSleep_1_cleaned <- clean_names(minuteSleep_1_cleaned)

## Checking for duplicates
minuteSleep_1_cleaned %>%
  count(id, date, time) %>%
  filter(n > 1)

## Removing duplicates
minuteSleep_1_cleaned <- minuteSleep_1_cleaned %>%
  distinct(id, date, time, .keep_all = TRUE)


## Cleaning process for minuteStepsNarrow_1_cleaned

## Checking for missing or null values
sum(is.na(minuteStepsNarrow_1))

## Understanding the data structure
head(minuteStepsNarrow_1)
glimpse(minuteStepsNarrow_1)
View(minuteStepsNarrow_1)

## Separating ActivityMinute column into Date and Time
minuteStepsNarrow_1_cleaned <- minuteStepsNarrow_1 %>%
  mutate(ActivityMinute = mdy_hms(ActivityMinute, tz = "UTC"),
         Activity_Date = as.Date(ActivityMinute),                
         Activity_Time = format(ActivityMinute, "%H:%M:%S"))

minuteStepsNarrow_1_cleaned <- select(minuteStepsNarrow_1_cleaned, - ActivityMinute)

glimpse(minuteStepsNarrow_1_cleaned)

## Changing datatype of Time from character to time
minuteStepsNarrow_1_cleaned$Activity_Time <- lubridate::hms(minuteStepsNarrow_1_cleaned$Activity_Time)

## This dataframe contains data on 4/12/2016
## Removing data on 4/12/2016
minuteStepsNarrow_1_cleaned <- subset(minuteStepsNarrow_1_cleaned, Activity_Date != "2016-04-12")

## to ensure column names are consistent and formatted
minuteStepsNarrow_1_cleaned <- clean_names(minuteStepsNarrow_1_cleaned)

## Checking for duplicates
minuteStepsNarrow_1_cleaned %>%
  count(id, activity_date, activity_time) %>%
  filter(n > 1)


## Cleaning process for weightLogInfo_1_cleaned

## Checking for missing or null values
sum(is.na(weightLogInfo_1_cleaned))

## Understanding the data structure
head(weightLogInfo_1_cleaned)
glimpse(weightLogInfo_1_cleaned)
View(weightLogInfo_1_cleaned)

## Changing datatype of Date from character to date
weightLogInfo_1_cleaned$Date <- lubridate::mdy(weightLogInfo_1_cleaned$Date)

## Changing datatype of Time from character to time
weightLogInfo_1_cleaned$Time <- lubridate::hms(weightLogInfo_1_cleaned$Time)

## Checking date range
summarize(weightLogInfo_1_cleaned, min_date = min(Date), max_date = max(Date))
## This dataframe contains data from 3/30/2016 to 4/11/2016

## Removing Date_Original column
weightLogInfo_1_cleaned <- select(weightLogInfo_1_cleaned, - Date_Original)

## to ensure column names are consistent and formatted
weightLogInfo_1_cleaned <- clean_names(weightLogInfo_1_cleaned)

## Checking for duplicates
weightLogInfo_1_cleaned %>%
  count(id, date, time) %>%
  filter(n > 1)


## Second Dataset

## Cleaning process for dailyActivity_2_cleaned

## Checking for missing or null values
sum(is.na(dailyActivity_2_cleaned))

## Understanding the data structure
head(dailyActivity_2_cleaned)
glimpse(dailyActivity_2_cleaned)
View(dailyActivity_2_cleaned)

## Changing datatype of Activity_Date from character to date
dailyActivity_2_cleaned$Activity_Date <- lubridate::mdy(dailyActivity_2_cleaned$Activity_Date)

## Checking date range
summarize(dailyActivity_2_cleaned, min_date = min(Activity_Date), max_date = max(Activity_Date))

## to ensure column names are consistent and formatted
dailyActivity_2_cleaned <- clean_names(dailyActivity_2_cleaned)

## Checking for duplicates
dailyActivity_2_cleaned %>%
  count(id, activity_date) %>%
  filter(n > 1)


## Cleaning process for dailyCalories_2_cleaned

## Checking for missing or null values
sum(is.na(dailyCalories_2_cleaned))

## Understanding the data structure
head(dailyCalories_2_cleaned)
glimpse(dailyCalories_2_cleaned)
View(dailyCalories_2_cleaned)

## Changing datatype of Activity_Date from character to date
dailyCalories_2_cleaned$Activity_Day <- lubridate::mdy(dailyCalories_2_cleaned$Activity_Day)

## Renaming Activity_Day to Activity Date
dailyCalories_2_cleaned <- rename(dailyCalories_2_cleaned, Activity_Date = Activity_Day)

## Checking date range
summarize(dailyCalories_2_cleaned, min_date = min(Activity_Date), max_date = max(Activity_Date))

## to ensure column names are consistent and formatted
dailyCalories_2_cleaned <- clean_names(dailyCalories_2_cleaned)

## Checking for duplicates
dailyCalories_2_cleaned %>%
  count(id, activity_date) %>%
  filter(n > 1)


## Cleaning process for dailyIntensities_2_cleaned

## Checking for missing or null values
sum(is.na(dailyIntensities_2_cleaned))

## Understanding the data structure
head(dailyIntensities_2_cleaned)
glimpse(dailyIntensities_2_cleaned)
View(dailyIntensities_2_cleaned)

## Changing datatype of Activity_Date from character to date
dailyIntensities_2_cleaned$Activity_Day <- lubridate::mdy(dailyIntensities_2_cleaned$Activity_Day)

## Renaming Activity_Day to Activity Date
dailyIntensities_2_cleaned <- rename(dailyIntensities_2_cleaned, Activity_Date = Activity_Day)

## Checking date range
summarize(dailyIntensities_2_cleaned, min_date = min(Activity_Date), max_date = max(Activity_Date))

## to ensure column names are consistent and formatted
dailyIntensities_2_cleaned <- clean_names(dailyIntensities_2_cleaned)

## Checking for duplicates
dailyIntensities_2_cleaned %>%
  count(id, activity_date) %>%
  filter(n > 1)


## Cleaning process for dailySteps_2_cleaned

## Checking for missing or null values
sum(is.na(dailySteps_2_cleaned))

## Understanding the data structure
head(dailySteps_2_cleaned)
glimpse(dailySteps_2_cleaned)
View(dailySteps_2_cleaned)

## Changing datatype of Activity_Date from character to date
dailySteps_2_cleaned$Activity_Day <- lubridate::mdy(dailySteps_2_cleaned$Activity_Day)

## Renaming Activity_Day to Activity Date
dailySteps_2_cleaned <- rename(dailySteps_2_cleaned, Activity_Date = Activity_Day)

## Checking date range
summarize(dailySteps_2_cleaned, min_date = min(Activity_Date), max_date = max(Activity_Date))

## to ensure column names are consistent and formatted
dailySteps_2_cleaned <- clean_names(dailySteps_2_cleaned)

## Checking for duplicates
dailySteps_2_cleaned %>%
  count(id, activity_date) %>%
  filter(n > 1)


## Cleaning process for heartrate_seconds_2_cleaned

## Checking for missing or null values
sum(is.na(heartrate_seconds_2))

## Understanding the data structure
head(heartrate_seconds_2)
glimpse(heartrate_seconds_2)
View(heartrate_seconds_2)

## Separating Time column into Date and Time
heartrate_seconds_2_cleaned <- heartrate_seconds_2 %>%
  mutate(Time = mdy_hms(Time, tz = "UTC"),
         Date = as.Date(Time),                
         Time_n = format(Time, "%H:%M:%S"))

heartrate_seconds_2_cleaned <- select(heartrate_seconds_2_cleaned, - Time)

heartrate_seconds_2_cleaned <- rename(heartrate_seconds_2_cleaned, Time = Time_n)

glimpse(heartrate_seconds_2_cleaned)

## Changing datatype of Time from character to time
heartrate_seconds_2_cleaned$Time <- lubridate::hms(heartrate_seconds_2_cleaned$Time)

## Checking date range
summarize(heartrate_seconds_2_cleaned, min_date = min(Date), max_date = max(Date))

## to ensure column names are consistent and formatted
heartrate_seconds_2_cleaned <- clean_names(heartrate_seconds_2_cleaned)

## Checking for duplicates
heartrate_seconds_2_cleaned %>%
  count(id, date, time) %>%
  filter(n > 1)


## Cleaning process for hourlyCalories_2_cleaned

## Checking for missing or null values
sum(is.na(hourlyCalories_2))

## Understanding the data structure
head(hourlyCalories_2)
glimpse(hourlyCalories_2)
View(hourlyCalories_2)

## Separating ActivityHour column into Date and Time
hourlyCalories_2_cleaned <- hourlyCalories_2 %>%
  mutate(ActivityHour = mdy_hms(ActivityHour, tz = "UTC"),
         Date = as.Date(ActivityHour),                
         Time = format(ActivityHour, "%H:%M:%S"))

hourlyCalories_2_cleaned <- select(hourlyCalories_2_cleaned, - ActivityHour)

glimpse(hourlyCalories_2_cleaned)

## Changing datatype of Time from character to time
hourlyCalories_2_cleaned$Time <- lubridate::hms(hourlyCalories_2_cleaned$Time)

## Checking date range
summarize(hourlyCalories_2_cleaned, min_date = min(Date), max_date = max(Date))

## to ensure column names are consistent and formatted
hourlyCalories_2_cleaned <- clean_names(hourlyCalories_2_cleaned)

## Checking for duplicates
hourlyCalories_2_cleaned %>%
  count(id, date, time) %>%
  filter(n > 1)


## Cleaning process for hourlyIntensities_2_cleaned

## Checking for missing or null values
sum(is.na(hourlyIntensities_2))

## Understanding the data structure
head(hourlyIntensities_2)
glimpse(hourlyIntensities_2)
View(hourlyIntensities_2)

## Separating ActivityHour column into Date and Time
hourlyIntensities_2_cleaned <- hourlyIntensities_2 %>%
  mutate(ActivityHour = mdy_hms(ActivityHour, tz = "UTC"),
         Date = as.Date(ActivityHour),                
         Time = format(ActivityHour, "%H:%M:%S"))

hourlyIntensities_2_cleaned <- select(hourlyIntensities_2_cleaned, - ActivityHour)

glimpse(hourlyIntensities_2_cleaned)

## Changing datatype of Time from character to time
hourlyIntensities_2_cleaned$Time <- lubridate::hms(hourlyIntensities_2_cleaned$Time)

## Checking date range
summarize(hourlyIntensities_2_cleaned, min_date = min(Date), max_date = max(Date))

## Renaming TotalIntensity to Total_Intensity
hourlyIntensities_2_cleaned <- rename(hourlyIntensities_2_cleaned, Total_Intensity = TotalIntensity)

##Renaming AverageIntensity to Average_Intensity
hourlyIntensities_2_cleaned <- rename(hourlyIntensities_2_cleaned, Average_Intensity = AverageIntensity)

## to ensure column names are consistent and formatted
hourlyIntensities_2_cleaned <- clean_names(hourlyIntensities_2_cleaned)

## Checking for duplicates
hourlyIntensities_2_cleaned %>%
  count(id, date, time) %>%
  filter(n > 1)


## Cleaning process for hourlySteps_2_cleaned

## Checking for missing or null values
sum(is.na(hourlySteps_2))

## Understanding the data structure
head(hourlySteps_2)
glimpse(hourlySteps_2)
View(hourlySteps_2)

## Separating Hour column into Date and Time
hourlySteps_2_cleaned <- hourlySteps_2 %>%
  mutate(ActivityHour = mdy_hms(ActivityHour, tz = "UTC"),
         Date = as.Date(ActivityHour),                
         Time = format(ActivityHour, "%H:%M:%S"))

hourlySteps_2_cleaned <- select(hourlySteps_2_cleaned, - ActivityHour)

glimpse(hourlySteps_2_cleaned)

## Changing datatype of Time from character to time
hourlySteps_2_cleaned$Time <- lubridate::hms(hourlySteps_2_cleaned$Time)

## Checking date range
summarize(hourlySteps_2_cleaned, min_date = min(Date), max_date = max(Date))

##Renaming StepTotal to Step_Total
hourlySteps_2_cleaned <- rename(hourlySteps_2_cleaned, Step_Total = StepTotal)

## to ensure column names are consistent and formatted
hourlySteps_2_cleaned <- clean_names(hourlySteps_2_cleaned)

## Checking for duplicates
hourlySteps_2_cleaned %>%
  count(id, date, time) %>%
  filter(n > 1)
rm(hourlySteps_2)


## Cleaning process for minuteCaloriesNarrow_2_cleaned

## Checking for missing or null values
sum(is.na(minuteCaloriesNarrow_2))

## Understanding the data structure
head(minuteCaloriesNarrow_2)
glimpse(minuteCaloriesNarrow_2)
View(minuteCaloriesNarrow_2)

## Separating ActivityMinute column into Activity_Date and Time
minuteCaloriesNarrow_2_cleaned <- minuteCaloriesNarrow_2 %>%
  mutate(ActivityMinute = mdy_hms(ActivityMinute, tz = "UTC"),
         Activity_Date = as.Date(ActivityMinute),                
         Activity_Time = format(ActivityMinute, "%H:%M:%S"))

minuteCaloriesNarrow_2_cleaned <- select(minuteCaloriesNarrow_2_cleaned, - ActivityMinute)

glimpse(minuteCaloriesNarrow_2_cleaned)

## Changing datatype of Time from character to time
minuteCaloriesNarrow_2_cleaned$Activity_Time <- lubridate::hms(minuteCaloriesNarrow_2_cleaned$Activity_Time)

## Checking date range
summarize(minuteCaloriesNarrow_2_cleaned, min_date = min(Activity_Date), max_date = max(Activity_Date))

## to ensure column names are consistent and formatted
minuteCaloriesNarrow_2_cleaned <- clean_names(minuteCaloriesNarrow_2_cleaned)

## Checking for duplicates
minuteCaloriesNarrow_2_cleaned %>%
  count(id, activity_date, activity_time) %>%
  filter(n > 1)


## Cleaning process for minuteCaloriesWide_2_cleaned

## Checking for missing or null values
sum(is.na(minuteCaloriesWide_2))

## Understanding the data structure
head(minuteCaloriesWide_2)
glimpse(minuteCaloriesWide_2)
View(minuteCaloriesWide_2)

## Separating ActivityMinute column into Date and Time
minuteCaloriesWide_2_cleaned <- minuteCaloriesWide_2 %>%
  mutate(ActivityHour = mdy_hms(ActivityHour, tz = "UTC"),
         Activity_Date = as.Date(ActivityHour),                
         Activity_Time = format(ActivityHour, "%H:%M:%S"))

minuteCaloriesWide_2_cleaned <- select(minuteCaloriesWide_2_cleaned, - ActivityHour)

glimpse(minuteCaloriesWide_2_cleaned)

## Changing datatype of Time from character to time
minuteCaloriesWide_2_cleaned$Activity_Time <- lubridate::hms(minuteCaloriesWide_2_cleaned$Activity_Time)

## Checking date range
summarize(minuteCaloriesWide_2_cleaned, min_date = min(Activity_Date), max_date = max(Activity_Date))

## This dataframe contains data from 4/13/2016 to 5/13/2016
## Removing data on 5/13/2016
minuteCaloriesWide_2_cleaned <- subset(minuteCaloriesWide_2_cleaned, Activity_Date != "2016-05-13")

## to ensure column names are consistent and formatted
minuteCaloriesWide_2_cleaned <- clean_names(minuteCaloriesWide_2_cleaned)

## Checking for duplicates
minuteCaloriesWide_2_cleaned %>%
  count(id, activity_date, activity_time) %>%
  filter(n > 1)


## Cleaning process for minuteIntensitiesNarrow_2_cleaned

## Checking for missing or null values
sum(is.na(minuteIntensitiesNarrow_2))

## Understanding the data structure
head(minuteIntensitiesNarrow_2)
glimpse(minuteIntensitiesNarrow_2)
View(minuteIntensitiesNarrow_2)

## Separating Time column into Date and Time
minuteIntensitiesNarrow_2_cleaned <- minuteIntensitiesNarrow_2 %>%
  mutate(ActivityMinute = mdy_hms(ActivityMinute, tz = "UTC"),
         Activity_Date = as.Date(ActivityMinute),                
         Activity_Time = format(ActivityMinute, "%H:%M:%S"))

minuteIntensitiesNarrow_2_cleaned <- select(minuteIntensitiesNarrow_2_cleaned, - ActivityMinute)

glimpse(minuteIntensitiesNarrow_2_cleaned)

## Changing datatype of Time from character to time
minuteIntensitiesNarrow_2_cleaned$Activity_Time <- lubridate::hms(minuteIntensitiesNarrow_2_cleaned$Activity_Time)

## Checking date range
summarize(minuteIntensitiesNarrow_2_cleaned, min_date = min(Activity_Date), max_date = max(Activity_Date))

## to ensure column names are consistent and formatted
minuteIntensitiesNarrow_2_cleaned <- clean_names(minuteIntensitiesNarrow_2_cleaned)

## Checking for duplicates
minuteIntensitiesNarrow_2_cleaned %>%
  count(id, activity_date, activity_time) %>%
  filter(n > 1)


## Cleaning process for minuteIntensitiesWide_2_cleaned

## Checking for missing or null values
sum(is.na(minuteIntensitiesWide_2))

## Understanding the data structure
head(minuteIntensitiesWide_2)
glimpse(minuteIntensitiesWide_2)
View(minuteIntensitiesWide_2)

## Separating ActivityHour column into Date and Time
minuteIntensitiesWide_2_cleaned <- minuteIntensitiesWide_2 %>%
  mutate(ActivityHour = mdy_hms(ActivityHour, tz = "UTC"),
         Activity_Date = as.Date(ActivityHour),                
         Activity_Time = format(ActivityHour, "%H:%M:%S"))

minuteIntensitiesWide_2_cleaned <- select(minuteIntensitiesWide_2_cleaned, - ActivityHour)

glimpse(minuteIntensitiesWide_2_cleaned)

## Changing datatype of Time from character to time
minuteIntensitiesWide_2_cleaned$Activity_Time <- lubridate::hms(minuteIntensitiesWide_2_cleaned$Activity_Time)

## Checking date range
summarize(minuteIntensitiesWide_2_cleaned, min_date = min(Activity_Date), max_date = max(Activity_Date))

## This dataframe contains data from 4/13/2016 to 5/13/2016
## Removing data on 5/13/2016
minuteIntensitiesWide_2_cleaned <- subset(minuteIntensitiesWide_2_cleaned, Activity_Date != "2016-05-13")

## to ensure column names are consistent and formatted
minuteIntensitiesWide_2_cleaned <- clean_names(minuteIntensitiesWide_2_cleaned)

## Checking for duplicates
minuteIntensitiesWide_2_cleaned %>%
  count(id, activity_date, activity_time) %>%
  filter(n > 1)


## Cleaning process for minuteMETsNarrow_2_cleaned

## Checking for missing or null values
sum(is.na(minuteMETsNarrow_2))

## Understanding the data structure
head(minuteMETsNarrow_2)
glimpse(minuteMETsNarrow_2)
View(minuteMETsNarrow_2)

## Separating ActivityMinute column into Date and Time
minuteMETsNarrow_2_cleaned <- minuteMETsNarrow_2 %>%
  mutate(ActivityMinute = mdy_hms(ActivityMinute, tz = "UTC"),
         Activity_Date = as.Date(ActivityMinute),                
         Activity_Time = format(ActivityMinute, "%H:%M:%S"))

minuteMETsNarrow_2_cleaned <- select(minuteMETsNarrow_2_cleaned, - ActivityMinute)

glimpse(minuteMETsNarrow_2_cleaned)

## Changing datatype of Time from character to time
minuteMETsNarrow_2_cleaned$Activity_Time <- lubridate::hms(minuteMETsNarrow_2_cleaned$Activity_Time)

## Checking date range
summarize(minuteMETsNarrow_2_cleaned, min_date = min(Activity_Date), max_date = max(Activity_Date))

## to ensure column names are consistent and formatted
minuteMETsNarrow_2_cleaned <- clean_names(minuteMETsNarrow_2_cleaned)

## renaming METs column
minuteMETsNarrow_2_cleaned <- rename(minuteMETsNarrow_2_cleaned, met_s = me_ts)

## Checking for duplicates
minuteMETsNarrow_2_cleaned %>%
  count(id, activity_date, activity_time) %>%
  filter(n > 1)


## Cleaning process for minuteSleep_2

## Checking for missing or null values
sum(is.na(minuteSleep_2))

## Understanding the data structure
head(minuteSleep_2)
glimpse(minuteSleep_2)
View(minuteSleep_2)

## Separating Time column into Date and Time
minuteSleep_2_cleaned <- minuteSleep_2 %>%
  mutate(date = mdy_hms(date, tz = "UTC"),
         Date = as.Date(date),                
         Time = format(date, "%H:%M:%S"))

minuteSleep_2_cleaned <- select(minuteSleep_2_cleaned, - date)

glimpse(minuteSleep_2_cleaned)

## Changing datatype of Time from character to time
minuteSleep_2_cleaned$Time <- lubridate::hms(minuteSleep_2_cleaned$Time)

## Checking date range
summarize(minuteSleep_2_cleaned, min_date = min(Date), max_date = max(Date))

## This dataframe contains data from 4/11/2016 to 5/12/2016
## Removing data on 4/11/2016 
minuteSleep_2_cleaned <- subset(minuteSleep_2_cleaned, Date != "2016-04-11")

## renaming logID column
minuteSleep_2_cleaned <- rename(minuteSleep_2_cleaned, log_id = logId)

## to ensure column names are consistent and formatted
minuteSleep_2_cleaned <- clean_names(minuteSleep_2_cleaned)

## Checking for duplicates
minuteSleep_2_cleaned %>%
  count(id, date, time) %>%
  filter(n > 1)

## Removing duplicates
minuteSleep_2_cleaned <- minuteSleep_2_cleaned %>%
  distinct(id, date, time, .keep_all = TRUE)


## Cleaning process for minuteStepsNarrow_2_cleaned

## Checking for missing or null values
sum(is.na(minuteStepsNarrow_2))

## Understanding the data structure
head(minuteStepsNarrow_2)
glimpse(minuteStepsNarrow_2)
View(minuteStepsNarrow_2)

## Separating Time column into Date and Time
minuteStepsNarrow_2_cleaned <- minuteStepsNarrow_2 %>%
  mutate(ActivityMinute = mdy_hms(ActivityMinute, tz = "UTC"),
         Activity_Date = as.Date(ActivityMinute),                
         Activity_Time = format(ActivityMinute, "%H:%M:%S"))

minuteStepsNarrow_2_cleaned <- select(minuteStepsNarrow_2_cleaned, - ActivityMinute)

glimpse(minuteStepsNarrow_2_cleaned)

## Changing datatype of Time from character to time
minuteStepsNarrow_2_cleaned$Activity_Time <- lubridate::hms(minuteStepsNarrow_2_cleaned$Activity_Time)

## Checking date range
summarize(minuteStepsNarrow_2_cleaned, min_date = min(Activity_Date), max_date = max(Activity_Date))

## to ensure column names are consistent and formatted
minuteStepsNarrow_2_cleaned <- clean_names(minuteStepsNarrow_2_cleaned)

## Checking for duplicates
minuteStepsNarrow_2_cleaned %>%
  count(id, activity_date, activity_time) %>%
  filter(n > 1)


## Cleaning process for minuteStepsWide_2_cleaned

## Checking for missing or null values
sum(is.na(minuteStepsWide_2))

## Understanding the data structure
head(minuteStepsWide_2)
glimpse(minuteStepsWide_2)
View(minuteStepsWide_2)

## Separating Time column into Date and Time
minuteStepsWide_2_cleaned <- minuteStepsWide_2 %>%
  mutate(ActivityHour = mdy_hms(ActivityHour, tz = "UTC"),
         Activity_Date = as.Date(ActivityHour),                
         Activity_Time = format(ActivityHour, "%H:%M:%S"))

minuteStepsWide_2_cleaned <- select(minuteStepsWide_2_cleaned, - ActivityHour)

glimpse(minuteStepsWide_2_cleaned)

## Changing datatype of Time from character to time
minuteStepsWide_2_cleaned$Activity_Time <- lubridate::hms(minuteStepsWide_2_cleaned$Activity_Time)

## Checking date range
summarize(minuteStepsWide_2_cleaned, min_date = min(Activity_Date), max_date = max(Activity_Date))

## This dataframe contains data from 4/13/2016 to 5/13/2016
## Removing data on 5/13/2016 
minuteStepsWide_2_cleaned <- subset(minuteStepsWide_2_cleaned, Activity_Date != "2016-05-13")

## to ensure column names are consistent and formatted
minuteStepsWide_2_cleaned <- clean_names(minuteStepsWide_2_cleaned)

## Checking for duplicates
minuteStepsWide_2_cleaned %>%
  count(id, activity_date, activity_time) %>%
  filter(n > 1)


## Cleaning process for sleepDay_2_cleaned

## Checking for missing or null values
sum(is.na(sleepDay_2_cleaned))

## Understanding the data structure
head(sleepDay_2_cleaned)
glimpse(sleepDay_2_cleaned)
View(sleepDay_2_cleaned)

## Changing datatype of Sleep_day from character to date
sleepDay_2_cleaned$Sleep_Day <- lubridate::mdy(sleepDay_2_cleaned$Sleep_Day)

## Checking date range
summarize(sleepDay_2_cleaned, min_date = min(Sleep_Day), max_date = max(Sleep_Day))

## to ensure column names are consistent and formatted
sleepDay_2_cleaned <- clean_names(sleepDay_2_cleaned)

## Checking for duplicates
sleepDay_2_cleaned %>%
  count(id, sleep_day) %>%
  filter(n > 1)


## Cleaning process for weightLogInfo_2_cleaned

## Checking for missing or null values
sum(is.na(weightLogInfo_2))

## Understanding the data structure
head(weightLogInfo_2)
glimpse(weightLogInfo_2)
View(weightLogInfo_2)

## Separating Date column into Date and Time
weightLogInfo_2_cleaned <- separate(weightLogInfo_2, Date, into=c("Date", "Time"), sep=" ")
glimpse(weightLogInfo_2_cleaned)

## Changing datatype of Date from character to date
weightLogInfo_2_cleaned$Date <- lubridate::mdy(weightLogInfo_2_cleaned$Date)

## Changing datatype of Time from character to time
weightLogInfo_2_cleaned$Time <- lubridate::hms(weightLogInfo_2_cleaned$Time)

## Checking date range
summarize(weightLogInfo_2_cleaned, min_date = min(Date), max_date = max(Date))

## Changing data type of isManualReport from character to logical
weightLogInfo_2_cleaned$is_manual_report <- as.logical(weightLogInfo_2_cleaned$is_manual_report)

## to ensure column names are consistent and formatted
weightLogInfo_2_cleaned <- clean_names(weightLogInfo_2_cleaned)

## Checking for duplicates
weightLogInfo_2_cleaned %>%
  count(id, date, time) %>%
  filter(n > 1)

