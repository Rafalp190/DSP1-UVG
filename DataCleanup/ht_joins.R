
#   _    _ _______ 
#  | |  | |__   __|
#  | |__| |  | |   
#  |  __  |  | |   
#  | |  | |  | |   
#  |_|  |_|  |_|   
  
# Load Packages
require("plyr")
require("dplyr")


## Read all HT dataframes by year
ht09 <- read.csv("https://raw.githubusercontent.com/Rafalp190/DSP1-UVG/master/DataCleanup/Data/09HT.csv")
ht10 <- read.csv("https://raw.githubusercontent.com/Rafalp190/DSP1-UVG/master/DataCleanup/Data/10HT.csv")
ht11 <- read.csv("https://raw.githubusercontent.com/Rafalp190/DSP1-UVG/master/DataCleanup/Data/11HT.csv")
ht12 <- read.csv("https://raw.githubusercontent.com/Rafalp190/DSP1-UVG/master/DataCleanup/Data/12HT.csv")
ht13 <- read.csv("https://raw.githubusercontent.com/Rafalp190/DSP1-UVG/master/DataCleanup/Data/13HT.csv")
ht14 <- read.csv("https://raw.githubusercontent.com/Rafalp190/DSP1-UVG/master/DataCleanup/Data/14HT.csv")
ht15 <- read.csv("https://raw.githubusercontent.com/Rafalp190/DSP1-UVG/master/DataCleanup/Data/15HT.csv")
ht16 <- read.csv("https://raw.githubusercontent.com/Rafalp190/DSP1-UVG/master/DataCleanup/Data/16HT.csv")
ht17 <- read.csv("https://raw.githubusercontent.com/Rafalp190/DSP1-UVG/master/DataCleanup/Data/17HT.csv")

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


## Join between HT09 and HT10
ht09$ano_ocu <- 2009
ht10$ano_ocu <- 2010
ht <- full_join(ht09,ht10)
rm(ht09)
rm(ht10)

ht11$num_hecho <- NULL

oldNamesHT11 <- colnames(ht11)
newNamesHT11 <- c(oldNamesHT11[1], oldNamesHT11[2], oldNamesHT11[3], oldNamesHT11[4], oldNamesHT11[5], oldNamesHT11[6], oldNamesHT11[7],
                  oldNamesHT11[8], oldNamesHT11[9], oldNamesHT11[10], "grupo_eda_pil", "mayor_men", oldNamesHT11[13],
                  "tipo_veh", "marca_veh", "color_veh", "modelo_veh", "causa_acc")
ht11 <- ht11 %>% rename_at(vars(oldNamesHT11), ~ newNamesHT11)



ht11$hora_ocu <- as.character(ht11$hora_ocu)
ht11$areag_ocu <- as.numeric(ht11$areag_ocu)
ht11$edad_pil <- as.numeric(ht11$edad_pil)
ht11$zona_ocu <- as.numeric(ht11$zona_ocu)

## Join between HT and HT11
ht11$ano_ocu <- 2011
ht <- full_join(ht, ht11)
rm(ht11)
ht12$num_hecho <- NULL

colnames(ht12) <- c("dia_ocu", "mes_ocu", "dia_sem_ocu", "hora_ocu", "depto_ocu", "muni_ocu", "areag_ocu", "zona_ocu", "sexo_pil", "edad_pil",
                    "grupo_eda_pil", "mayor_men", "estado_pil", "tipo_veh", "color_veh", "causa_acc")

ht12$hora_ocu <- as.character(ht12$hora_ocu)
ht12$areag_ocu <- as.numeric(ht12$areag_ocu)
ht12$edad_pil <- as.numeric(ht12$edad_pil)
ht12$zona_ocu <- as.numeric(ht12$zona_ocu)
ht12$muni_ocu <- as.numeric(ht12$muni_ocu)

## Join between HT and HT12
ht12$ano_ocu <- 2012
ht <- full_join(ht, ht12)
rm(ht12)
ht13$num_hecho <- NULL

