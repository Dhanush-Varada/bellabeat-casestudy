## Data Visualisation

## 1
## Plotting a bar graph for average daily steps in both months
df1 <- summarise(dailyActivity_1_cleaned, avg_steps = mean(total_steps))
df1 <- mutate(df1, month = "1")
df2 <- summarise(dailyActivity_2_cleaned, avg_steps = mean(total_steps))
df2 <- mutate(df2, month = "2")
avg_steps_month <- rbind (df1, df2)

ggplot(data = avg_steps_month) + 
  geom_col(mapping = aes(x=month, y=avg_steps, fill=month), fill="light blue", width = 0.5, color = "black") +
  geom_text(aes(x = month, y = avg_steps, label = round(avg_steps, 1)), vjust = -0.5, size = 5, color = "black") +
  labs(title = "Average Steps per Day", x = "Month", y = "Number of Steps", caption = "This is a comparision of the average number of steps taken by participants in both the months") +
  theme_minimal()

## Plotting a bar graph for average distance covered per day in both months
df1 <- summarise(dailyActivity_1_cleaned, avg_distance = mean(total_distance))
df1 <- mutate(df1, month = "1")
df2 <- summarise(dailyActivity_2_cleaned, avg_distance = mean(total_distance))
df2 <- mutate(df2, month = "2")
avg_distance_month <- rbind (df1, df2)

ggplot(data = avg_distance_month) + 
  geom_col(mapping = aes(x=month, y=avg_distance, fill=month), fill="light blue", width = 0.5, color = "black") +
  geom_text(aes(x = month, y = avg_distance, label = round(avg_distance, 1)), vjust = -0.5, size = 5, color = "black") +
  labs(title = "Average Distance Covered per Day", x = "Month", y = "Distance in km", caption = "This is a comparision of the average distance covered by participants per day in both the months") +
  theme_minimal()

## Plotting a bar graph for average duration in sedentary per day in both months
df1 <- summarise(dailyActivity_1_cleaned, avg_sedentary = mean(sedentary_minutes))
df1 <- mutate(df1, month = "1")
df2 <- summarise(dailyActivity_2_cleaned, avg_sedentary = mean(sedentary_minutes))
df2 <- mutate(df2, month = "2")
avg_sedentary_month <- rbind (df1, df2)
avg_sedentary_month$avg_sedentary <- avg_sedentary_month$avg_sedentary/60

ggplot(data = avg_sedentary_month) + 
  geom_col(mapping = aes(x=month, y=avg_sedentary, fill=month), fill="light blue", width = 0.5, color = "black") +
  geom_text(aes(x = month, y = avg_sedentary, label = round(avg_sedentary, 1)), vjust = -0.5, size = 5, color = "black") +
  labs(title = "Average Sedentary per Day", x = "Month", y = "Number of hours", caption = "This is a comparision of the average duration a participant is in sedentary per day in both the months") +
  theme_minimal()

## Plotting a bar graph for average calories burnt per day in both months
df1 <- summarise(dailyActivity_1_cleaned, avg_calories = mean(calories))
df1 <- mutate(df1, month = "1")
df2 <- summarise(dailyActivity_2_cleaned, avg_calories = mean(calories))
df2 <- mutate(df2, month = "2")
avg_calories_month <- rbind (df1, df2)

ggplot(data = avg_calories_month) + 
  geom_col(mapping = aes(x=month, y=avg_calories, fill=month), fill="light blue", width = 0.5, color = "black") +
  geom_text(aes(x = month, y = avg_calories, label = round(avg_calories, 1)), vjust = -0.5, size = 5, color = "black") +
  labs(title = "Average Calories burnt per Day", x = "Month", y = "Calories", caption = "This is a comparision of the average caloreis burnt per day in both the months") +
  theme_minimal()


## 2
## BMI Distribution of participants - Histogram

ggplot(data = bmi_summary, aes(x = bmi_category, y = count, fill = bmi_category)) + 
  geom_bar(stat = "identity", color = "black") +
  geom_text(aes(x = bmi_category, y = count, label = count), vjust = -0.5, size = 5, color = "black") +
  labs(title = "BMI Distribution of Participants",
       x = "BMI Category",
       y = "Number of Participants",
       caption = "This is the distribution of participants based on their BMI") +
  scale_fill_manual(values = c("Underweight" = "lightblue", "Normal weight" = "lightgreen", 
                               "Overweight" = "orange", "Obese" = "pink")) +
  theme_minimal()


## 3
## Time of the day (hour) participants were most active
## Calories Burned

ggplot(avg_calories_hr, aes(x = hour, y = avg_calories)) +
  geom_line(color = "blue", size = 1) +  # Line color and thickness
  scale_x_continuous(breaks = seq(0, 23, by = 2)) +
  labs(title = "Average Calories Burned Per Hour",
       x = "Hour of the Day (in 24hr format)",
       y = "Calories",
       caption = "This shows the average amount of Calories burned for each hour of the day") +
  theme_minimal()

## Intensity

