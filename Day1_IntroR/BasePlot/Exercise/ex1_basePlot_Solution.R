library(RColorBrewer)
data <- read.csv("EconomistData.csv", row.names = 1, header = T)

pdf("ex1.pdf")
plot(data$CPI,
     data$HDI,
     col = data$Region,
     pch = 16,
     cex = 1.5,
     xlab = "Corruption Perceptions Index, 2011\n(10 = least corrup)", 
     ylab = "Human Development Index, 2011 (1 = best)"
)
legend("bottomright", inset = 0.03, title = "Regions", legend = levels(data$Region), col = c(1:6), pch = 16)
dev.off()
?legend
