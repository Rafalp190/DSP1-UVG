
#   _    _ _______ 
#  | |  | |__   __|
#  | |__| |  | |   
#  |  __  |  | |   
#  | |  | |  | |   
#  |_|  |_|  |_|   
  
# Load Packages
require("dplyr")

## Read all HT dataframes by year
ht09 <- read.csv("Data/09HT.csv")
ht10 <- read.csv("Data/10HT.csv")
ht11 <- read.csv("Data/11HT.csv")
ht12 <- read.csv("Data/12HT.csv")
ht13 <- read.csv("Data/13HT.csv")
ht14 <- read.csv("Data/14HT.csv")
ht15 <- read.csv("Data/15HT.csv")
ht16 <- read.csv("Data/16HT.csv")
ht17 <- read.csv("Data/17HT.csv")

## Determine ColNames to use for Joins
colnames(ht09)
colnames(ht10)
ht09$num_hecho <- NULL

oldNamesHT09 <- colnames(ht09)
newNamesHT09 <- c(oldNamesHT09[1],oldNamesHT09[2], "ano_ocu", oldNamesHT09[4], oldNamesHT09[5], oldNamesHT09[6], oldNamesHT09[7], oldNamesHT09[8], oldNamesHT09[9],
                 "grupo_eda_pil", oldNamesHT09[11], "tipo_veh", "color_veh", "modelo_veh", "causa_acc")

ht09 <- ht09 %>% rename_at(vars(oldNamesHT09), ~ newNamesHT09)

oldNamesHT10 <- colnames(ht10)
newNamesHT10 <- c(oldNamesHT10[1], oldNamesHT10[2], oldNamesHT10[3], oldNamesHT10[4], oldNamesHT10[5], oldNamesHT10[6], oldNamesHT10[7],
                  oldNamesHT10[8], oldNamesHT10[9], oldNamesHT10[10], "tipo_veh", "color_veh", "modelo_veh", "causa_acc")
ht10 <- ht10 %>% rename_at(vars(oldNamesHT10), ~ newNamesHT10)

ht09$dia_sem_ocu <- as.factor(ht09$dia_sem_ocu)
ht10$dia_sem_ocu <- as.factor(ht10$dia_sem_ocu)
ht09$hora_ocu <- as.character(ht09$hora_ocu)
ht10$hora_ocu <- as.character(ht10$hora_ocu)
ht09$edad_pil <- as.numeric(ht09$edad_pil)
ht10$edad_pil <- as.numeric(ht10$edad_pil)
ht10$depto_ocu <- as.character(ht10$depto_ocu)
ht09$depto_ocu <- as.character(ht09$depto_ocu)
ht10$areag_ocu <- as.numeric(ht10$areag_ocu)
ht09$areag_ocu <- as.numeric(ht09$areag_ocu)



ht <- full_join(ht09,ht10)

oldNamesHT11 <- colnames()