ggplot(avg_intensity_hr, aes(x = hour, y = avg_intensity)) +
  geom_line(color = "blue", size = 1) +  # Line color and thickness
  scale_x_continuous(breaks = seq(0, 23, by = 2)) +
  labs(title = "Average Intensity Per Hour",
       x = "Hour of the Day (in 24hr format)",
       y = "Intensity",
       caption = "This shows the average intensity level for each hour of the day") +
  theme_minimal()

## Steps

ggplot(avg_steps_hr, aes(x = hour, y = avg_steps)) +
  geom_line(color = "blue", size = 1) +  # Line color and thickness
  scale_x_continuous(breaks = seq(0, 23, by = 2)) +
  labs(title = "Average Steps Per Hour",
       x = "Hour of the Day (in 24hr format)",
       y = "Number of Steps",
       caption = "This shows the average steps taken for each hour of the day") +
  theme_minimal()


## 4
## Percentage of time each participant is asleep while in bed

sleepDay_2_cleaned %>%
  group_by(id) %>%
  summarise(
    avg_hours_asleep = mean(total_hours_asleep),
    avg_hours_in_bed = mean(total_hours_in_bed)
  ) %>%
  arrange(id) %>%
  mutate(participant = c(1:24)) %>%
  ggplot(aes(x = participant)) +  
  geom_bar(aes(y = avg_hours_in_bed), stat = "identity", fill = "blue", width = 0.7) +  
  geom_bar(aes(y = avg_hours_asleep), stat = "identity", fill = "skyblue", width = 0.7) +  
  scale_x_continuous(breaks = seq(1, 24, by = 1)) +
  scale_y_continuous(breaks = seq(0, 18, by = 2)) +
  labs(title = "Average Sleep Efficiency of Each Participant",
       subtitle = "Dark Blue - Time in bed, Light Blue - Time asleep",
       x = "Participant",
       y = "Hours",
       fill = "Sleep Data",
       caption = "This shows the average duration a participant is in bed vs. average duration they are asleep") +  
  theme_minimal()


## 5
## Relationship between being very active and BMI

ggplot(data=very_active_bmi) +
  geom_point(mapping = aes(x=avg_duration_very_active, y=avg_bmi, color=bmi_category), size=3.5) +
  geom_smooth(method ='lm', mapping = aes(x=avg_duration_very_active, y=avg_bmi), se = TRUE, alpha=0.3) +
  scale_color_manual(values = c(
    "Normal weight" = "green",
    "Overweight" = "orange",
    "Obese" = "red"
  )) +
  labs(title = "Relationship between being Very Active and BMI",
       x = "Very Active Duration (in minutes)",
       y = "BMI",
       caption = "This shows the relationship between the average time a participant spends being very active per day and their average BMI") +  
  theme_minimal()

## Relationship between being sedentary and BMI

ggplot(data=sedentary_bmi) +
  geom_point(mapping = aes(x=avg_duration_sedentary, y=avg_bmi, color=bmi_category), size=3.5) +
  geom_smooth(method ='lm', mapping = aes(x=avg_duration_sedentary, y=avg_bmi), se = TRUE, alpha=0.3) +
  scale_color_manual(values = c(
    "Normal weight" = "green",
    "Overweight" = "orange",
    "Obese" = "red"
  )) +
  labs(title = "Relationship between being Sedentary and BMI",
       x = "Sedentary Duration (in hours)",
       y = "BMI",
       caption = "This shows the relationship between the average time a participant is sedentary per day and their average BMI") +  
  theme_minimal()


## 6
## Relationship between total distance covered per day and number of hours asleep per day
  ggplot(data=steps_vs_sleep) +
    geom_point(mapping = aes(x=total_hours_asleep, y=total_distance), color = "blue", alpha = 0.5) +
    geom_smooth(mapping = aes(x=total_hours_asleep, y=total_distance),method = "lm", se = TRUE, color = "red") +
    scale_x_continuous(breaks = seq(0, 15, by = 2)) +
    scale_y_continuous(breaks = seq(0, 18, by = 3)) +
    labs(title = "Relationship between Duration of Sleep and Distance Covered",
         x = "Sleep Duration (in hours)",
         y = "Distance Covered (in km)",
         caption = "This shows the relationship between the duration of sleep per day and total distance covered per day by all participants") +  
    theme_minimal()
  
## Relationship between total steps taken per day and number of hours asleep per day
  ggplot(data=steps_vs_sleep) +
    geom_point(mapping = aes(x=total_hours_asleep, y=total_steps), color = "blue", alpha = 0.5) +
    geom_smooth(mapping = aes(x=total_hours_asleep, y=total_steps),method = "lm", se = TRUE, color = "red") +
    scale_x_continuous(breaks = seq(0, 15, by = 2)) +
    scale_y_continuous(breaks = seq(0, 28000, by = 3000)) +
    labs(title = "Relationship between Duration of Sleep and Steps Taken",
         x = "Sleep Duration (in hours)",
         y = "Steps Taken",
         caption = "This shows the relationship between the duration sleep per day and total steps taken per day by all participants") +  
    theme_minimal()
  