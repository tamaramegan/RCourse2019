############################

#####     LABELS      ###### 

############################

#superindex: ^
lab1 <- expression(paste("cells ",ml^-1))
plot(x=1:10,y=1:10, type='n',xlab=lab1) 

#subindex: []
lab2 <- expression(paste(log[10]," Abundance"))
plot(x=1:10,y=1:10, type='n',xlab=lab2) 

#greek leters (mu , pi)
lab3 <- expression(paste("diameter ",mu,"m"))
plot(x=1:10,y=1:10, type='n',xlab=lab3) 

#degree C
lab4 <- expression(paste("Temperature ",degree*C)) ## no space 
lab5 <- expression(paste("Temperature ",degree~C)) ## space
plot(x=1:10,y=1:10, type='n',xlab=lab4, ylab=lab5) 

#italics
lab6 <- expression(italic("Synechococcus"))
plot(x=1:10,y=1:10, type='n',xlab=lab6) 

#bold
lab7 <- expression(bold ("nmol"))
plot(x=1:10,y=1:10, type='n',xlab=lab7) 



