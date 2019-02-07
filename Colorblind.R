# Color palette for the colorblind
# Source: http://jfly.iam.u-tokyo.ac.jp/html/manuals/pdf/color_blind.pdf
# Colors for inclusion

pa_blue <- "#0072B2"          # RGB{0,114,178}
pa_green <- "#009E73"         # RGB{0,158,115}
pa_orange <- "#D55E00"        # RGB{230,159,0}
pa_lightblue <- "#56B4E9"     # RGB{86,180,233}
pa_pink <- "#CC79A7"          # RGB{204,121,167}
pa_lightorange <- "#E69F00"   # RGB{230,159,0}
pa_yellow <- "#F0E422"        # RGB{240,228,66}
pa_black <- "#000000"         # RGB{0,0,0}
pa_white <- "#ffffff"         # RGB{255,255,255}

colorblind <- c(pa_blue,
                pa_green,
                pa_orange,
                pa_lightblue,
                pa_pink,
                pa_lightorange,
                pa_yellow,
                pa_black,
                pa_white)

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
