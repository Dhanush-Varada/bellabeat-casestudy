## Data Formatting

## Sorting data in all the dataframes by id, date and time (ascending order)

## Sorting dailyActivity_1
dailyActivity_1_cleaned <- arrange(dailyActivity_1_cleaned, id, activity_date)

## Sorting dailyActivity_2
dailyActivity_2_cleaned <- arrange(dailyActivity_2_cleaned, id, activity_date)

## Sorting dailyActivity - dailyActivity_1 and dailyActivity_2 combined
dailyActivity_cleaned <- arrange(dailyActivity_cleaned, id, activity_date)

## Sorting heartrate_seconds_1
heartrate_seconds_1_cleaned <- arrange(heartrate_seconds_1_cleaned, id, date, time)

## Sorting heartrate_seconds_2
heartrate_seconds_2_cleaned <- arrange(heartrate_seconds_2_cleaned, id, date, time)

## Sorting heartrate_seconds - heartrate_seconds_1 and heartrate_seconds_2 combined
heartrate_seconds_cleaned <- arrange(heartrate_seconds_cleaned, id, date, time)

## Sorting hourlyActivity_1
hourlyActivity_1 <- arrange(hourlyActivity_1, id, date, time)

## Sorting hourlyActivity_2
hourlyActivity_2 <- arrange(hourlyActivity_2, id, date, time)

## Sorting hourlyActivity - hourlyActivity_1 and hourlyActivity_2 combined
hourlyActivity <- arrange(hourlyActivity, id, date, time)

## Sorting minuteActivityNarrow_1
minuteActivityNarrow_1 <- arrange(minuteActivityNarrow_1, id, activity_date, activity_time)

## Sorting minuteActivityNarrow_2
minuteActivityNarrow_2 <- arrange(minuteActivityNarrow_2, id, activity_date, activity_time)

## Sorting minuteActivityNarrow - minuteActivityNarrow_1 and minuteActivityNarrow_2 combined
minuteActivityNarrow <- arrange(minuteActivityNarrow, id, activity_date, activity_time)

## Sorting minuteCaloriesWide_2
minuteCaloriesWide_2_cleaned <- arrange(minuteCaloriesWide_2_cleaned, id, activity_date, activity_time)

## Sorting minuteIntensitiesWide_2
minuteIntensitiesWide_2_cleaned <- arrange(minuteIntensitiesWide_2_cleaned, id, activity_date, activity_time)

## Sorting minuteSleep_1
minuteSleep_1_cleaned <- arrange(minuteSleep_1_cleaned, id, date, time)

## Sorting minuteSleep_2
minuteSleep_2_cleaned <- arrange(minuteSleep_2_cleaned, id, date, time)

## Sorting minuteSleep - minuteSleep_1 and minuteSleep_2 combined
minuteSleep_cleaned <- arrange(minuteSleep_cleaned, id, date, time)

## Sorting minuteStepsWide_2
minuteStepsWide_2_cleaned <- arrange(minuteStepsWide_2_cleaned, id, activity_date, activity_time)

## Sorting sleepDay_2
sleepDay_2_cleaned <- arrange(sleepDay_2_cleaned, id, sleep_day)

## Sorting weightLogInfo_1
weightLogInfo_1_cleaned <- arrange(weightLogInfo_1_cleaned, id, date, time)

## Sorting weightLogInfo_2
weightLogInfo_2_cleaned <- arrange(weightLogInfo_2_cleaned, id, date, time)

## Sorting weightLogInfo - weightLogInfo_1 and weightLogInfo_2 combined
weightLogInfo_cleaned <- arrange(weightLogInfo_cleaned, id, date, time)


## Converting METs to appropriate format by dividing the METs value by 10
minuteActivityNarrow_1$met_s <- minuteActivityNarrow_1$met_s/10
minuteActivityNarrow_2$met_s <- minuteActivityNarrow_2$met_s/10
minuteActivityNarrow$met_s <- minuteActivityNarrow$met_s/10


## Changing sleep value from numeric representation to text representation to indicate sleep state
minuteSleep_1_cleaned <- rename(minuteSleep_1_cleaned, "sleep_state" = "value")

minuteSleep_1_cleaned$sleep_state <- ifelse(minuteSleep_1_cleaned$sleep_state == 1, "asleep",
                          ifelse(minuteSleep_1_cleaned$sleep_state == 2, "restless", "awake"))

minuteSleep_2_cleaned <- rename(minuteSleep_2_cleaned, "sleep_state" = "value")

minuteSleep_2_cleaned$sleep_state <- ifelse(minuteSleep_2_cleaned$sleep_state == 1, "asleep",
                                            ifelse(minuteSleep_2_cleaned$sleep_state == 2, "restless", "awake"))

minuteSleep_cleaned <- rename(minuteSleep_cleaned, "sleep_state" = "value")

minuteSleep_cleaned$sleep_state <- ifelse(minuteSleep_cleaned$sleep_state == 1, "asleep",
                                            ifelse(minuteSleep_cleaned$sleep_state == 2, "restless", "awake"))

