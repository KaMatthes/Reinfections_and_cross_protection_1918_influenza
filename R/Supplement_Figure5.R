
data_maps <- read_sf("data_raw/Map_data_1918/districts.shp") %>%
  mutate(col_bezirk=ifelse(District=="Cossonay", "red","white"))
data_lake <- read_sf("data_raw/Map_data_1918/lakes.shp") 
data_border <- read_sf("data_raw/Map_data_1918/swissBOUNDARIES3D_1_2_TLM_LANDESGEBIET.shp") 


Supplement_Figure5 <- ggplot()+
  # geom_sf(data= data_border ,col="black", size=1) +
  geom_sf(data= data_maps , aes(fill= col_bezirk ),alpha=1,col="black", size=0.1) +
  geom_sf(data= data_lake ,fill="#a6bddb",alpha=1,col="black", size=0.1) +
 
  scale_fill_manual("",
                    values = c("red","#f0f0f0"),
                    labels=c("Cossonay", "other districts"))+
  ggtitle("Districts of Switzerland 1918")+
  theme_bw() +
  theme(
    panel.grid.major=element_blank(),
    axis.title=element_blank(),
    axis.line=element_blank(),
    axis.text=element_blank(),
    axis.ticks=element_blank(),
    # panel.border = element_blank(),
    legend.position = "bottom")

cowplot::save_plot("output/Supplement_Figure5.pdf", Supplement_Figure5,base_height=8,base_width=10)  
