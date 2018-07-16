require("readxl")

# Script to convert XLS files to csv for standarization

## Deceased and Injured
fl17 <- read_excel("./Datos_brutos/17FL.xslx")
write.csv("./Data/17FL.csv")

fl16 <- read_excel("Datos_brutos/16FL.xslx")
write.csv("Data/16FL.csv")

fl15 <- read_excel("Datos_brutos/15FL.xslx")
write.csv("Data/15FL.csv")

## Involved Vehicles
vi17 <- read_excel("Datos_brutos/17VI.xslx")
write.csv("Data/17VI.csv")

vi16 <- read_excel("Datos_brutos/16VI.xslx")
write.csv("Data/16VI.csv")

vi15 <- read_excel("Datos_brutos/15VI.xslx")
write.csv("Data/15VI.csv")

## Transit Events
ht17 <- read_excel("Datos_brutos/17HT.xslx")
write.csv("Data/17HT.csv")

ht16 <- read_excel("Datos_brutos/16HT.xslx")
write.csv("Data/16HT.csv")

ht15 <- read_excel("Datos_brutos/15HT.xslx")
write.csv("Data/15HT.csv")