colnames(ht13) <- c("dia_ocu", "mes_ocu", "dia_sem_ocu", "hora_ocu","g_hora", "depto_ocu", "muni_ocu", "areag_ocu", "zona_ocu", "sexo_pil", "edad_pil",
                    "grupo_eda_pil", "mayor_men", "tipo_veh", "color_veh","modelo_veh", "causa_acc", "marca_veh", "estado_pil")

ht13$hora_ocu <- as.character(ht13$hora_ocu)
ht13$areag_ocu <- as.numeric(ht13$areag_ocu)
ht13$edad_pil <- as.numeric(ht13$edad_pil)
ht13$zona_ocu <- as.numeric(ht13$zona_ocu)
ht13$muni_ocu <- as.numeric(ht13$muni_ocu)


## Join between HT and HT13
ht13$ano_ocu <- 2013
ht <- full_join(ht, ht13)
rm(ht13)

ht14$num_correlativo <- NULL
ht14$corre_base <- NULL

colnames(ht14) <- c("dia_ocu", "dia_sem_ocu", "hora_ocu","g_hora","mes_ocu", "depto_ocu", "muni_ocu", "zona_ocu","areag_ocu", "sexo_pil", "edad_pil",
                    "grupo_eda_pil", "mayor_men","estado_pil", "tipo_veh", "modelo_veh", "color_veh", "marca_veh", "causa_acc")

ht14$hora_ocu <- as.character(ht14$hora_ocu)
ht14$areag_ocu <- as.numeric(ht14$areag_ocu)
ht14$edad_pil <- as.numeric(ht14$edad_pil)
ht14$zona_ocu <- as.numeric(ht14$zona_ocu)
ht14$muni_ocu <- as.numeric(ht14$muni_ocu)


## Join between HT and HT14
ht14$ano_ocu <- 2014
ht <- full_join(ht, ht14)
rm(ht14)


ht15$núm_corre <- NULL
ht15$g_edad_60ymás <- NULL
ht15$g_edad_80ymás <- NULL
ht15$g_hora_5 <- NULL
ht15$g_hora <- NULL
ht15$edad_quinquenales <- NULL
ht15$g_modelo_veh <- NULL


colnames(ht15) <- c("ano_ocu", "mes_ocu", "dia_ocu","dia_sem_ocu", "hora_ocu", "depto_ocu", "muni_ocu", "areag_ocu", "zona_ocu", "sexo_pil", "edad_pil",
                     "mayor_men","estado_pil", "tipo_veh", "marca_veh", "color_veh", "modelo_veh", "causa_acc")

ht15$hora_ocu <- as.character(ht15$hora_ocu)
ht15$areag_ocu <- as.numeric(ht15$areag_ocu)
ht15$edad_pil <- as.numeric(ht15$edad_pil)
ht15$zona_ocu <- as.numeric(ht15$zona_ocu)
ht15$muni_ocu <- as.numeric(ht15$muni_ocu)


# Desde el anio 2015 decidieron codificar las variables, consideramos que es más eficiente a nivel práctico codificar las variables de mes y dia de 
# la semana a variables numericas

# mes ocurrencia recodificacion
ht$mes_ocu <- mapvalues(ht$mes_ocu, from=c("Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Septiemre", "Octubre"
                           , "Noviembre", "Diciembre"), to=c(1,2,3,4,5,6,7,8,9,9,10,11,12))
ht$mes_ocu <- as.numeric(ht$mes_ocu)

# dia semana ocurrencia recodificacion
ht$dia_sem_ocu <- mapvalues(ht$dia_sem_ocu, from=c("Lunes", "Martes", "Miercoles", "Miércoles", "Jueves", "Viernes", "Sabado", "Sábado", "Domingo")
                             , to=c(1,2,3,3,4,5,6,6,7))
ht$dia_sem_ocu <- as.numeric(ht$dia_sem_ocu)

