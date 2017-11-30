library(ggplot2)
library(extrafont)

loadfonts()

# ggplot2

mean <-50
sd <- 5

plotmin <- qnorm(0.0001,mean, sd)
plotmax <- qnorm(0.9999,mean, sd)

annotate_y_top    <-  0.6*dnorm(x=mean,mean, sd)
annotate_y_bottom <-  0.4*dnorm(x=mean,mean, sd)

arr_xend <- qnorm(0.985,mean, sd)
arr_xstart <- qnorm(0.998,mean, sd)
arr_yend <- 0.5*dnorm(arr_xend ,mean, sd)
arr_ystart <- 2*dnorm(arr_xend ,mean, sd)


x<-seq(plotmin,plotmax,length.out=1000)
ytop<-dnorm(qnorm(0.025, mean, sd))
MyDF<-data.frame(x=x,y=dnorm(x, mean, sd))

shade <- rbind(c(qnorm(0.025,mean, sd),0), subset(MyDF, x>qnorm(0.025,mean, sd)&x<qnorm(0.975,mean, sd) ), c(qnorm(0.975,mean, sd), 0))

#Then use this new data.frame with geom_polygon



exp_text <- "italic(y == frac(1, sigma*sqrt(2 * pi)) * e ^ {-frac((x-mu)^2, 2*sigma^2)} )"

my_family<-"DejaVu Serif"
my_family<-fonts()[13]


p <- ggplot(MyDF, aes(x=x, y=y)) + ggtitle("Normal Distribution") +
  geom_line() +
  theme_bw() +
  geom_polygon(data = shade, aes(x, y), alpha=0.4, fill="#0B486B") +
  theme(text=element_text(family=my_family),
        axis.text.y=element_blank(),
        axis.ticks.y=element_blank(),
        panel.grid.minor = element_blank(),
        panel.grid.major = element_blank(),
        panel.background = element_blank(),
        panel.border = element_blank(),
        axis.line = element_blank(),
        axis.text.x = element_text(size=22),
        axis.ticks = element_blank(),
        axis.title.y = element_blank(),
        axis.title.x = element_blank(),
        title = element_blank()
        ) + ylab("f(x)") +
#  annotate("text", x=mean, y=annotate_y_top, label=exp_text, parse=TRUE, family=my_family, color="white") +
  annotate("segment",
           xend=arr_xend, yend=arr_yend, x=arr_xstart, y=arr_ystart,
           arrow = arrow(length = unit(0.3, "cm")), size=0.2) +
  annotate("text", x=mean, y=annotate_y_bottom, label=c("95%"), size=22,family=my_family, color="white") +
  annotate("text", x=arr_xstart*1.005, y=arr_ystart*1.02, label=c("2.5%"), size=8,family=my_family, vjust=0, hjust=0,  color="black")
p


ggsave("prettynorm.pdf",p, family=my_family)
