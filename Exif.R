#install.packages("exifr") 
#install.packages("dplyr")
#install.packages("shiny") # needed for leaflet installation
#install.packages("leaflet")
#install.packages("devtools")

#see https://www.r-bloggers.com/extracting-exif-data-from-photos-using-r/
library("exifr")
library("dplyr")
library("leaflet")
setwd("/Users/marcelfortin/Pictures/exiftest")
files <- list.files(pattern = "*.JPG")
files <- c(list.files(pattern = "*.JPG"), list.files(pattern = "*.JPEG"))
dat <- read_exif(files)
dat2 <- select(dat,SourceFile, DateTimeOriginal, GPSLongitude, GPSLatitude, GPSTimeStamp)
write.csv(dat2, 'Exifdata.csv', row.names = F)
plot(dat$GPSLongitude, dat$GPSLatitude) #to plot
leaflet(dat2) %>%
  addProviderTiles("Esri.WorldImagery") %>%
  addMarkers(~ GPSLongitude, ~ GPSLatitude) 

