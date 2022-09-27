data_grippe <- data_grippe %>%
  mutate(Sex= factor(Sex, levels = c("male", "female")))

data_grippe_yes <- data_grippe %>%
  filter(Grippe=="oui")

data_grippe_reinf <- data_grippe_yes %>%
  filter(Reinfection=="1")

#  Age
tab_age <- tableby(Sex ~ Age2 + age_group25 + age_group, data=data_grippe)
summary(tab_age)
tab_des <- summary(tab_age,text=TRUE)
tab_des <- as.data.frame(tab_des)
table2excel(tab_des, file = "output/Table_age.xlsx")

#  Grippe
tab_grippe <- tableby(Sex ~ age_group +Severeness+Reinfection, data=data_grippe_yes)
summary(tab_grippe)
tab_des <- summary(tab_grippe,text=TRUE)
tab_des <- as.data.frame(tab_des)
table2excel(tab_des, file = "output/Table_grippe.xlsx")

#  Reinfection
tab_reinf <- tableby(Sex ~ age_group +Reinfection_forte, data=data_grippe_reinf)
summary(tab_reinf)
tab_des <- summary(tab_reinf,text=TRUE)
tab_des <- as.data.frame(tab_des)
table2excel(tab_des, file = "output/Table_reinf.xlsx")

# 1890 infected

tab_1890 <- tableby(Sex ~ Grippe1890, data=data_grippe)
summary(tab_1890)
tab_des <- summary(tab_1890 ,text=TRUE)
tab_des <- as.data.frame(tab_des)
table2excel(tab_des, file = "output/Table_1890.xlsx")
