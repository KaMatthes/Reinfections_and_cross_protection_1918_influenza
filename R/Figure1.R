# Differnces Age groups 

data_mod <- data_grippe %>%
   mutate(Grippe=recode(Grippe,
                        "oui" = "1",
                        "non" = "0"),
          Grippe = as.numeric(Grippe),
          Wave2 = wave_fall_winter + wave_1919,
          Wave2 = ifelse(Wave2>0, 1,0),
          Severeness = recode(Severeness,
                              "1" = "0",
                              "2" = "1"),
          Severeness = as.numeric(Severeness),
          age_group=factor(age_group, levels=c(">=40","<40")),
          Sex=factor(Sex, levels=c("male","female")))

Mod_illness <- data.frame(summary(glm(Grippe ~age_group, data = data_mod, family="binomial"))$coefficients) %>%
    mutate(Est = exp(Estimate),
           CIl = exp(Estimate - 1.96*`Std..Error`),
           CIu = exp(Estimate + 1.96*`Std..Error`),
           Fac = row.names(.)) %>%
    add_row(Fac = "age_group>=40", Est =1, CIl=0, CIu=0) %>%
    filter(!Fac =="(Intercept)") %>%
    dplyr::select(Fac, Est, CIl,CIu) %>%
    mutate(Var="Illness")
  
Mod_wave1<- data.frame(summary(glm(wave_summer ~ age_group, data = data_mod, family="binomial"))$coefficients) %>%
    mutate(Est = exp(Estimate),
           CIl = exp(Estimate - 1.96*`Std..Error`),
           CIu = exp(Estimate + 1.96*`Std..Error`),
           Fac = row.names(.)) %>%
    add_row(Fac = "age_group>=40", Est =1, CIl=0, CIu=0) %>%
    filter(!Fac =="(Intercept)") %>%
    dplyr::select(Fac, Est, CIl,CIu) %>%
    mutate(Var="1st wave")
  
Mod_wave2 <- data.frame(summary(glm( Wave2 ~ age_group, data = data_mod, family="binomial"))$coefficients) %>%
  mutate(Est = exp(Estimate),
         CIl = exp(Estimate - 1.96*`Std..Error`),
         CIu = exp(Estimate + 1.96*`Std..Error`),
         Fac = row.names(.)) %>%
  add_row(Fac = "age_group>=40", Est =1, CIl=0, CIu=0) %>%
  filter(!Fac =="(Intercept)") %>%
  dplyr::select(Fac, Est, CIl,CIu) %>%
  mutate(Var="2nd wave")
  
Mod_severness <- data.frame(summary(glm(Severeness ~ age_group, data = data_mod, family="binomial"))$coefficients) %>%
  mutate(Est = exp(Estimate),
         CIl = exp(Estimate - 1.96*`Std..Error`),
         CIu = exp(Estimate + 1.96*`Std..Error`),
         Fac = row.names(.)) %>%
  add_row(Fac = "age_group>=40", Est =1, CIl=0, CIu=0) %>%
  filter(!Fac =="(Intercept)") %>%
  dplyr::select(Fac, Est, CIl,CIu) %>%
  mutate(Var="Severity")


data_age <- rbind(Mod_illness,Mod_wave1,Mod_wave2,Mod_severness) %>%
    mutate(Fac=factor(Fac, levels=c("age_group<40","age_group>=40")),
           Var=factor(Var, levels=c("Illness","1st wave", "2nd wave", "Severity")))
  
