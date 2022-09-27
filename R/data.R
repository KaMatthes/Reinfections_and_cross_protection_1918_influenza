data_grippe <- read.csv("data_raw/Factory_Survey_Data.csv", sep=";") %>%
  filter(!is.na(Photo_ID)) %>%
  mutate(age_group=as.character(cut(Age2, breaks=c(0,39,Inf))),
         age_group=recode(age_group,
                          "(0,39]" = "<40",
                          "(39,Inf]" = ">=40"),
         age_group25=as.character(cut(Age2, breaks=c(0,25,Inf))),
         age_group25=recode(age_group25,
                          "(0,25]" = "<25",
                          "(25,Inf]" = ">=25"),
         Reinfection=ifelse(Times_grippe >1, 1, 0),
         Reinfection = as.factor(Reinfection),
         Reinfection_forte = as.factor(Reinfection_forte),
         Grippe1890 = as.factor(Grippe1890),
         Severeness = as.character(Severeness),
         Severeness= recode(Severeness,
                            "3" = "2"))%>%
  select(Sex,Age2,age_group, age_group25, Grippe, Reinfection, Reinfection_forte, Severeness, reinf_v1, vage1, reinf_v2,vage2, reinf_v3, vage3,reinf_y1919,vage_1919,
         Grippe1890)


write.xlsx(data_grippe,paste0("data/data_grippe.xlsx"), rowNames=FALSE, overwrite = TRUE)
save(data_grippe,file=paste0("data/data_grippe.RData"))