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

This folder contains the data created from  `data.R` 
  - `data_grippe.RData` 
  
### `data_raw` folder
This folder contains the raw data for the analysis:
-`Factory_Survey_Data.csv`

### `output` folder

This folder contains all outputs.

### `master.R` 

This skript contains information of the used R packages, R scripts, plotting parameters etc, please run first ` load("data/data_grippe.RData")`.
