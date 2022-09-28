data_grippe_age <- data_grippe %>%
  mutate(Sex= factor(Sex, levels = c("male", "female")))

data_grippe_yes <- data_grippe %>%
  filter(Grippe=="oui")

data_grippe_reinf <- data_grippe_yes %>%
  filter(Reinfection=="1")


data_grippe_wave1 <- data_grippe_yes %>%
  filter(wave_summer==1) 

data_grippe_wave2 <- data_grippe_yes %>%
  filter(wave_fall_winter>0) 

data_grippe_wave3 <- data_grippe_yes %>%
  filter(wave_1919==1) 

#  Age
tab_age <- tableby(Sex ~ Age2 + age_group25 + age_group, data=data_grippe_age)
summary(tab_age)
tab_des <- summary(tab_age,text=TRUE)
tab_des <- as.data.frame(tab_des)
table2excel(tab_des, file = "output/Table_age.xlsx")

t.test(Age2~Sex, data=data_grippe_age)

#  Grippe
tab_grippe <- tableby(Sex ~ age_group +Severeness+Reinfection, data=data_grippe_yes)
summary(tab_grippe)
tab_des <- summary(tab_grippe,text=TRUE)
tab_des <- as.data.frame(tab_des)
table2excel(tab_des, file = "output/Table_grippe.xlsx")

# test for proportions total
prop.test(x = 412, n = 820, p = 0.5)

# test for proportions male
prop.test(x = 288, n = 608, p = 0.5)

# test for proportions female
prop.test(x = 124, n = 212, p = 0.5)


# difference male vs female
tab_prop <- matrix(c(124,288,88,320), ncol = 2, dimnames =
                 list(c("Women", "Men"), c("ill", "healthy")))
prop.test(tab_prop)

# Difference Age groups
prop.test(x = 346, n = 412, p = 0.5)

# difference male vs female
tab_prop <- matrix(c(57,9, 231,115), ncol = 2, dimnames =
                     list(c("Men", "Women"), c(">=40", "<40")))
prop.test(tab_prop)


# difference severness
tab_prop <- matrix(c(166,72, 119,51), ncol = 2, dimnames =
                     list(c("Men", "Women"), c("severe", "mild")))
prop.test(tab_prop)


#  Reinfection
tab_reinf <- tableby(Sex ~ age_group +Reinfection_forte, data=data_grippe_reinf)
summary(tab_reinf)
tab_des <- summary(tab_reinf,text=TRUE)
tab_des <- as.data.frame(tab_des)
table2excel(tab_des, file = "output/Table_reinf.xlsx")


prop.test(x = 63, n = 412, p = 0.5)

# difference refinfections sex
tab_prop <- matrix(c(44,19, 244,105), ncol = 2, dimnames =
                     list(c("Men", "Women"), c("reinfected", "non")))
prop.test(tab_prop)
table(data_grippe_reinf$Times_grippe)


#  Reinfection severity sex
tab_prop <- matrix(c(36,14, 8,5), ncol = 2, dimnames =
                     list(c("Men", "Women"), c("severe", "non")))
prop.test(tab_prop)


# 1890 infected

tab_1890 <- tableby(Sex ~ Grippe1890, data=data_grippe)
summary(tab_1890)
tab_des <- summary(tab_1890 ,text=TRUE)
tab_des <- as.data.frame(tab_des)
table2excel(tab_des, file = "output/Table_1890.xlsx")


# Infections reported (incl. reinfections)

tab_rep_total <- tableby(Sex ~ Times_grippe, numeric.stats=c("sum"), data=data_grippe_yes)
summary(tab_time)
tab_des <- summary(tab_time ,text=TRUE)
tab_des <- as.data.frame(tab_des)
table2excel(tab_des, file = "output/Table_time.xlsx")


# Infections per wave
tab_wave <- tableby(Sex ~ Times_grippe+ wave_summer+reinf_summer+
                      wave_fall_winter+reinf_fall_winter+wave_1919+reinf_1919, 
                    numeric.stats=c("sum"), data=data_grippe_yes)
summary(tab_wave)
tab_des <- summary(tab_wave ,text=TRUE)
tab_des <- as.data.frame(tab_des)
table2excel(tab_des, file = "output/Table_waves.xlsx")

# Age per Wave

tab_wave1 <- tableby(Sex ~ age_group, data=data_grippe_wave1)
summary(tab_wave1)
tab_des <- summary(tab_wave1 ,text=TRUE)
tab_des <- as.data.frame(tab_des)
table2excel(tab_des, file = "output/Table_wave1.xlsx")

tab_wave2 <- tableby(Sex ~ age_group, data=data_grippe_wave2)
summary(tab_wave2)
tab_des <- summary(tab_wave2 ,text=TRUE)
tab_des <- as.data.frame(tab_des)
table2excel(tab_des, file = "output/Table_wave2.xlsx")

tab_wave3 <- tableby(Sex ~ age_group, data=data_grippe_wave3)
summary(tab_wave3)
tab_des <- summary(tab_wave3 ,text=TRUE)
tab_des <- as.data.frame(tab_des)
table2excel(tab_des, file = "output/Table_wave3.xlsx")


# difference wave 1 and 2
tab_prop <- matrix(c(151,69, 159,65), ncol = 2, dimnames =
                     list(c("Men", "Women"), c("wave 1", "Wave 2")))
prop.test(tab_prop)


# difference age and wave
tab_prop <- matrix(c(151,69, 159,65), ncol = 2, dimnames =
                     list(c("Men", "Women"), c("wave 1", "Wave 2")))
prop.test(tab_prop)