# Departamento recodificacion
ht15$depto_ocu <- mapvalues(ht15$depto_ocu, from=c(1:22), to=c("Guatemala","El progreso","Sacatepéquez","Chimaltenango","Escuintla","Santa rosa","Sololá","Totonicapán","Quetzaltenango","Suchitepéquez",
                                                               "Retalhuleu","San Marcos","Huehuetenango","Quiche","Baja Verapaz","Alta Verapaz","Peten","Izabal","Zacapa","Chiquimula","Jalapa",
                                                               "Jutiapa"))
# Sexo Piloto recodificacion
ht$sexo_pil <- mapvalues(ht$sexo_pil, from=c("Hombre", "Mujer", "Ignorado"), to=c(1,2,9))
ht$sexo_pil <- as.numeric(ht$sexo_pil)

# Estado Piloto recodificacion
ht$estado_pil <- mapvalues(ht$estado_pil, from=c("Bajo efectos de alcohol", "Ebrio", "Normal", "Ignorado"), to=c(2,2,1,9))
ht$estado_pil <- as.numeric(ht$estado_pil)

# Tipo Vehiculo recodificacion

tipovehLabels <- as.vector(as.data.frame(table(as.factor(ht$tipo_veh)))$Var1)
ht$tipo_veh <- mapvalues(ht$tipo_veh, from=tipovehLabels, to=c(1,1,18,17,7,12,6,5,5,2,2,15,15,16,99,8,9,14,4,14,11,3,3,10,13))
ht$tipo_veh <- as.numeric(ht$tipo_veh)

#Color vehiculo recodificacion (se queda como character)
ht15$color_veh <-  mapvalues(ht15$color_veh, 
                         from=c(1:17,99), to=c("Rojo", "Blanco","Azul", "Gris", "Negro", "Verde", "Amarillo",
                                               "Celeste", "Corinto", "Café", "Beige", "Turquesa", "Marfil", "Anaranjado"
                                               , "Aqua", "Morado", "Rosado", "Ignorado"))

# Modelo Vehiculo recodificacion
ht15$modelo_veh <- mapvalues(ht15$modelo_veh, from=9999, to="Ignorado")

# Causa acc recodificacion

causaAccLabels <- as.vector(as.data.frame(table(as.factor(ht$causa_acc)))$Var1)
ht$causa_acc <- mapvalues(ht$causa_acc, 
                          from=causaAccLabels, to=c("Atropello", "Atropello", "Caída", "Caída", "Choque", "Colisión", "Colisión", "Catástrofe"
                                                    , "Empotro", "Ignorado", "Vuelco", "Vuelco"))
ht15$causa_acc <- mapvalues(ht15$causa_acc, 
                            from=c(1:12,99), to=c("Colisión", "Choque", "Vuelco", "Caída","Atropello", "Perdida de control", "Colisión contra animal",
                                                  "Exceso de pasaje", "Asfalto mojado", "Exceso de velocidad", "Desperfectos mecánicos", "Incendio", "Ignorado"))

# Mayor menor recodificacion
ht$mayor_men <- mapvalues(ht$mayor_men, from=c("Mayor", "Menor", "Ignorado"), to=c(1,2,9))
ht$mayor_men <- as.numeric(ht$mayor_men)
ht15$marca_veh <- mapvalues(ht15$marca_veh, from=99, to="Ignorado")

## Join between HT and HT15
ht$g_hora <- NULL
ht <- full_join(ht, ht15)

rm(ht15)


ht16$núm_corre <- NULL
ht16$g_hora <- NULL
ht16$g_hora_5 <- NULL
ht16$g_modelo_veh <- NULL

colnames(ht16) <- c("dia_ocu", "ano_ocu", "hora_ocu", "mes_ocu", "dia_sem_ocu", "muni_ocu", "depto_ocu", "areag_ocu", "zona_ocu", "tipo_veh",
                    "marca_veh", "color_veh", "modelo_veh", "causa_acc")

