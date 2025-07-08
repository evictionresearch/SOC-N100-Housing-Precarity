# SOC-N100-Housing-Precarity
Housing Precarity and Displacement: Racial and Gender Inequality in Gentrification and Eviction

## Website creation: 
The website is hosted in the `docs` directory and created with quarto using the `website/index.qmd` and `website/_quarto.yml`. 
When creating this website, go into RStudio > File > New Project > New Directory > Quarto Website. Make the directory name `website` and create the project in the repo parent directory. 

To host the github pages: 
1. On Github.com, set the page to load from `/docs`
2. Create a `doc` directory in the repo
3. Set the output directory to docs: 
```
project:
  type: website
  output-dir: ../docs
```