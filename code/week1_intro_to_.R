# =============================================================================
# Week 1 R In Class Exercise: Introduction to R and RStudio
# Course: Housing Precarity and Displacement: Racial and Gender Inequality in Gentrification and Eviction
# =============================================================================

# Welcome to your first R coding class! This script will help you get comfortable
# with the basics of R and RStudio. We will cover:
#   - What is R and RStudio?
#   - How to run code
#   - Basic math and variable assignment
#   - Data types in R
#   - Vectors and data frames
#   - Reading in data
#   - Basic data exploration
#   - Introduction to tidyverse

# The goal is to make you comfortable with the basics so you can build on these
# skills in future weeks.

# =============================================================================
# 1. What is R and RStudio?
# -----------------------------------------------------------------------------
# R is a programming language for data analysis and statistics.
# RStudio is an interface (IDE) that makes R easier to use.
# You will be using RStudio, which is already set up for you on the server.

# =============================================================================
# 2. How to Run Code in RStudio
# -----------------------------------------------------------------------------
# - You can run a line of code by clicking on it and pressing Ctrl+Enter (Windows) or Cmd+Return (Mac).
# - You can also highlight multiple lines and run them together.
# - Try running the line below:

1 + 1  # This should print 2 in the Console

# If I want to comment something, I need to add a #
# if I don't comment, then I don't use a hash
# for a mac, a shortcut for commenting out something is cmd+/

# =============================================================================
# 3. Basic Math and Variables
# -----------------------------------------------------------------------------
# You can use R like a calculator:

2 * 5      # Multiplication
10 / 2     # Division
2^3        # Exponentiation (2 to the power of 3)

# You can store values in variables using the "<-" symbol:

x <- 10    # Assigns the value 10 to x
y <- 5
x + y      # Adds x and y

rabbit <- x + y 

# You can print the value of a variable by typing its name:

x
z
rabbit

# =============================================================================
# 4. Data Types in R
# -----------------------------------------------------------------------------
# R has several types of data:
# - Numeric (numbers)
# - Character (text)
# - Logical (TRUE or FALSE)

a <- 7.5          # Numeric
b <- "Eviction"   # Character (note the quotes)
c <- FALSE         # Logical

# You can check the type of a variable with the class() function:

class(a)
class(b)
class(c)

a
b
c

# Help!! Anytime you want to know more about a function, you can search it in
# the help section.

# =============================================================================
# 5. Vectors: Collections of Values
# -----------------------------------------------------------------------------
# A vector is a list of values of the same type.

numbers <- c(1, 2, 3, 4, 7)      # Numeric vector
names <- c("Alice", "Bob", "Carmen") # Character vector

numbers
names

# You can access elements in a vector using square brackets:

numbers[5]   # The third element (remember: R starts counting at 1)
numbers[2:3]
numbers[4:5]

# =============================================================================
# 6. Data Frames: Tables of Data
# -----------------------------------------------------------------------------
# A data frame is like a spreadsheet or table.

# Let's create a simple data frame:

students <- data.frame(
  name = c("Ana", "Ben", "Carlos"),
  age = c(20, 21, 19),
  gender = c("F", "M", "M")
)

students

# Access a column using $:

students$name
students$age

# Access a specific value (row 2, column "age"):

students$age[2]

w = 3
#
# Side note: What's the difference between an = and <- sign? 
# <- is used to create objects (x <- 10)
# = is used to apply values to a field, vector, or column (x <- data.frame(age = c(20, 21, 19))). 
# Usually you'll use = to 
#

# =============================================================================
# 7. Reading in Data
# -----------------------------------------------------------------------------
# Let's read in a CSV file. We'll use a sample dataset that comes with R.
# some_data.csv

# First, see where your working directory is:
getwd()

# Let's use the built-in 'mtcars' dataset for now:

data(mtcars)   # Loads the dataset
head(mtcars)   # Shows the first 6 rows

