## Data Aggregation

## Combining hourlyCalories_1 and hourlyIntensities_1

## Previewing data
head(hourlyCalories_1_cleaned)
head(hourlyIntensities_1_cleaned)

## Determining number of unique participants
n_distinct(hourlyCalories_1_cleaned$id)
n_distinct(hourlyIntensities_1_cleaned$id)

## Using Outer Join
hci_1 <- full_join(hourlyCalories_1_cleaned, hourlyIntensities_1_cleaned, by=c("id", "date", "time"))


## Combining hourlyCalories_1, hourlyIntensities_1, and hourlySteps_1 into hourlyActivity_1

## Previewing data
head(hci_1)
head(hourlySteps_1_cleaned)

## Determining number of unique participants
n_distinct(hci_1$id)
n_distinct(hourlySteps_1_cleaned$id)

## Using Outer Join
hourlyActivity_1 <- full_join(hci_1, hourlySteps_1_cleaned, by=c("id", "date", "time"))

## Dropping dataframes
rm(hci_1)
rm(hourlyCalories_1_cleaned)
rm(hourlyIntensities_1_cleaned)
rm(hourlySteps_1_cleaned)


## Combining hourlyCalories_2 and hourlyIntensities_2

## Previewing data
head(hourlyCalories_2_cleaned)
head(hourlyIntensities_2_cleaned)

## Determining number of unique participants
n_distinct(hourlyCalories_2_cleaned$id)
n_distinct(hourlyIntensities_2_cleaned$id)

## Using Outer Join
hci_2 <- full_join(hourlyCalories_2_cleaned, hourlyIntensities_2_cleaned, by=c("id", "date", "time"))


## Combining hourlyCalories_2, hourlyIntensities_2, and hourlySteps_2 into hourlyActivity_2

## Previewing data
head(hci_2)
head(hourlySteps_2_cleaned)

## Determining number of unique participants
n_distinct(hci_2$id)
n_distinct(hourlySteps_2_cleaned$id)

## Using Outer Join
hourlyActivity_2 <- full_join(hci_2, hourlySteps_2_cleaned, by=c("id", "date", "time"))

## Dropping dataframes
rm(hci_2)
rm(hourlyCalories_2_cleaned)
rm(hourlyIntensities_2_cleaned)
rm(hourlySteps_2_cleaned)


## Combining minuteCaloriesNarrow_1 and minuteIntensitiesNarrow_1

## Previewing data
head(minuteCaloriesNarrow_1_cleaned)
head(minuteIntensitiesNarrow_1_cleaned)

## Determining number of unique participants
n_distinct(minuteCaloriesNarrow_1_cleaned$id)
n_distinct(minuteIntensitiesNarrow_1_cleaned$id)

## Using Outer Join
mci_1 <- full_join(minuteCaloriesNarrow_1_cleaned, minuteIntensitiesNarrow_1_cleaned, by=c("id", "activity_date", "activity_time"))


## Combining minuteCaloriesNarrow_1, minuteIntensitiesNarrow_1, and minuteMETsNarrow_1

## Previewing data
head(mci_1)
head(minuteMETsNarrow_1_cleaned)

## Determining number of unique participants
n_distinct(mci_1$id)
n_distinct(minuteMETsNarrow_1_cleaned$id)

## Using Outer Join
mcim_1 <- full_join(mci_1, minuteMETsNarrow_1_cleaned, by=c("id", "activity_date", "activity_time"))

## Combining minuteCaloriesNarrow_1, minuteIntensitiesNarrow_1, minuteMETsNarrow_1, and minuteStepsNarrow_1 into minuteActivityNarrow_1

## Previewing data
head(mcim_1)
head(minuteStepsNarrow_1_cleaned)

## Determining number of unique participants
n_distinct(mcim_1$id)
n_distinct(minuteStepsNarrow_1_cleaned$id)

## Using Outer Join
minuteActivityNarrow_1 <- full_join(mcim_1, minuteStepsNarrow_1_cleaned, by=c("id", "activity_date", "activity_time"))

## Dropping dataframes
rm(mci_1)
rm(mcim_1)
rm(minuteCaloriesNarrow_1_cleaned)
rm(minuteIntensitiesNarrow_1_cleaned)
rm(minuteMETsNarrow_1_cleaned)
rm(minuteStepsNarrow_1_cleaned)


## Combining minuteCaloriesNarrow_2 and minuteIntensitiesNarrow_2

## Previewing data
head(minuteCaloriesNarrow_2_cleaned)
head(minuteIntensitiesNarrow_2_cleaned)

## Determining number of unique participants
n_distinct(minuteCaloriesNarrow_2_cleaned$id)
n_distinct(minuteIntensitiesNarrow_2_cleaned$id)

## Using Outer Join
mci_2 <- full_join(minuteCaloriesNarrow_2_cleaned, minuteIntensitiesNarrow_2_cleaned, by=c("id", "activity_date", "activity_time"))


## Combining minuteCaloriesNarrow_2, minuteIntensitiesNarrow_2, and minuteMETsNarrow_2

## Previewing data
head(mci_2)
head(minuteMETsNarrow_2_cleaned)

## Determining number of unique participants
n_distinct(mci_2$id)
n_distinct(minuteMETsNarrow_2_cleaned$id)

## Using Outer Join
mcim_2 <- full_join(mci_2, minuteMETsNarrow_2_cleaned, by=c("id", "activity_date", "activity_time"))


## Combining minuteCaloriesNarrow_2, minuteIntensitiesNarrow_2, minuteMETsNarrow_2, and minuteStepsNarrow_2 into minuteActivityNarrow_2

## Previewing data
head(mcim_2)
head(minuteStepsNarrow_2_cleaned)

## Determining number of unique participants
n_distinct(mcim_2$id)
n_distinct(minuteStepsNarrow_2_cleaned$id)

## Using Outer Join
minuteActivityNarrow_2 <- full_join(mcim_2, minuteStepsNarrow_2_cleaned, by=c("id", "activity_date", "activity_time"))

## Dropping dataframes
rm(mci_2)
rm(mcim_2)
rm(minuteCaloriesNarrow_2_cleaned)
rm(minuteIntensitiesNarrow_2_cleaned)
rm(minuteMETsNarrow_2_cleaned)
rm(minuteStepsNarrow_2_cleaned)


## Combining Daily Activity from both datasets
dailyActivity_cleaned <- rbind(dailyActivity_1_cleaned, dailyActivity_2_cleaned)


## Combining Heartrate Seconds from both datasets
heartrate_seconds_cleaned <- rbind(heartrate_seconds_1_cleaned, heartrate_seconds_2_cleaned)


## Combining Hourly Activity from both datasets
hourlyActivity <-rbind(hourlyActivity_1, hourlyActivity_2)


## Combining Minute Activity Narrow from both datasets
minuteActivityNarrow <- rbind(minuteActivityNarrow_1, minuteActivityNarrow_2)


## Combining minute Sleep from both datasets
minuteSleep_cleaned <- rbind(minuteSleep_1_cleaned, minuteSleep_2_cleaned)


## Combining Weight Log
weightLogInfo_cleaned <- rbind(weightLogInfo_1_cleaned, weightLogInfo_2_cleaned)
