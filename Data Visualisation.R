## Data Visualisation

## 1

## Plotting a bar graph comparing average daily steps by participants in both months
## Calculating average steps taken by each participant per day
df1 <- summarise(dailyActivity_1_cleaned, avg_steps = mean(total_steps))
df1 <- mutate(df1, month = "1")
df2 <- summarise(dailyActivity_2_cleaned, avg_steps = mean(total_steps))
df2 <- mutate(df2, month = "2")
avg_steps_month <- rbind (df1, df2)

## Plotting the bar graph
ggplot(data = avg_steps_month) + 
  geom_col(mapping = aes(x=month, y=avg_steps, fill=month), # Create a bar chart with 'month' on x-axis and 'avg_steps' on y-axis
           fill="light blue", width = 0.5, color = "black") + # Set bar color to light blue, width to 0.5, and add black border 
  geom_text(aes(x = month, y = avg_steps, label = round(avg_steps, 1)), # Add data labels on bars, rounding avg_steps to 1 decimal place
            vjust = -0.5, size = 5, color = "black") + # Position labels slightly above bars, set size and color
  labs(title = "Average Steps per Day",  # Add plot titles and axis labels, along with a caption explaining the plot
       x = "Month", y = "Number of Steps", 
       caption = "This is a comparision of the average number of steps taken by participants in both the months") + 
  theme_minimal() # Apply a minimal theme for a clean look

## Plotting a bar graph comparing average distance covered per day by participants in both periods
## Calculating average distance covered by each participant per day
df1 <- summarise(dailyActivity_1_cleaned, avg_distance = mean(total_distance))
df1 <- mutate(df1, month = "1")
df2 <- summarise(dailyActivity_2_cleaned, avg_distance = mean(total_distance))
df2 <- mutate(df2, month = "2")
avg_distance_month <- rbind (df1, df2)

## Plotting the bar graph
ggplot(data = avg_distance_month) + 
  geom_col(mapping = aes(x=month, y=avg_distance, fill=month), # Create a bar chart with 'month' on x-axis and 'avg_distance' on y-axis
           fill="light blue", width = 0.5, color = "black") + # Set bar color to light blue, width to 0.5, and add black border
  geom_text(aes(x = month, y = avg_distance, label = round(avg_distance, 1)),  # Add data labels on bars, rounding avg_distance to 1 decimal place
            vjust = -0.5, size = 5, color = "black") + # Position labels slightly above bars, set size and color
  labs(title = "Average Distance Covered per Day", # Add plot titles and axis labels, along with a caption explaining the plot
       x = "Month", y = "Distance in km", caption = "This is a comparision of the average distance covered by participants per day in both the months") + 
  theme_minimal() # Apply a minimal theme for a clean look

## Plotting a bar graph comparing average duration in sedentary per day by participants in both months
## Calculating average duration of sedentary of each participant per day
df1 <- summarise(dailyActivity_1_cleaned, avg_sedentary = mean(sedentary_minutes))
df1 <- mutate(df1, month = "1")
df2 <- summarise(dailyActivity_2_cleaned, avg_sedentary = mean(sedentary_minutes))
df2 <- mutate(df2, month = "2")
avg_sedentary_month <- rbind (df1, df2)
avg_sedentary_month$avg_sedentary <- avg_sedentary_month$avg_sedentary/60

## Plotting the bar graph
ggplot(data = avg_sedentary_month) + 
  geom_col(mapping = aes(x=month, y=avg_sedentary, fill=month), # Create a bar chart with 'month' on x-axis and 'avg_sedentary' on y-axis
           fill="light blue", width = 0.5, color = "black") + # Set bar color to light blue, width to 0.5, and add black border
  geom_text(aes(x = month, y = avg_sedentary, label = round(avg_sedentary, 1)), # Add data labels on bars, rounding avg_sedentary to 1 decimal place
            vjust = -0.5, size = 5, color = "black") + # Position labels slightly above bars, set size and color
  labs(title = "Average Sedentary per Day", # Add plot titles and axis labels, along with a caption explaining the plot
       x = "Month", y = "Number of hours", caption = "This is a comparision of the average duration a participant is in sedentary per day in both the months") + 
  theme_minimal() # Apply a minimal theme for a clean look

## Plotting a bar graph comparing average calories burnt per day by participants in both months
## Calculating average calories burned by each participant per day
df1 <- summarise(dailyActivity_1_cleaned, avg_calories = mean(calories))
df1 <- mutate(df1, month = "1")
df2 <- summarise(dailyActivity_2_cleaned, avg_calories = mean(calories))
df2 <- mutate(df2, month = "2")
avg_calories_month <- rbind (df1, df2)

