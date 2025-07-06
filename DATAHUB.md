# Course Datahubs

Use the Stat20 datahub for the most available RAM (1GB guarantee, 2GB limit), however the general R Datahub is also available, but with lower RAM (512MB guarantee, 1GB limit) and a different set of default packages.

- [Stat20 datahub + clone repo link](https://stat20.datahub.berkeley.edu/hub/user-redirect/git-pull?repo=https%3A%2F%2Fgithub.com%2Fevictionresearch%2FSOC-N100-Housing-Precarity&urlpath=rstudio%2F)
- [General R datahub + clone repo link](https://r.datahub.berkeley.edu/hub/user-redirect/git-pull?repo=https%3A%2F%2Fgithub.com%2Fevictionresearch%2FSOC-N100-Housing-Precarity&urlpath=rstudio%2F)

Note: Your file changes DO NOT automatically sync between different datahubs! If you start on one datahub, but then switch to another, they are separate systems and cannot see files from the other.

## **RStudio-Enabled Deployments and Package Sets**

### **1. STAT20 Deployment** (Highest RAM, Statistics-Focused)
- **URL**: [stat20.datahub.berkeley.edu](https://stat20.datahub.berkeley.edu/hub/user-redirect/git-pull?repo=https%3A%2F%2Fgithub.com%2Fevictionresearch%2FSOC-N100-Housing-Precarity&urlpath=rstudio%2F)
- **Memory**: `guarantee: 1024M, limit: 2048M` (1GB guarantee, 2GB limit)
- **RStudio**: Available (`defaultUrl: /rstudio`)
- **Image**: `rocker/geospatial:4.5.0` + custom packages
- **Config**: [berkeley-dsep-infra/datahub/deployments/stat20](https://github.com/berkeley-dsep-infra/datahub/tree/staging/deployments/stat20)
- **Special Features**: Uses Rocker-based images with RStudio as user 1000

**Key R Packages Available:**
- **Core Statistics**: `infer@1.0.8`, `openintro@2.5.0`, `palmerpenguins@0.1.1`
- **Data Visualization**: `ggplot2`, `ggrepel@0.9.6`, `ggthemes@5.1.0`, `patchwork@1.3.0`
- **Data Manipulation**: `tidyverse`, `janitor@2.2.1`, `reshape2@1.4.4`
- **Reporting**: `gt@0.11.1`, `kableExtra@1.4.0`, `quarto@1.4.4`, `pagedown@0.22`
- **Interactive**: `plotly@4.10.4`, `countdown@0.4.0`
- **Datasets**: `fivethirtyeight@0.6.2`, `gapminder@1.0.0`, `unvotes@0.3.0`
- **Special**: `swirl@2.4.5` (interactive R tutorials)
- **Custom**: Course-specific packages from GitHub (`stat20/stat20data`, `andrewpbray/boxofdata`)

### **2. R Deployment** (Medium RAM, General R Environment)
- **URL**: [r.datahub.berkeley.edu](https://r.datahub.berkeley.edu/hub/user-redirect/git-pull?repo=https%3A%2F%2Fgithub.com%2Fevictionresearch%2FSOC-N100-Housing-Precarity&urlpath=rstudio%2F)
- **Memory**: `guarantee: 512M, limit: 1G` (512MB guarantee, 1GB limit)
- **RStudio**: Available (`defaultUrl: "/rstudio"`)
- **Image**: Default datahub image with R support
- **Confg**: [berkeley-dsep-infra/datahub/deployments/r](https://github.com/berkeley-dsep-infra/datahub/tree/staging/deployments/r)
- **Special Features**: RStudio-specific configurations

**Key R Packages Available:**
- **Core Data Science**: `tidyverse@2.0.0`, `dplyr@1.1.4`, `ggplot2@3.5.1`
- **Statistics**: `broom@1.0.7`, `stats@4.5.0`, `lmtest@0.9-40`, `sandwich@3.1-1`
- **Economics**: `AER@1.2-14`, `estimatr@1.0.4`, `wooldridge@1.4-3`, `stargazer@5.2.3`
- **Geospatial**: `leaflet@2.2.2`, `sf`, `stars@0.6-7`, `tmap@3.3-4`
- **Databases**: `DBI@1.2.3`, `RSQLite@2.3.9`, `RPostgres@1.4.7`
- **Machine Learning**: `scikit-learn` (via reticulate), `e1071@1.7-16`
- **Interactive**: `plotly@4.10.4`, `DT@0.33`, `shiny@1.4.0`
- **Data Sources**: `nycflights13@1.0.2`, `Lahman@12.0-0`, `ipumsr@0.8.1`


## **Common Packages Across All RStudio Deployments**

### **Core Data Science Stack:**
- `tidyverse` (dplyr, ggplot2, tidyr, readr, purrr)
- `ggplot2` for visualization
- `dplyr` for data manipulation
- `readr` for data import
- `purrr` for functional programming

### **Statistics & Modeling:**
- `stats` (base R statistics)
- `broom` for model tidying
- `lmtest` for linear model tests
- `sandwich` for robust standard errors

### **Interactive & Reporting:**
- `plotly` for interactive plots
- `DT` for interactive tables
- `shiny` for web applications
- `quarto` for document generation

### **Python Integration:**
- `reticulate` for Python integration
- Access to Python packages like `pandas`, `numpy`, `scikit-learn`

## Datahub Link Generator
To generate the links to the datahubs above, here are the instructions to follow:

1. Use the Chrome extension [DataHub Link Generator](https://chromewebstore.google.com/detail/datahub-link-generator/ijbgangngghdanhcnaliiobbiffocahf?hl=en)
2. Navigate to the course repo: https://github.com/evictionresearch/SOC-N100-Housing-Precarity/
3. Click the Link Generator extension (orange bear icon in Chrome that you just installed)
4. Enter one of these as the **JupyterHub URL**:
5. Click **Copy nbgitpuller link**
- Stat20 datahub + clone repo link: https://stat20.datahub.berkeley.edu/hub/user-redirect/git-pull?repo=https%3A%2F%2Fgithub.com%2Fevictionresearch%2FSOC-N100-Housing-Precarity&urlpath=rstudio%2F
- General R datahub + clone repo link: https://r.datahub.berkeley.edu/hub/user-redirect/git-pull?repo=https%3A%2F%2Fgithub.com%2Fevictionresearch%2FSOC-N100-Housing-Precarity&urlpath=rstudio%2F

See the [CDSS datahub link generator instructions](https://cdss.berkeley.edu/dsus/data-science-resources/datahub/setup) for more information.
