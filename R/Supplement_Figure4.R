data_sex_dis <- data_grippe %>%
  mutate(tempx = 1)

Supplement_Figure4 <- ggplot(data=data_sex_dis,aes(x=tempx,y=Age2, fill = Sex)) +
  geom_split_violin() +
  stat_summary(fun = median,
               width = 0.25,
               position = position_dodge(width = .25),
               # aes(shape="median"), 
               colour = "black",
               geom = "crossbar",
               show.legend=FALSE) +
  # scale_shape_manual("", 
  #                    values=c()) +
  scale_fill_manual("Sex: ",values = c(16,15))  +
  ggtitle("Age distribution")+
  ylab("Age in years")+
  xlab("") +
  theme_bw() +
  theme(aspect.ratio = 1,
    axis.text.y = element_text(color="black",size=size_axis),
    axis.text.x=element_blank(),
    axis.ticks.x=element_blank(),
    axis.title=element_text(size=size_axis_title),
    legend.text=element_text(size=size_legend_text),
    legend.title =element_text(size=size_legend_text),
    plot.title = element_text(size=size_plot_title),
    legend.position = "bottom")


cowplot::save_plot("output/Supplement_Figure4.pdf", Supplement_Figure4,base_height=10,base_width=10)  