## Plotting the graph
ggplot(data = avg_calories_month) + 
  geom_col(mapping = aes(x=month, y=avg_calories, fill=month), # Create a bar chart with 'month' on x-axis and 'avg_calories' on y-axis
           fill="light blue", width = 0.5, color = "black") + # Set bar color to light blue, width to 0.5, and add black border
  geom_text(aes(x = month, y = avg_calories, label = round(avg_calories, 1)), # Add data labels on bars, rounding avg_calories to 1 decimal place
            vjust = -0.5, size = 5, color = "black") + # Position labels slightly above bars, set size and color
  labs(title = "Average Calories burnt per Day", # Add plot titles and axis labels, along with a caption explaining the plot
       x = "Month", y = "Calories", caption = "This is a comparision of the average caloreis burnt per day in both the months") + 
  theme_minimal() # Apply a minimal theme for a clean look


## 2

## Plotting a Bar graph to compare the number of participants in each BMI category
ggplot(data = bmi_summary, aes(x = bmi_category, y = count, fill = bmi_category)) + 
  geom_bar(stat = "identity", color = "black") + # Create a bar chart where bar heights represent actual count values
  geom_text(aes(x = bmi_category, y = count, label = count), vjust = -0.5, size = 5, color = "black") + # Add labels to the bars displaying the count of participants, positioning them slightly above bars
  labs(title = "BMI Distribution of Participants", # Add plot titles and axis labels, along with a caption explaining the plot
       x = "BMI Category",
       y = "Number of Participants",
       caption = "This is the distribution of participants based on their BMI") +
  scale_fill_manual(values = c("Underweight" = "lightblue", "Normal weight" = "lightgreen", # Manually set specific colors for each BMI category to improve visualization
                               "Overweight" = "orange", "Obese" = "pink")) +
  theme_minimal() # Apply a minimal theme for a clean look


## 3

## Plotting Line graphs to show the average activity of participants during each hour of the day and find the hour of the day participants were most active

## Line graph showing the average calories burned by participants during each hour of the day
ggplot(avg_calories_hr, aes(x = hour, y = avg_calories)) +
  geom_line(color = "blue", linewidth = 1) +  # Add a line graph with blue color and thickness of 1
  scale_x_continuous(breaks = seq(0, 23, by = 2)) + # Set x-axis to display hour values in intervals of 2 (0, 2, 4, ..., 22)
  labs(title = "Average Calories Burned Per Hour", # Add plot titles and axis labels, along with a caption explaining the plot
       x = "Hour of the Day (in 24hr format)",
       y = "Calories",
       caption = "This shows the average amount of Calories burned for each hour of the day") +
  theme_minimal() # Apply a minimal theme for a clean look

## Line graph showing the average intensity by participants during each hour of the day
ggplot(avg_intensity_hr, aes(x = hour, y = avg_intensity)) +
  geom_line(color = "blue", linewidth = 1) +  # Add a line graph with blue color and thickness of 1
  scale_x_continuous(breaks = seq(0, 23, by = 2)) + # Set x-axis to display hour values in intervals of 2 (0, 2, 4, ..., 22)
  labs(title = "Average Intensity Per Hour", # Add plot titles and axis labels, along with a caption explaining the plot
       x = "Hour of the Day (in 24hr format)",
       y = "Intensity",
       caption = "This shows the average intensity level for each hour of the day") +
  theme_minimal() # Apply a minimal theme for a clean look

## Line graph showing the average number of steps taken by participants during each hour of the day
ggplot(avg_steps_hr, aes(x = hour, y = avg_steps)) +
  geom_line(color = "blue", linewidth = 1) +  # Add a line graph with blue color and thickness of 1
  scale_x_continuous(breaks = seq(0, 23, by = 2)) + # Set x-axis to display hour values in intervals of 2 (0, 2, 4, ..., 22)
  labs(title = "Average Steps Per Hour", # Add plot titles and axis labels, along with a caption explaining the plot
       x = "Hour of the Day (in 24hr format)",
       y = "Number of Steps",
       caption = "This shows the average steps taken for each hour of the day") +
  theme_minimal() # Apply a minimal theme for a clean look


## 4

## Plotting stacked bar graphs showing average time asleep per day as a proportion of average time in bed per day for each participant
sleepDay_2_cleaned %>%
  group_by(id) %>% # Group data by participant ID
  summarise(
    avg_hours_asleep = mean(total_hours_asleep), # Calculate the average hours asleep and in bed for each participant
    avg_hours_in_bed = mean(total_hours_in_bed)
  ) %>%
  arrange(id) %>% # Arrange data by participant ID
  mutate(participant = c(1:24)) %>% # Create a sequential participant ID from 1 to 24
  ggplot(aes(x = participant)) +
  geom_bar(aes(y = avg_hours_in_bed), stat = "identity", fill = "blue", width = 0.7) +  # Add a bar for the average hours in bed (darker blue)
  geom_bar(aes(y = avg_hours_asleep), stat = "identity", fill = "skyblue", width = 0.7) + # Add a bar for the average hours asleep (lighter blue) within the previous bar
  scale_x_continuous(breaks = seq(1, 24, by = 1)) + # Customize the x-axis to display participant numbers from 1 to 24
  scale_y_continuous(breaks = seq(0, 18, by = 2)) + # Customize the y-axis to show sleep hours in 2-hour increments
  labs(title = "Average Sleep Efficiency of Each Participant", # Add plot titles and axis labels, along with a caption explaining the plot
       subtitle = "Dark Blue - Time in bed, Light Blue - Time asleep",
       x = "Participant",
       y = "Hours",
       fill = "Sleep Data",
       caption = "This shows the average duration a participant is in bed vs. average duration they are asleep") +  
  theme_minimal() # Apply a minimal theme for a clean look


