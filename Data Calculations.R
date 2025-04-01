## Data Calculations

## 1 - Daily activity
## Summary of total steps, total distance, sedentary minutes and calories
dailyActivity_1_cleaned %>%  
  select(total_steps,
         total_distance,
         sedentary_minutes, calories) %>%
  summary()

dailyActivity_2_cleaned %>%  
  select(total_steps,
         total_distance,
         sedentary_minutes, calories) %>%
  summary()

dailyActivity_cleaned %>%  
  select(total_steps,
         total_distance,
         sedentary_minutes, calories) %>%
  summary()


## 2 - Weight Log
## Finding average BMI of each participant

avg_bmi_participants <- weightLogInfo_cleaned %>%
  group_by(id) %>%
  summarise(avg_bmi = round(mean(bmi),2))


## Categorizing average BMI into groups

avg_bmi_participants <- avg_bmi_participants %>%
  mutate(bmi_category = case_when(
    avg_bmi < 18.5 ~ "Underweight",
    avg_bmi >= 18.5 & avg_bmi < 25 ~ "Normal weight",
    avg_bmi >= 25 & avg_bmi < 30 ~ "Overweight",
    avg_bmi >= 30 ~ "Obese"
  ))
    
## Counting the number of participants in each BMI category

bmi_summary <- avg_bmi_participants %>%
  group_by(bmi_category) %>%
  summarise(count = n())


## 3 - Hourly Activity
## Time of the Day participants burnt most calories

avg_calories_hr <- hourlyActivity %>%
  group_by(time) %>%
  summarise(avg_calories = round(mean(calories),2)) %>%
  arrange(- avg_calories) %>%
  print(n=24)

avg_calories_hr$hour <- hour(avg_calories_hr$time) ## Adding a column containing the hour in numeric format


## Time of the Day participants exerted most intensity on average

avg_intensity_hr <- hourlyActivity %>%
  group_by(time) %>%
  summarise(avg_intensity = round(mean(total_intensity), 2)) %>%
  arrange(- avg_intensity) %>%
  print(n=24)

avg_intensity_hr$hour <- hour(avg_intensity_hr$time) ## Adding a column containing the hour in numeric format


## Time of the Day participants took the most steps

avg_steps_hr <- hourlyActivity %>%
  group_by(time) %>%
  summarise(avg_steps = round(mean(step_total), 2)) %>%
  arrange(- avg_steps) %>%
  print(n=24)

avg_steps_hr$hour <- hour(avg_steps_hr$time) ## Adding a column containing the hour in numeric format



## 4 - Sleep Day
## Total hours asleep
sleepDay_2_cleaned <- mutate(sleepDay_2_cleaned, total_hours_asleep = round(total_minutes_asleep / 60, 2))

## Total hours in bed
sleepDay_2_cleaned <- mutate(sleepDay_2_cleaned, total_hours_in_bed = round(total_time_in_bed / 60, 2))

## Percentage of time asleep
sleepDay_2_cleaned <- mutate(sleepDay_2_cleaned, percentage_asleep = round((total_hours_asleep / total_hours_in_bed)*100, 2))

## Average percentage of time asleep for all participants - Trend
sleepDay_2_cleaned %>%
  group_by(id) %>%
  summarise(avg_percent = mean(percentage_asleep)) %>%
  summarise((mean(avg_percent)))


## 5 - Daily Activity and Weight Log
## Relationship between being very active (per day) and BMI

very_active <- dailyActivity_cleaned %>%
  group_by(id) %>%
  summarise(avg_duration_very_active = round(mean(very_active_minutes),2)) ## Gives average duration(minutes) each participant is very active per day

very_active_bmi <- inner_join(very_active, avg_bmi_participants, by="id")

## Correlation
cor(very_active_bmi$avg_duration_very_active, very_active_bmi$avg_bmi, method = "spearman")


## Relationship between being sedentary (per day) and BMI

sedentary <- dailyActivity_cleaned %>%
  group_by(id) %>%
  summarise(avg_duration_sedentary = round(mean(sedentary_minutes)/60, 2)) ## Gives average no. of hours each participant is sedentary per day

sedentary_bmi <- inner_join(sedentary, avg_bmi_participants, by="id")

## Correlation
cor(sedentary_bmi$avg_duration_sedentary, sedentary_bmi$avg_bmi, method = "spearman")

## 6 - Daily Activity and Sleep Day
## Relationship between total steps per day, total distance per day and number of hours asleep per day
n_distinct(sleepDay_2_cleaned$id)
n_distinct(dailyActivity_cleaned$id)

steps_vs_sleep <- inner_join(sleepDay_2_cleaned, dailyActivity_cleaned, by = c("id" = "id", "sleep_day" = "activity_date"))

steps_vs_sleep <- steps_vs_sleep %>%
  select(id, sleep_day, total_hours_asleep, total_steps, total_distance) %>%
  rename(date = sleep_day)

## Calculating correlation between total distance covered and sleep duration
cor(steps_vs_sleep$total_hours_asleep, steps_vs_sleep$total_distance, method = "spearman")

## Calculating correlation between total steps taken and sleep duration
cor(steps_vs_sleep$total_hours_asleep, steps_vs_sleep$total_steps, method = "spearman")