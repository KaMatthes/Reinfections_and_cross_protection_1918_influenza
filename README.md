# Reinfections and cross-protection during the 1918/1919 influenza pandemic: Revisiting a survey among male and female factory workers

## Paper
<br >
Mattthes KL*, Le Vu M*, Bhattacharyya U, Galliker A, Kordi M, Floris J, Staub K (2023) Reinfections and Cross-Protection in the 1918/19 Influenza Pandemic: Revisiting a Survey Among Male and Female Factory Workers. *International Journal of Public Health*. https://doi.org/10.3389/ijph.2023.1605777
* Equal contribution

## Data

The data is public available via Zenodo:
<br >
[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.7274470.svg)](https://doi.org/10.5281/zenodo.7274470)



## Content of this repository

### Structure

```
.
+-- R
+-- data
+-- data_raw
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

[![CC BY-NC-SA 4.0][cc-by-nc-sa-image]][cc-by-nc-sa]

[cc-by-nc-sa]: http://creativecommons.org/licenses/by-nc-sa/4.0/
[cc-by-nc-sa-image]: https://licensebuttons.net/l/by-nc-sa/4.0/88x31.png