# =============================================================================
# 8. Basic Data Exploration
# -----------------------------------------------------------------------------
# Let's look at some basic information about mtcars:

dim(mtcars)        # Number of rows and columns
names(mtcars)      # Column names
summary(mtcars)    # Summary statistics

# Calculate the mean and median of a column:

mean(mtcars$mpg)   # Average miles per gallon
median(mtcars$mpg)   # Median miles per gallon

# =============================================================================
# 9. Introduction to tidyverse
# -----------------------------------------------------------------------------
# tidyverse is a collection of R packages for data science.
# Let's install and load it (do this only once):

# Uncomment the next line if you have not installed tidyverse before:
install.packages("tidyverse")

library(tidyverse)

# Let's use tidyverse to select columns and filter rows:
# Before we do that, we're going to use an thing called a pipe "%>%"

mtcars %>%
  select(mpg, cyl, gear) %>%     # Select only some columns
  filter(mpg > 20)               # Only cars with mpg > 20

# =============================================================================
# 10. Your Turn: Practice!
# -----------------------------------------------------------------------------
# Try these on your own:
# - Create a vector of your favorite foods
# - Make a data frame of three cities and their populations
# - Find the average age in the students data frame

# Example (uncomment and fill in your answers):

foods <- c("Burritos", "Sushi", "Phad Thai")
cities <- data.frame(
  city = c("Seattle", "Oakland", "Baltimore"),
  population = c(400000, 300000, 50)
)
mean(students$age)

# =============================================================================
# 12. Data Viewing and Exploration
# -----------------------------------------------------------------------------
# Before we start plotting, let's practice exploring and viewing data.

# View the first few rows:
head(mtcars)

# View the last few rows:
tail(mtcars)

# View the structure of the data frame:
str(mtcars)

# Get a summary of the data:
summary(mtcars)

# View the data in a spreadsheet-like viewer (in RStudio):
View(mtcars)  # This will open a new tab in RStudio

# Check for missing values:
anyNA(mtcars)

# =============================================================================
# 12a. Data Manipulation with dplyr (a package within the tidyverse)
# -----------------------------------------------------------------------------
# The dplyr package (part of tidyverse) provides simple and powerful functions
# for manipulating data. These commands are called "verbs" or "functions" and let you select,
# filter, arrange, create, and summarize data in a clear and readable way.

# The most common dplyr commands are:
#   - select(): Pick columns (variables)
#   - filter(): Pick rows based on values
#   - arrange(): Reorder rows
#   - mutate(): Create new columns or change existing ones
#   - summarise(): Collapse data into summary statistics
#   - group_by(): Group data for grouped operations

# Let's practice these using the mtcars dataset.

# ---- 12a.1 select(): Pick Columns ----

# Select only the mpg and cyl columns
mtcars %>%
  select(mpg, cyl)

# ---- 12a.2 filter(): Pick Rows ----

# Filter for cars with more than 6 cylinders
mtcars %>%
  filter(cyl > 6)

# ---- 12a.3 arrange(): Reorder Rows ----

# Arrange cars by mpg, from lowest to highest
mtcars %>%
  arrange(mpg)

# Arrange cars by mpg, from highest to lowest
mtcars %>%
  arrange(desc(mpg))

# ---- 12a.4 mutate(): Create or Change Columns ----

# Add a new column for weight in kilograms (wt is in 1000 lbs)
mtcars %>%
  mutate(wt_kg = wt * 1000 * 0.453592) %>%
  str()

### LEFT OFF ###

# ---- 12a.5 summarise(): Summary Statistics ----

# Find the average mpg for all cars
mtcars %>%
  summarise(avg_mpg = mean(mpg)) 

# ---- 12a.6 group_by(): Grouped Operations ----

# Find the average mpg for each cylinder group
mtcars %>%
  group_by(cyl) %>%
  summarise(avg_mpg = mean(mpg))

# ---- 12a.7 Chaining Commands with the Pipe (%>%) ----

