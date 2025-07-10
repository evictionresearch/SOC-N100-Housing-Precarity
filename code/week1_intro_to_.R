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
# - You can run a line of code by clicking on it and pressing Ctrl+Enter (Windows) or Cmd+Enter (Mac).
# - You can also highlight multiple lines and run them together.
# - Try running the line below:

1 + 1  # This should print 2 in the Console

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

# You can print the value of a variable by typing its name:

x

# =============================================================================
# 4. Data Types in R
# -----------------------------------------------------------------------------
# R has several types of data:
# - Numeric (numbers)
# - Character (text)
# - Logical (TRUE or FALSE)

a <- 7.5          # Numeric
b <- "Eviction"   # Character (note the quotes)
c <- TRUE         # Logical

# You can check the type of a variable with the class() function:

class(a)
class(b)
class(c)

# =============================================================================
# 5. Vectors: Collections of Values
# -----------------------------------------------------------------------------
# A vector is a list of values of the same type.

numbers <- c(1, 2, 3, 4, 5)      # Numeric vector
names <- c("Alice", "Bob", "Carmen") # Character vector

numbers
names

# You can access elements in a vector using square brackets:

numbers[3]   # The third element (remember: R starts counting at 1)

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

# Access a specific value (row 2, column "age"):

students$age[2]

# =============================================================================
# 7. Reading in Data
# -----------------------------------------------------------------------------
# Let's read in a CSV file. We'll use a sample dataset that comes with R.

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

# Calculate the mean of a column:

mean(mtcars$mpg)   # Average miles per gallon

# =============================================================================
# 9. Introduction to tidyverse
# -----------------------------------------------------------------------------
# tidyverse is a collection of R packages for data science.
# Let's install and load it (do this only once):

# Uncomment the next line if you have not installed tidyverse before:
# install.packages("tidyverse")

library(tidyverse)

# Let's use tidyverse to select columns and filter rows:

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

# foods <- c("Pizza", "Tacos", "Salad")
# cities <- data.frame(
#   city = c("Richmond", "Oakland", "Berkeley"),
#   population = c(110000, 425000, 120000)
# )
# mean(students$age)

# =============================================================================
# 11. Loading Libraries (with tidyverse)
# -----------------------------------------------------------------------------
# Let's make sure we have the tidyverse package loaded, as it contains many useful tools.

# Uncomment and run if you haven't installed tidyverse before:
# install.packages("tidyverse")

library(tidyverse)  # Loads dplyr, ggplot2, readr, tibble, and more

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
