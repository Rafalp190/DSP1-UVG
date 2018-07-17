require("foreign")

#Conversion of the .sav file of deceseased of 2009 to .csv
f09 <- read.spss("./Datos_brutos/09F.sav")
f09csv <- data.frame(f09)
write.csv(f09csv, file = "./Data/09F.csv")

#Conversion of the .sav file of deceseased and injured of 2010 to .csv
fl10 <- read.spss("./Datos_brutos/10FL.sav")
fl10csv <- data.frame(fl10)
write.csv(fl10csv, file = "./Data/10FL.csv")

#Conversion of the .sav file of deceseased and injured of 2011 to .csv
fl11 <- read.spss("./Datos_brutos/11FL.sav")
fl11csv <- data.frame(fl11)
write.csv(fl11csv, file = "./Data/11FL.csv")

#Conversion of the .sav file of deceseased and injured of 2012 to .csv
fl12 <- read.spss("./Datos_brutos/12FL.sav")
fl12csv <- data.frame(fl12)
write.csv(fl12csv, file = "./Data/12FL.csv")

#Conversion of the .sav file of deceseased and injured of 2013 to .csv
fl13 <- read.spss("./Datos_brutos/13FL.sav")
fl13csv <- data.frame(fl13)
write.csv(fl11csv, file = "./Data/13FL.csv")

#Conversion of the .sav file of deceseased and injured of 2014 to .csv
fl14 <- read.spss("./Datos_brutos/14FL.sav")
fl14csv <- data.frame(fl14)
write.csv(fl11csv, file = "./Data/14FL.csv")

#Conversion of the .sav file of transit facts of 2009 to .csv
ht09 <- read.spss("./Datos_brutos/09HT.sav")
ht09csv <- data.frame(ht09)
write.csv(ht09csv, file = "./Data/09HT.csv")

#Conversion of the .sav file of transit facts of 2010 to .csv
ht10 <- read.spss("./Datos_brutos/10HT.sav")
ht10csv <- data.frame(ht10)
write.csv(ht10csv, file = "./Data/10HT.csv")

#Conversion of the .sav file of transit facts of 2011 to .csv
ht11 <- read.spss("./Datos_brutos/11HT.sav")
ht11csv <- data.frame(ht11)
write.csv(ht11csv, file = "./Data/11HT.csv")

#Conversion of the .sav file of transit facts of 2012 to .csv
ht12 <- read.spss("./Datos_brutos/12HT.sav")
ht12csv <- data.frame(ht12)
write.csv(ht12csv, file = "./Data/12HT.csv")

#Conversion of the .sav file of transit facts of 2013 to .csv
ht13 <- read.spss("./Datos_brutos/13HT.sav")
ht13csv <- data.frame(ht13)
write.csv(ht13csv, file = "./Data/13HT.csv")

#Conversion of the .sav file of transit facts of 2014 to .csv
ht14 <- read.spss("./Datos_brutos/14HT.sav")
ht14csv <- data.frame(ht14)
write.csv(ht14csv, file = "./Data/14HT.csv")

#Conversion of the .sav file of injured of 2009 to .csv
l09 <- read.spss("./Datos_brutos/09L.sav")
l09csv <- data.frame(ht10)
write.csv(l09csv, file = "./Data/09L.csv")

#Conversion of the .sav file of involved vehicles of 2010 to .csv
vi10 <- read.spss("./Datos_brutos/10VI.sav")
vi10csv <- data.frame(vi10)
write.csv(vi10csv, file = "./Data/10VI.csv")

#Conversion of the .sav file of involved vehicles of 2012 to .csv
vi12 <- read.spss("./Datos_brutos/12VI.sav")
vi12csv <- data.frame(vi12)
write.csv(vi12csv, file = "./Data/12VI.csv")

#Conversion of the .sav file of involved vehicles of 2013 to .csv
vi13 <- read.spss("./Datos_brutos/13VI.sav")
vi13csv <- data.frame(vi13)
write.csv(vi13csv, file = "./Data/13VI.csv")

#Conversion of the .sav file of involved vehicles of 2014 to .csv
vi14 <- read.spss("./Datos_brutos/14VI.sav")
vi14csv <- data.frame(vi14)
write.csv(vi14csv, file = "./Data/14VI.csv")
