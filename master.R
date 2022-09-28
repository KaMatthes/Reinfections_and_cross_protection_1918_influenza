library(tidyverse)
library(openxlsx)
library(arsenal)
library(export)
library(ggsci)
library(cowplot)


# parameter plots

mypalette7 <-pal_jco()(10)

strip_text <- 25
lwd_size <- 2
pch_type <- 19
lwdline <- 1
size_legend <- 15
size_legend_title<- 15
pd <-position_dodge(width=0.8)
fatten_size <- 2.5
plot_title <- 25

size_axis <- 22
size_axis_title <- 22
size_plot_title <-15
size_legend_text <- 20


# load data

load("data/data_grippe.RData")

# R scripts
