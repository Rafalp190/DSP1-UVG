require("readxl")

# Script to convert XLS files to csv for standarization

## Deceased and Injured
fl17 <- read_excel("Datos_brutos/17FL.xlsx")
write.csv(fl17, "Data/17FL.csv")

fl16 <- read_excel("Datos_brutos/16FL.xlsx")
write.csv(fl16,"Data/16FL.csv")

fl15 <- read_excel("Datos_brutos/15FL.xlsx")
write.csv(fl15, "Data/15FL.csv")

## Involved Vehicles
vi17 <- read_excel("Datos_brutos/17VI.xlsx")
write.csv(vi17,"Data/17VI.csv")

vi16 <- read_excel("Datos_brutos/16VI.xlsx")
write.csv(vi16,"Data/16VI.csv")

vi15 <- read_excel("Datos_brutos/15VI.xlsx")
write.csv(vi15, "Data/15VI.csv")

## Transit Events
ht17 <- read_excel("Datos_brutos/17HT.xlsx")
write.csv(ht17, "Data/17HT.csv")

ht16 <- read_excel("Datos_brutos/16HT.xlsx")
write.csv(ht16, "Data/16HT.csv")

ht15 <- read_excel("Datos_brutos/15HT.xlsx")
write.csv(ht15, "Data/15HT.csv")