OR_plot_age <- ggplot( data_age, aes(x=forcats::fct_rev(Var),y=Est),position=pd) + 
    geom_hline(yintercept=1, colour="grey", lwd=lwdline) + 
    geom_pointrange(aes(ymin=CIl, ymax=CIu,col=Fac),lwd=lwd_size,position=pd,fatten=fatten_size)+
    # ylim(c(0,2.5))+
    labs(x="",y="OR") +
    # ggtitle("OR")+
    scale_color_manual(" ",
                       breaks=c("age_group>=40","age_group<40"),
                       labels=c("Age >=40 (Ref)","Age <40"),
                       values = c(mypalette7[3],mypalette7[2]))+
    theme_bw()+
    theme(aspect.ratio=1,
          strip.text = element_text(color="black",size= strip_text),
          axis.text=element_text(color="black",size= size_axis),
          axis.title=element_text(size= size_axis_title),
          plot.title = element_text(size=size_plot_title),
          legend.text=element_text(size=size_legend_text),
          legend.position = "bottom") +
    coord_flip() 
  

# Differnces Sex

Mod_illness_sex <- data.frame(summary(glm(Grippe ~Sex, data = data_mod, family="binomial"))$coefficients) %>%
  mutate(Est = exp(Estimate),
         CIl = exp(Estimate - 1.96*`Std..Error`),
         CIu = exp(Estimate + 1.96*`Std..Error`),
         Fac = row.names(.)) %>%
  add_row(Fac = "Sexmale", Est =1, CIl=0, CIu=0) %>%
  filter(!Fac =="(Intercept)") %>%
  dplyr::select(Fac, Est, CIl,CIu) %>%
  mutate(Var="Illness",
         Model="unadjusted")

Mod_wave1_sex<- data.frame(summary(glm(wave_summer  ~Sex, data = data_mod, family="binomial"))$coefficients) %>%
  mutate(Est = exp(Estimate),
         CIl = exp(Estimate - 1.96*`Std..Error`),
         CIu = exp(Estimate + 1.96*`Std..Error`),
         Fac = row.names(.)) %>%
  add_row(Fac = "Sexmale", Est =1, CIl=0, CIu=0) %>%
  filter(!Fac =="(Intercept)") %>%
  dplyr::select(Fac, Est, CIl,CIu) %>%
  mutate(Var="1st wave",
         Model="unadjusted")

Mod_wave2_sex <- data.frame(summary(glm(Wave2 ~Sex, data = data_mod, family="binomial"))$coefficients) %>%
  mutate(Est = exp(Estimate),
         CIl = exp(Estimate - 1.96*`Std..Error`),
         CIu = exp(Estimate + 1.96*`Std..Error`),
         Fac = row.names(.)) %>%
  add_row(Fac = "Sexmale", Est =1, CIl=0, CIu=0) %>%
  filter(!Fac =="(Intercept)") %>%
  dplyr::select(Fac, Est, CIl,CIu) %>%
  mutate(Var="2nd wave",
         Model="unadjusted")

Mod_severness_sex<- data.frame(summary(glm(Severeness ~Sex, data = data_mod, family="binomial"))$coefficients) %>%
  mutate(Est = exp(Estimate),
         CIl = exp(Estimate - 1.96*`Std..Error`),
         CIu = exp(Estimate + 1.96*`Std..Error`),
         Fac = row.names(.)) %>%
  add_row(Fac = "Sexmale", Est =1, CIl=0, CIu=0) %>%
  filter(!Fac =="(Intercept)") %>%
  dplyr::select(Fac, Est, CIl,CIu) %>%
  mutate(Var="Severity",
         Model="unadjusted")


Mod_illness_sex_ad <- data.frame(summary(glm(Grippe ~Sex + Age2, data = data_mod, family="binomial"))$coefficients) %>%
  mutate(Est = exp(Estimate),
         CIl = exp(Estimate - 1.96*`Std..Error`),
         CIu = exp(Estimate + 1.96*`Std..Error`),
         Fac = row.names(.)) %>%
  add_row(Fac = "Sexmale", Est =1, CIl=0, CIu=0) %>%
  filter(!Fac =="(Intercept)") %>%
  filter(!Fac =="Age2")%>%
  dplyr::select(Fac, Est, CIl,CIu) %>%
  mutate(Var="Illness",
         Model="adjusted")

