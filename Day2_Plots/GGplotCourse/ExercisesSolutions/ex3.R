data <- read.csv("EconomistData.csv", row.names = 1, header = T)

pc1 <- ggplot(data, aes(x = CPI, y = HDI, color = Region))+
  geom_point(shape = 19, size = 2)+
  geom_smooth(method = "lm",
              color = "black",
              formula = y ~ poly(x, 2),
              se = FALSE)+
  theme_bw()+
  labs(x = "Corruption Perceptions Index, 2011\n(10 = least corrup)",
       y = "Human Development Index, 2011\n(1 = best)")+
  theme(legend.position = "top", legend.direction = "horizontal")
pc1
ggsave("ex3.pdf", pc1)
