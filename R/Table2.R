# Table A
data_cross_A  <- data_grippe %>%
  mutate(wave2.3 = wave_fall_winter + wave_1919,
         wave1_ill_wave2.3_ill = ifelse(wave_summer==1 & wave2.3>0, 1, 0),
         wave1_healthy_wave2.3_ill = ifelse(wave_summer==0 & wave2.3>0, 1, 0),
         wave1_ill_wave2.3_healthy = ifelse(wave_summer==1 & wave2.3==0, 1, 0),
         wave1_healthy_wave2.3_healthy = ifelse(wave_summer==0 & wave2.3==0, 1, 0))%>%
  summarise(tab1 =sum( wave1_ill_wave2.3_ill, na.rm=TRUE),
            tab2 =sum(wave1_healthy_wave2.3_ill,na.rm=TRUE),
            tab3 = sum(wave1_ill_wave2.3_healthy,na.rm=TRUE),
            tab4 = sum(wave1_healthy_wave2.3_healthy,na.rm=TRUE))


tabA <- matrix(c(data_cross_A[,1],data_cross_A[,2],data_cross_A[,3],data_cross_A[,4]), ncol = 2, dimnames =
              list(c("Wave1_ill", "Wave1_healthy"), c("Wave2_ill", "Wave2_healthy")))


RR_tabA <- (tabA[1]/( tabA[1]+tabA[3]))/(tabA[2]/(tabA[2]+tabA[4]))
Cl_tabA <- exp(log(RR_tabA)-1.96*sqrt(1/tabA[1]+1/tabA[2]-1/tabA[3]-1/tabA[4]))
Cu_tabA <- exp(log(RR_tabA)+1.96*sqrt(1/tabA[1]+1/tabA[2]-1/tabA[3]-1/tabA[4]))

Protection_A <- (1-RR_tabA)*100
Cl_protection_A <- (1-Cl_tabA)*100
Cu_protection_A <- (1-Cu_tabA)*100

# Table B
data_cross_B  <- data_grippe %>%
  filter(Age2 >= 30) %>%
  mutate(wave_total = wave_summer + wave_fall_winter + wave_1919,
         Grippe1890_ill_wavetotal_ill = ifelse(Grippe1890==1 & wave_total>0, 1, 0),
         Grippe1890_healthy_wavetotal_ill = ifelse(Grippe1890==0 & wave_total>0, 1, 0),
         Grippe1890_ill_wave_total_healthy = ifelse(Grippe1890==1 & wave_total==0, 1, 0),
         Grippe1890_healthy_wave_total_healthy = ifelse(Grippe1890==0 & wave_total==0, 1, 0))%>%
  summarise(tab1 =sum(Grippe1890_ill_wavetotal_ill, na.rm=TRUE),
            tab2 =sum(Grippe1890_healthy_wavetotal_ill,na.rm=TRUE),
            tab3 = sum(Grippe1890_ill_wave_total_healthy,na.rm=TRUE),
            tab4 = sum( Grippe1890_healthy_wave_total_healthy ,na.rm=TRUE))


tabB <- matrix(c(data_cross_B[,1],data_cross_B[,2],data_cross_B[,3],data_cross_B[,4]), ncol = 2, dimnames =
                 list(c("Grippe1890_ill", "Grippe1890_healthy"), c("Grippe1918_ill", "Grippe1918_healthy")))


RR_tabB <- (tabB[1]/( tabB[1]+tabB[3]))/(tabB[2]/(tabB[2]+tabB[4]))
Cl_tabB <- exp(log(RR_tabB)-1.96*sqrt(1/tabB[1]+1/tabB[2]-1/tabB[3]-1/tabB[4]))
Cu_tabB <- exp(log(RR_tabB)+1.96*sqrt(1/tabB[1]+1/tabB[2]-1/tabB[3]-1/tabB[4]))

Protection_B <- (1-RR_tabB)*100
Cl_protection_B <- (1-Cl_tabB)*100
Cu_protection_B <- (1-Cu_tabB)*100


# 

# Sensitivity
data_cross_B  <- data_grippe %>%
  filter(Age2 >= 40) %>%
  mutate(wave_total = wave_summer + wave_fall_winter + wave_1919,
         Grippe1890_ill_wavetotal_ill = ifelse(Grippe1890==1 & wave_total>0, 1, 0),
         Grippe1890_healthy_wavetotal_ill = ifelse(Grippe1890==0 & wave_total>0, 1, 0),
         Grippe1890_ill_wave_total_healthy = ifelse(Grippe1890==1 & wave_total==0, 1, 0),
         Grippe1890_healthy_wave_total_healthy = ifelse(Grippe1890==0 & wave_total==0, 1, 0))%>%
  summarise(tab1 =sum(Grippe1890_ill_wavetotal_ill, na.rm=TRUE),
            tab2 =sum(Grippe1890_healthy_wavetotal_ill,na.rm=TRUE),
            tab3 = sum(Grippe1890_ill_wave_total_healthy,na.rm=TRUE),
            tab4 = sum( Grippe1890_healthy_wave_total_healthy ,na.rm=TRUE))


tabB <- matrix(c(data_cross_B[,1],data_cross_B[,2],data_cross_B[,3],data_cross_B[,4]), ncol = 2, dimnames =
                 list(c("Grippe1890_ill", "Grippe1890_healthy"), c("Grippe1918_ill", "Grippe1918_healthy")))


RR_tabB <- (tabB[1]/( tabB[1]+tabB[3]))/(tabB[2]/(tabB[2]+tabB[4]))
Cl_tabB <- exp(log(RR_tabB)-1.96*sqrt(1/tabB[1]+1/tabB[2]-1/tabB[3]-1/tabB[4]))
Cu_tabB <- exp(log(RR_tabB)+1.96*sqrt(1/tabB[1]+1/tabB[2]-1/tabB[3]-1/tabB[4]))

Protection_B <- (1-RR_tabB)*100
Cl_protection_B <- (1-Cl_tabB)*100
Cu_protection_B <- (1-Cu_tabB)*100