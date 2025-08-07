# Load required packages: tidyverse for data manipulation/visualization, tidycensus for accessing Census data
librarian::shelf(tidyverse, tidycensus, evictionresearch / neighborhood)

# Define ACS variable codes for gross rent as a percentage of household income
# Each code corresponds to a specific rent burden category
rb_vars <- c(
  "B25070_001", # Total: Gross Rent as a Percentage of Household Income in the Past 12 Months
  "B25070_002", # <10.0 percent
  "B25070_003", # 10.0 to 14.9 percent
  "B25070_004", # 15.0 to 19.9 percent
  "B25070_005", # 20.0 to 24.9 percent
  "B25070_006", # 25.0 to 29.9 percent
  "B25070_007", # 30.0 to 34.9 percent
  "B25070_008", # 35.0 to 39.9 percent
  "B25070_009", # 40.0 to 49.9 percent
  "B25070_010", # 50.0 percent or more
  "B25070_011"  # Not computed
)
rb_vars

# Download ACS 2023 data for San Francisco census tracts for the selected variables
acs_df <-
  get_acs(
    geography = "tract",
    state = "CA",
    county = "San Francisco",
    variables = rb_vars,
    year = 2023
  )

# Process the ACS data to calculate rent burden statistics by tract
sf_rb <-
  acs_df %>%
  group_by(GEOID) %>%                # Group by census tract
  select(-moe) %>%                   # Remove margin of error column
  pivot_wider(
    names_from = variable,           # Spread variable codes into columns
    values_from = estimate
  ) %>%
  select(B25070_001, B25070_007:B25070_010) %>% # Keep total and rent-burdened categories
  # Calculate rent-burdened count and proportion for each tract
  mutate(
    rb_count = sum(B25070_007, B25070_008, B25070_009, B25070_010),
    # rb_count: households spending 30% or more of income on rent
    p_rb = rb_count / B25070_001     # Proportion rent-burdened
  )

# Plot the distribution of rent burdened proportion across tracts
ggplot(sf_rb, aes(x = p_rb)) +
  geom_histogram(fill = "blue", col = "black", bins = 30) +
  theme_minimal() +
  labs(
    title = "Rent burden tract distribution in San Francisco",
    x = "Proportion Rent Burdened",
    y = "Count"
  ) +
  geom_vline(xintercept = median(sf_rb$p_rb, na.rm = TRUE), col = "red") # Add median line

# Tim's package "neighborhood" that creates racial segregation values: https://github.com/evictionresearch/neighborhood?tab=readme-ov-file


seg <- ntdf(state = "CA", county = "San Francisco", year = 2023)
glimpse(seg)

seg_adj <-
  seg %>%
  mutate(TRACTCODE = str_sub(GEOID, 3, 11))
glimpse(seg_adj)

write_csv(seg_adj, "~/SOC-N100-Lab-Code/seg.csv")
write_csv(sf_rb, "~/SOC-N100-Lab-Code/sf_rb.csv")

# Now we're going to map this using a great free websource called datawrapper.de