Mod_wave1_sex_ad <- data.frame(summary(glm(wave_summer  ~Sex +Age2, data = data_mod, family="binomial"))$coefficients) %>%
  mutate(Est = exp(Estimate),
         CIl = exp(Estimate - 1.96*`Std..Error`),
         CIu = exp(Estimate + 1.96*`Std..Error`),
         Fac = row.names(.)) %>%
  add_row(Fac = "Sexmale", Est =1, CIl=0, CIu=0) %>%
  filter(!Fac =="(Intercept)") %>%
  filter(!Fac =="Age2")%>%
  dplyr::select(Fac, Est, CIl,CIu) %>%
  mutate(Var="1st wave",
         Model="adjusted")

Mod_wave2_sex_ad <- data.frame(summary(glm(Wave2 ~Sex + Age2, data = data_mod, family="binomial"))$coefficients) %>%
  mutate(Est = exp(Estimate),
         CIl = exp(Estimate - 1.96*`Std..Error`),
         CIu = exp(Estimate + 1.96*`Std..Error`),
         Fac = row.names(.)) %>%
  add_row(Fac = "Sexmale", Est =1, CIl=0, CIu=0) %>%
  filter(!Fac =="(Intercept)") %>%
  filter(!Fac =="Age2")%>%
  dplyr::select(Fac, Est, CIl,CIu) %>%
  mutate(Var="2nd wave",
         Model="adjusted")

Mod_severness_sex_ad <- data.frame(summary(glm(Severeness ~Sex + Age2, data = data_mod, family="binomial"))$coefficients) %>%
  mutate(Est = exp(Estimate),
         CIl = exp(Estimate - 1.96*`Std..Error`),
         CIu = exp(Estimate + 1.96*`Std..Error`),
         Fac = row.names(.)) %>%
  add_row(Fac = "Sexmale", Est =1, CIl=0, CIu=0) %>%
  filter(!Fac =="(Intercept)") %>%
  filter(!Fac =="Age2")%>%
  dplyr::select(Fac, Est, CIl,CIu) %>%
  mutate(Var="Severity",
         Model="adjusted")

data_sex <- rbind(Mod_illness_sex,Mod_wave1_sex,Mod_wave2_sex,Mod_severness_sex,
  Mod_illness_sex_ad,Mod_wave1_sex_ad,Mod_wave2_sex_ad,Mod_severness_sex_ad) %>%
  mutate(Fac=factor(Fac, levels=c("Sexmale","Sexfemale")),
         Var=factor(Var, levels=c("Illness","1st wave", "2nd wave", "Severity")),
         Model=factor(Model,levels=c("unadjusted","adjusted")))

OR_plot_sex <- ggplot( data_sex, aes(x=forcats::fct_rev(Var),y=Est),position=pd) + 
  geom_hline(yintercept=1, colour="grey", lwd=lwdline) + 
  geom_pointrange(aes(ymin=CIl, ymax=CIu,col=Fac),lwd=lwd_size,position=pd,fatten=fatten_size)+
  facet_grid(~Model) +
  # ylim(c(0,2.5))+
  labs(x="",y="OR") +
  # ggtitle("OR")+
  scale_color_manual(" ",
                     breaks=c("Sexmale","Sexfemale"),
                     labels=c("Male (Ref)","Female"),
                     values = c(mypalette7[3],mypalette7[2]))+
  theme_bw()+
  theme(aspect.ratio=1,
        strip.text = element_text(color="black",size= strip_text),
        axis.text=element_text(color="black",size= size_axis),
        axis.title=element_text(size= size_axis_title),
        plot.title = element_text(size=size_plot_title),
        legend.text=element_text(size=size_legend_text),
        legend.position = "bottom") +
  coord_flip() 

Figure1 <- plot_grid(OR_plot_age, OR_plot_sex, ncol=2,
                     rel_widths=c(0.8,1.3),
                      labels=c("A) Age", "B) Sex"),
                     label_size=25)

cowplot::save_plot("output/Figure1.pdf", Figure1,base_height=8,base_width=20)  