ht16$hora_ocu <- as.character(ht16$hora_ocu)
ht16$areag_ocu <- as.numeric(ht16$areag_ocu)
ht16$zona_ocu <- as.numeric(ht16$zona_ocu)
ht16$muni_ocu <- as.numeric(ht16$muni_ocu)
ht16$depto_ocu <- mapvalues(ht16$depto_ocu, from=c(1:22), to=c("Guatemala","El progreso","Sacatepéquez","Chimaltenango","Escuintla","Santa rosa","Sololá","Totonicapán","Quetzaltenango","Suchitepéquez",
                                                               "Retalhuleu","San Marcos","Huehuetenango","Quiche","Baja Verapaz","Alta Verapaz","Peten","Izabal","Zacapa","Chiquimula","Jalapa",
                                                               "Jutiapa"))
ht16$color_veh <-  mapvalues(ht16$color_veh, 
                             from=c(1:17,99), to=c("Rojo", "Blanco","Azul", "Gris", "Negro", "Verde", "Amarillo",
                                                   "Celeste", "Corinto", "Café", "Beige", "Turquesa", "Marfil", "Anaranjado"
                                                   , "Aqua", "Morado", "Rosado", "Ignorado"))
ht16$modelo_veh <- mapvalues(ht16$modelo_veh, from=9999, to="Ignorado")
ht16$causa_acc <- mapvalues(ht16$causa_acc, 
                            from=c(1:12,99), to=c("Colisión", "Choque", "Vuelco", "Caída","Atropello", "Perdida de control", "Colisión contra animal",
                                                  "Exceso de pasaje", "Asfalto mojado", "Exceso de velocidad", "Desperfectos mecánicos", "Incendio", "Ignorado"))
ht16$marca_veh <- mapvalues(ht16$marca_veh, from=999, to="Ignorado")



## Join between HT and HT16
ht <- full_join(ht,ht16)
rm(ht16)

ht17$núm_corre <- NULL
ht17$g_hora <- NULL
ht17$g_hora_5 <- NULL
ht17$g_modelo_veh <- NULL

colnames(ht17) <- c("ano_ocu", "dia_ocu", "hora_ocu", "mes_ocu", "dia_sem_ocu", "muni_ocu", "depto_ocu", "zona_ocu", "tipo_veh", "marca_veh"
                    ,"color_veh", "modelo_veh", "causa_acc")


ht17$hora_ocu <- as.character(ht17$hora_ocu)
ht17$zona_ocu <- as.numeric(ht17$zona_ocu)
ht17$muni_ocu <- as.numeric(ht17$muni_ocu)
ht17$depto_ocu <- mapvalues(ht17$depto_ocu, from=c(1:22), to=c("Guatemala","El progreso","Sacatepéquez","Chimaltenango","Escuintla","Santa rosa","Sololá","Totonicapán","Quetzaltenango","Suchitepéquez",
                                                               "Retalhuleu","San Marcos","Huehuetenango","Quiche","Baja Verapaz","Alta Verapaz","Peten","Izabal","Zacapa","Chiquimula","Jalapa",
                                                               "Jutiapa"))
ht17$color_veh <-  mapvalues(ht17$color_veh, 
                             from=c(1:17,99), to=c("Rojo", "Blanco","Azul", "Gris", "Negro", "Verde", "Amarillo",
                                                   "Celeste", "Corinto", "Café", "Beige", "Turquesa", "Marfil", "Anaranjado"
                                                   , "Aqua", "Morado", "Rosado", "Ignorado"))
ht17$modelo_veh <- mapvalues(ht17$modelo_veh, from=9999, to="Ignorado")
ht17$causa_acc <- mapvalues(ht17$causa_acc, 
                            from=c(1:12,99), to=c("Colisión", "Choque", "Vuelco", "Caída","Atropello", "Perdida de control", "Colisión contra animal",
                                                  "Exceso de pasaje", "Asfalto mojado", "Exceso de velocidad", "Desperfectos mecánicos", "Incendio", "Ignorado"))
ht17$marca_veh <- mapvalues(ht17$marca_veh, from=999, to="Ignorado")


## Join between HT and HT17
ht <- full_join(ht, ht17)
rm(ht17)
ht$grupo_eda_pil <- NULL
write.csv(ht, "Results/ht09_17.csv", row.names = F)
