install.packages("mapdata")
install.packages("viridis")
library(mapdata)
library(viridis) #for coloring

#the tree
rhinotreephylotomap = read.tree(file = "rhinobeast_treeFINAL.NEWICK")
plot(rhinotreephylotomap)
axisPhylo()
rhinotreephylotomap$tip.label
rhinotreephylotomap

#the geog.file
rhinoallgeog = read.csv("beastgeog.csv", row.names = 1)
rhinoallgeog = as.matrix(rhinoallgeog)


##cut the region to Asia
map('worldHires',
  region=c('china', 'bhutan', 'nepal', 'bangladesh', 'india', 'myanmar','thailand',
    'laos','cambodia','vietnam',
    'malaysia','singapore',
    'indonesia','brunei',
    'philippines'))

countries = c('bhutan', 'china','nepal', 'bangladesh', 'india', 'myanmar','thailand',
    'laos','cambodia','vietnam',
    'malaysia','singapore',
    'indonesia','brunei',
    'philippines')
#len = length(countries)
#colors = rainbow(len + 1)
map('worldHires',
  region=countries,
  fill=TRUE,col=colors)
map.scale(120,26,
  relwidth=0.25,cex=0.6,
  metric=TRUE,ratio=TRUE)


rhinotreemap = phylo.to.map(rhinotreephylotomap, rhinoallgeog, database = map('worldHires',
  region=countries, fill=TRUE,col=colors), 
map.scale(120,26,
  relwidth=0.25,cex=0.6,
  metric=TRUE,ratio=TRUE))
rhinotreemap

#####first pdf, the default version lol
pdf(file="phylo.to.map-RhinoBEAST.pdf",width=8,height=10)
cols<-setNames(sample(viridis(n=Ntip(rhinotreephylotomap))),rhinotreephylotomap$tip.label) #uncommand this for colorful lines
plot(rhinotreemap,split=c(0.4,0.5),ftype="i", #split buat ngatur2 posisi, change the value and figure the best visualization according to you tree size
    colors=cols, fsize = 0.8, cex.points=c(0,1.5),
    pts=FALSE)
tiplabels(pch=19,col="blue")
points(rhinotreemap$coords[,2:1],col=cols, pch=19)

#plot(obj,colors=cols,ftype="i",fsize=0.6,cex.points=c(0.7,1.2))
dev.off()


###plot new with difference direction
pdf(file="phylo.to.map-RhinoBEAST-sidetoside.pdf",width=15,height=10)
cols<-setNames(sample(rainbow(n=Ntip(rhinotreephylotomap))),rhinotreephylotomap$tip.label) #uncommand this for colorful lines
plot(rhinotreemap, direction = "rightwards", split=c(0.45,0.6),ftype="i",
    colors = cols, fsize = 0.8, cex.points=c(0,1.5),
    pts=FALSE)
tiplabels(pch=19,col="blue", cex.points=c(0.5,1.5))
points(rhinotreemap$coords[,2:1],col="blue", pch=19)

#plot(obj,colors=cols,ftype="i",fsize=0.6,cex.points=c(0.7,1.2))
dev.off()


###plot new with BLACK AND WHITE
pdf(file="phylo.to.map-RhinoBEAST-sidetoside-BW.pdf",width=15,height=10)
#cols<-setNames(sample(rainbow(n=Ntip(rhinotreephylotomap))),rhinotreephylotomap$tip.label) #uncommand this for colorful lines
plot(rhinotreemap, direction = "rightwards", split=c(0.45,0.6),ftype="i",
    colors = "red", fsize = 0.8, cex.points=c(0,1.5),
    pts=FALSE)
tiplabels(pch=19,col="blue", cex.points=c(0.5,1.5))
points(rhinotreemap$coords[,2:1],col="blue", pch=19)

#plot(obj,colors=cols,ftype="i",fsize=0.6,cex.points=c(0.7,1.2))
dev.off()



##DONE HERE
