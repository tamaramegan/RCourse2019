#########################
###   T-S DIAGRAM   ####
#########################
#MALIKA/TAMARA

#### 1. Load data  ####
#install.packages("plot3D")
library(plot3D) #package for 3D plot

#### 2. Load data  ####
#rm(list=ls())  #Remove all the objects from your environment
#setwd() ## set working directory to the folder where your files are

load("Temp_data.RData")
load("Sal_data.RData")
load("Dens_data.RData")
load("Oxy_data.RData")

str(Temp_data) #matrix temperature
str(Sal_data)  #matrix salinity
str(Dens_data) #matrix density
str(Oxy_data)  #matrix oxygen

Temp <- Temp_data
Sal <- Sal_data
Dens <- Dens_data
Oxy <- Oxy_data

#### 3. Function to calculate density according to temperature and salinity
#Based on data from Millero et al (1976) and Poisoon et al. (1980) density was determined with a precision about 3 ppm. The two data set combined produced an internationally
#accepted atmosphere equation of state of seawater (Millero and Poisson, 1981). A,B,C are functions of temperature to combine with salinity (S) in the equation state.


density <- function(T, S){

A <-  8.24493e-1 - 4.0899e-3 * T + 7.6438e-5*T^2-8.2467e-7*T^3+ 5.3875e-9*T^4
B <- -5.72466e-3 + 1.0227e-4*T-1.6546e-6*T^2
C <-  4.8314e-4

#To calculate the absolute densities Bigg (1967):

water_density= 999.842594+ 6.793952e-2*T-9.095290e-3*T^2+1.001685e-4*T^3-1.120083e-6*T^4+ 6.536332e-9*T^5

#equation state of sea water
sea_water_density= (water_density+ A*S + B*(S^1.5)+C*(S^2))-1000

return(sea_water_density)
}

### 4. Create a matrix of density values for each combination of temperture and salinity
S.seq  <- seq(from = 35, to = 42, length.out = 100)   #sequence of 100 salinity from 35 to 42
T.seq  <- seq(from = 16, to = 34, length.out = 100)   #sequence of 100 temperature from 16 to 34
sig.mat <- t(outer(T.seq, S.seq, FUN = "density" ))   #Matrix of density data based on the S and T values using the density function
                                                      #outer() calculates the density for each combination of T.seq and S.seq


### 5. Plot T-S diagram ####

#Example 1. TS diagram with density bar 
#TS diagram with coloured density lines as contour with color bar for density values
contour2D(x = S.seq, y = T.seq, z = sig.mat, lwd = 1, xlab = "", ylab = "", main="T-S diagram",col.main=1, cex.main=1.5) 
#overlay Temperature-Salinity values in grey
scatter2D(Sal, Temp, colvar = Dens, pch = 1, cex = 0.8, add = TRUE, clim = range(sig.mat), colkey = FALSE,col="gray")   


#Example 2. TS diagram without density bar
#TS diagram with coloured density lines as contour and no color bar
contour2D(x = S.seq, y = T.seq, z = sig.mat, lwd = 1, xlab = "", ylab = "", main="T-S diagram",col.main=1, cex.main=1.5, colkey=F) 
#overlay Temperature-Salinity values in grey
scatter2D(Sal, Temp, colvar = Dens, pch = 1, cex = 0.8, add = TRUE, clim = range(sig.mat), colkey = FALSE,col="gray")   


#Example 3. TS diagram and density
#TS diagram with coloured density lines as contour 
contour2D(x = S.seq, y = T.seq, z = sig.mat, lwd = 1, xlab = "", ylab = "", main="T-S diagram",col.main=1, cex.main=1.5)
#overlay data of temp and salinity and overplot density in colour
scatter2D(Sal, Temp, colvar = Dens, pch = 1, cex = 0.8, add = TRUE, colkey = F, clim=range(sig.mat)) 


#Example 4. TS diagram and Oxygen bar on right
# make space in right margin for the legend
par(mar=c(3,3,3,7))
#Backgroung for the TS diagram  with black density lines as contour
contour2D(x = S.seq, y = T.seq, z = sig.mat, lwd = 1, xlab = "", ylab = "", main="T-S diagram",col.main=1, cex.main=1.5, colkey=F,col=1) 
#overplot oxygen data in colour
scatter2D(Sal, Temp, colvar = Oxy, pch = 1, cex = 0.8, add = TRUE, colkey = F, clim=c(30,220)) 
#add colour bar for oxygen data in right position and fancy label
colkey(side = 4, clim=c(30,220), add = TRUE, clab = expression(paste("Oxygen", " ", "(",mu*mol, " ", kg^-1,")")), line.clab = 3.25, side.clab = 4, font.clab = 4)  

#Example 5. TS diagram and Oxygen bar on top
par(mar=c(3,3,5,3))
contour2D(x = S.seq, y = T.seq, z = sig.mat, lwd = 1, xlab = "", ylab = "",col.main=1, cex.main=1.5, colkey=F,col=1) #backgroung for the TS diagram  with black density lines as contour
scatter2D(Sal, Temp, colvar = Oxy, pch = 1, cex = 0.8, add = TRUE, colkey = F, clim=c(30,220))#overplot oxygen data
colkey(side = 3, clim=c(30,220), add = TRUE, clab = expression(paste("Oxygen", " ", "(",mu*mol, " ", kg^-1,")")), line.clab = 2.8, side.clab = 3, font.clab = 4)   #add colour bar for oxygen data top position