## 5

## Plotting a Scatter plot to show the relationship between average duration of being very active per day and average BMI of participants
ggplot(data=very_active_bmi) +
  geom_point(mapping = aes(x=avg_duration_very_active, y=avg_bmi, color=bmi_category), size=3.5) + # Add scatter plot points, coloring by BMI category, and setting point size
  geom_smooth(method ='lm', mapping = aes(x=avg_duration_very_active, y=avg_bmi), se = TRUE, alpha=0.3) + # Add a linear regression line with confidence interval (shaded area)
  scale_color_manual(values = c( # Manually set colors for BMI categories
    "Normal weight" = "green",
    "Overweight" = "orange",
    "Obese" = "red"
  )) +
  labs(title = "Relationship between being Very Active and BMI", # Add plot titles and axis labels, along with a caption explaining the plot
       x = "Very Active Duration (in minutes)",
       y = "BMI",
       caption = "This shows the relationship between the average time a participant spends being very active per day and their average BMI") +  
  theme_minimal() # Apply a minimal theme for a clean look

## Plotting a Scatter plot to show the relationship between average duration of being sedentary per day and average BMI of participants
ggplot(data=sedentary_bmi) +
  geom_point(mapping = aes(x=avg_duration_sedentary, y=avg_bmi, color=bmi_category), size=3.5) + # Add scatter plot points, coloring by BMI category, and setting point size
  geom_smooth(method ='lm', mapping = aes(x=avg_duration_sedentary, y=avg_bmi), se = TRUE, alpha=0.3) + # Add a linear regression line to visualize the trend with confidence interval (shaded area)
  scale_color_manual(values = c( # Manually set colors for BMI categories
    "Normal weight" = "green",
    "Overweight" = "orange",
    "Obese" = "red"
  )) +
  labs(title = "Relationship between being Sedentary and BMI", # Add plot titles and axis labels, along with a caption explaining the plot
       x = "Sedentary Duration (in hours)",
       y = "BMI",
       caption = "This shows the relationship between the average time a participant is sedentary per day and their average BMI") +  
  theme_minimal() # Apply a minimal theme for a clean look


## 6

## Plotting a Scatter plot to show the relationship between total distance covered by participants per day and average number of hours participants were asleep per day
  ggplot(data=steps_vs_sleep) +
    geom_point(mapping = aes(x=total_hours_asleep, y=total_distance), color = "blue", alpha = 0.5) + # Add scatter plot points (total hours of sleep vs total distance covered)
    geom_smooth(mapping = aes(x=total_hours_asleep, y=total_distance),method = "lm", se = TRUE, color = "red") + # Add a linear regression line to visualize the trend with confidence interval (shaded area)
    scale_x_continuous(breaks = seq(0, 15, by = 2)) + # Customize the x-axis with breaks at 2-hour intervals from 0 to 15
    scale_y_continuous(breaks = seq(0, 18, by = 3)) + # Customize the y-axis with breaks at 3-km intervals from 0 to 18
    labs(title = "Relationship between Duration of Sleep and Distance Covered", # Add plot titles and axis labels, along with a caption explaining the plot
         x = "Sleep Duration (in hours)",
         y = "Distance Covered (in km)",
         caption = "This shows the relationship between the duration of sleep per day and total distance covered per day by all participants") +  
    theme_minimal() # Apply a minimal theme for a clean look
  
## Plotting a Scatter plot to show the relationship between total steps taken by participants per day and average number of hours participants were asleep per day
  ggplot(data=steps_vs_sleep) +
    geom_point(mapping = aes(x=total_hours_asleep, y=total_steps), color = "blue", alpha = 0.5) + # Add scatter plot points (total hours of sleep vs total steps taken)
    geom_smooth(mapping = aes(x=total_hours_asleep, y=total_steps),method = "lm", se = TRUE, color = "red") + # Add a linear regression line to visualize the trend with confidence interval (shaded area)
    scale_x_continuous(breaks = seq(0, 15, by = 2)) + # Customize the x-axis with breaks at 2-hour intervals from 0 to 15 hours
    scale_y_continuous(breaks = seq(0, 28000, by = 3000)) + # Customize the y-axis with breaks at 3000-step intervals from 0 to 28000 steps
    labs(title = "Relationship between Duration of Sleep and Steps Taken", # Add plot titles and axis labels, along with a caption explaining the plot
         x = "Sleep Duration (in hours)",
         y = "Steps Taken",
         caption = "This shows the relationship between the duration sleep per day and total steps taken per day by all participants") +  
    theme_minimal() # Apply a minimal theme for a clean look
  