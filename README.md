# Reinfections and cross-protection during the 1918/1919 influenza pandemic: Revisiting a survey among male and female factory workers

## Paper


## Data

The data is public available via Zenodo:
<br >



## Content of this repository

### Structure

```
.
+-- R
+-- data
+-- data
+-- output

```

### `R` folder 

This folder contains all R scripts.

  - `data.R` : prepares the data for the analysis
  - `Table1.R` : code to create Table1 and values of proportion test
  - `Table2.R` : code for cross-protection calculation
  - `Figure1.R` : code for logistical regression models and Figure 1
  - `Supplement_Figure4.R` : code to create age distribution plot
 
  
### `data` folder

This folder contains the data.
  - `data_study.csv` : contains socio-demographic, health- and lifestyle factors, and body scan variables of each participant
  - `healthscore.csv` : contains "healthy score" from the food frequency questions calculated from from five food categories: fruits, vegetables, wholegrain
products, meat, and sweet/salty snacks. For each category the officially recommended minimum or maximum amount of weekly intake was used as the cut-off value and a point was assigned if the recommendation was met. A score from 0 to 5 was built to reflect the overall healthiness of the diet.

### `data_raw` folder
-`Factory_Survey_Data.csv` : contains  factory data

### `output` folder

This folder contains the bootstrapping results of each outcome.

### `master.R` 

This skript contains information of the used R packages, number of bootstrapping, set seed etc.. To run the function `bootsptrapping.R`, please run first `data.R`.