# You can chain multiple commands together for more complex tasks.
# Example: For cars with more than 4 cylinders, find the average mpg by cylinder group.

mtcars %>%
  filter(cyl > 4) %>%
  group_by(cyl) %>%
  summarise(avg_mpg = mean(mpg))

# ---- 12a.8 Practice: Try These! ----

# - Select the columns hp and wt
# - Filter for cars with mpg greater than 25
# - Arrange cars by horsepower (hp), highest to lowest
# - Create a new column that is mpg divided by cyl
# - Group by gear and find the max mpg for each group

# Example (uncomment and fill in):
# mtcars %>% select(hp, wt)
# mtcars %>% filter(mpg > 25)
# mtcars %>% arrange(desc(hp))
# mtcars %>% mutate(mpg_per_cyl = mpg / cyl)
# mtcars %>% group_by(gear) %>% summarise(max_mpg = max(mpg))

# For more details, see the dplyr documentation and cheatsheets.
# =============================================================================


# =============================================================================
# 13. Creating Plots with ggplot2: Step-by-Step
# -----------------------------------------------------------------------------
# ggplot2 is part of the tidyverse and is used for making plots.
# We'll start with very simple plots and build up.

# ---- 13.1 The Simplest Plot: Histogram of mpg ----

ggplot(mtcars, aes(x = mpg)) +
  geom_histogram()  # Default bins

# ---- 13.2 Add Labels and Change Color ----

ggplot(mtcars, aes(x = mpg)) +
  geom_histogram(fill = "skyblue", color = "black") +
  labs(title = "Histogram of Miles Per Gallon", x = "Miles Per Gallon", y = "Count")

# ---- 13.3 Bar Plot: Number of Cars by Cylinder ----

ggplot(mtcars, aes(x = factor(cyl))) +
  geom_bar(fill = "orange") +
  labs(title = "Number of Cars by Cylinder", x = "Cylinders", y = "Count")

# ---- 13.4 Scatter Plot: MPG vs. Horsepower ----

ggplot(mtcars, aes(x = hp, y = mpg)) +
  geom_point() +
  labs(title = "MPG vs. Horsepower", x = "Horsepower", y = "Miles Per Gallon")

# ---- 13.5 Boxplot: MPG by Cylinder ----

ggplot(mtcars, aes(x = factor(cyl), y = mpg)) +
  geom_boxplot(fill = "lightgreen") +
  labs(title = "MPG by Cylinder", x = "Cylinders", y = "Miles Per Gallon")

# ---- 13.6 Customizing Plots: Themes and Colors ----

ggplot(mtcars, aes(x = hp, y = mpg, color = factor(gear))) +
  geom_point(size = 3) +
  labs(title = "MPG vs. Horsepower by Gear", x = "Horsepower", y = "Miles Per Gallon", color = "Gear") +
  theme_minimal()

# ---- 13.7 Saving a Plot ----

# Save your last plot to a file (uncomment to use):
# ggsave("my_first_plot.png")

# =============================================================================
# 14. Your Turn: Try Making Plots!
# -----------------------------------------------------------------------------
# Try these on your own:
# - Make a histogram of another variable (e.g., hp)
# - Make a scatter plot of wt vs. mpg
# - Make a bar plot of the number of cars by gear

# Example (uncomment and fill in your answers):

# ggplot(mtcars, aes(x = hp)) + geom_histogram()
# ggplot(mtcars, aes(x = wt, y = mpg)) + geom_point()
# ggplot(mtcars, aes(x = factor(gear))) + geom_bar()

# =============================================================================
# 15. Next Steps
# -----------------------------------------------------------------------------
# In future weeks, we will use real data about housing, race, and income.
# We will use the tidyverse and tidycensus packages to explore and analyze data
# about housing precarity and displacement.

# Remember: Coding is a skill you build with practice. Don't be afraid to make mistakes!

# =============================================================================
# END OF WEEK 1 SCRIPT
# =============================================================================
