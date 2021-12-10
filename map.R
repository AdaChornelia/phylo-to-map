setwd("C:/Users/hp/OneDrive/2020 BACK UP PHD/1. IMPORTANT-CHAPTER2/03102021_PhyloSignal/16112021-phylotomap")
getwd()

library(mapdata)
library(mapplots)
library(data.table)
library(viridis)

piemap = read.csv("rex.csv")
head(piemap)

xyz = make.xyz(piemap$long, piemap$lat, piemap$value, piemap$Species)

pdf("rex-pie-on-map.pdf", width = 8, height = 5.5)
#par(mai = c(0.5, 0.5, 0.35, 0.2), omi = c(0.25, 0.5, 0, 0),
    #mgp = c(2.5, 0.5, 0), family = "arial")
basemap(xlim = c(73, 119), ylim = c(-4, 30), bg = "white")
map('world2Hires', region=c('china', 'bhutan', 'nepal', 'bangladesh', 'india', 'myanmar','thailand',
    'laos','cambodia','vietnam',
    'malaysia','singapore',
    'indonesia','brunei',
    'philippines'), add = TRUE)
draw.pie(xyz$x, xyz$y, xyz$z, radius = 1)
dev.off()
