require("readxl")

# Script to convert XLS files to csv for standarization

## Deceased and Injured
fl17 <- read_excel("Datos_brutos/17FL.xlsx")
write.csv(fl17, "Data/17FL.csv", row.names = F)

fl16 <- read_excel("Datos_brutos/16FL.xlsx")
write.csv(fl16,"Data/16FL.csv", row.names = F)

fl15 <- read_excel("Datos_brutos/15FL.xlsx")
write.csv(fl15, "Data/15FL.csv", row.names = F)

## Involved Vehicles
vi17 <- read_excel("Datos_brutos/17VI.xlsx")
write.csv(vi17,"Data/17VI.csv", row.names = F)

vi16 <- read_excel("Datos_brutos/16VI.xlsx")
write.csv(vi16,"Data/16VI.csv", row.names = F)

vi15 <- read_excel("Datos_brutos/15VI.xlsx")
write.csv(vi15, "Data/15VI.csv", row.names = F)

## Transit Events
ht17 <- read_excel("Datos_brutos/17HT.xlsx")
write.csv(ht17, "Data/17HT.csv", row.names = F)

ht16 <- read_excel("Datos_brutos/16HT.xlsx")
write.csv(ht16, "Data/16HT.csv", row.names = F)

ht15 <- read_excel("Datos_brutos/15HT.xlsx")
write.csv(ht15, "Data/15HT.csv", row.names = F)
