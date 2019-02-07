x <- rnorm(900,0,2)
y <- rnorm(900,0,2)
z <- rep(1:9,100)
df <- data.frame(x=x,y=y,z=z)
df$z <- factor(df$z, labels=c("#0072B2",
                              "#009E73",
                              "#D55E00",
                              "#56B4E9",
                              "#CC79A7",
                              "#E69F00",
                              "#F0E422",
                              "#000000",
                              "#ffffff"))

library(ggplot2)
p <- ggplot(df, aes(x,y,colour=z))
p + geom_point(size=2) +
  scale_x_continuous(name="") +
  scale_y_continuous(name="") +
  scale_colour_manual(values=colorblind, name="") +
  theme(legend.position="bottom",
        axis.text=element_blank(),
        axis.title=element_blank(),
        axis.ticks=element_blank(),
        plot.background=element_rect(fill="gray80"),
        panel.background=element_rect(fill="gray80"),
        panel.grid.major=element_blank(),
        panel.grid.minor=element_blank(),
        legend.background=element_rect(fill="transparent"),
        legend.box.background=element_rect(fill="transparent"),
        legend.key=element_rect(fill="transparent", colour="transparent")) + 
  labs(caption="\uA9 Parker Analytics 2019") +
  ggsave("colorblind_burst.pdf", width=6, height=6)
