librarian::shelf(tidyverse, tidycensus)

21901
rb_vars <- c(
"B25070_001", # Estimate!!Total:   Gross Rent as a Percentage of Household Income in the Past 12 Months
"B25070_002", # Estimate!!Total:!!Less than 10.0 percent Gross Rent as a Percentage of Household Income in the Past 12 Months
"B25070_003", # Estimate!!Total:!!10.0 to 14.9 percent Gross Rent as a Percentage of Household Income in the Past 12 Months
"B25070_004", # Estimate!!Total:!!15.0 to 19.9 percent Gross Rent as a Percentage of Household Income in the Past 12 Months
"B25070_005", # Estimate!!Total:!!20.0 to 24.9 percent Gross Rent as a Percentage of Household Income in the Past 12 Months
"B25070_006", # Estimate!!Total:!!25.0 to 29.9 percent Gross Rent as a Percentage of Household Income in the Past 12 Months
"B25070_007", # Estimate!!Total:!!30.0 to 34.9 percent Gross Rent as a Percentage of Household Income in the Past 12 Months
"B25070_008", # Estimate!!Total:!!35.0 to 39.9 percent Gross Rent as a Percentage of Household Income in the Past 12 Months
"B25070_009", # Estimate!!Total:!!40.0 to 49.9 percent Gross Rent as a Percentage of Household Income in the Past 12 Months
"B25070_010", # Estimate!!Total:!!50.0 percent or more Gross Rent as a Percentage of Household Income in the Past 12 Months
"B25070_011" # Estimate!!Total:!!Not computed Gross Rent as a Percentage of Household Income in the Past 12 Months
)
rb_vars

acs_df <- 
  get_acs(
    geography = "tract", 
    state = "CA", 
    county = "San Francisco", 
    variables = rb_vars, 
    year = 2023
  )

sf_rb <- 
  acs_df %>% 
  group_by(GEOID) %>% 
  select(-moe) %>% 
  pivot_wider(
    names_from = variable, 
    values_from = estimate
  ) %>% 
  select(B25070_001, B25070_007:B25070_010) %>% 
# You could do a summarize function here but don't need to, let's do a mutate
  mutate(
    rb_count = sum(B25070_007, B25070_008, B25070_009, B25070_010), 
    p_rb = rb_count / B25070_001
  ) 

ggplot(sf_rb, aes(x = p_rb)) + 
  geom_histogram(fill = "blue", col = "black", bins = 30) + 
  theme_minimal() + 
  labs(
    title = "Rent burden tract distribution in San Francisco", 
    x = "Proportion Rent Burdened", 
    y = "Count"
  ) + 
  geom_vline(xintercept = median(sf_rb$p_rb, na.rm = TRUE), col = "red")

# Tim's package "neighborhood" that creates racial segregation values: https://github.com/evictionresearch/neighborhood?tab=readme-ov-file

