
#   ____   _  
#  |  __| | |   
#  | |_   | |   
#  |  _|  | |   
#  | |    | |__   
#  |_|    |____|  

#Load packages
require(dplyr)
require(plyr)

## Read all FL dataframes by year
f09 <- read.csv("https://raw.githubusercontent.com/Rafalp190/DSP1-UVG/master/DataCleanup/Data/09F.csv")
l09 <- read.csv("https://raw.githubusercontent.com/Rafalp190/DSP1-UVG/master/DataCleanup/Data/09L.csv")
fl10 <- read.csv("https://raw.githubusercontent.com/Rafalp190/DSP1-UVG/master/DataCleanup/Data/10FL.csv")
fl11 <- read.csv("https://raw.githubusercontent.com/Rafalp190/DSP1-UVG/master/DataCleanup/Data/11FL.csv")
fl12 <- read.csv("https://raw.githubusercontent.com/Rafalp190/DSP1-UVG/master/DataCleanup/Data/12FL.csv")
fl13 <- read.csv("https://raw.githubusercontent.com/Rafalp190/DSP1-UVG/master/DataCleanup/Data/13FL.csv")
fl14 <- read.csv("https://raw.githubusercontent.com/Rafalp190/DSP1-UVG/master/DataCleanup/Data/14FL.csv")
fl15 <- read.csv("https://raw.githubusercontent.com/Rafalp190/DSP1-UVG/master/DataCleanup/Data/15FL.csv")
fl16 <- read.csv("https://raw.githubusercontent.com/Rafalp190/DSP1-UVG/master/DataCleanup/Data/16FL.csv")
fl17 <- read.csv("https://raw.githubusercontent.com/Rafalp190/DSP1-UVG/master/DataCleanup/Data/17FL.csv")

## Determine ColNames to use for Join of f09 and l09
oldnamesf09 <- colnames(f09)
oldnamesl09 <- colnames(l09)
newnamesf09 <- c(oldnamesf09[1], oldnamesf09[2], oldnamesf09[3], oldnamesf09[4], oldnamesf09[5], 
                 oldnamesf09[6], oldnamesf09[7], oldnamesf09[8], oldnamesl09[9], oldnamesf09[10],
                 oldnamesf09[11], "tipo_veh", "color_veh", "modelo_veh", oldnamesf09[15])
f09 <- f09 %>%
  rename_at(vars(oldnamesf09), ~ newnamesf09)

newnamesl09 <- c(oldnamesl09[1], oldnamesl09[2], oldnamesl09[3], oldnamesl09[4], oldnamesl09[5],
                 oldnamesl09[6], oldnamesl09[7], oldnamesl09[8], oldnamesl09[9], oldnamesl09[10],
                 newnamesf09[12], newnamesf09[13], newnamesf09[14], oldnamesf09[15])

l09 <- l09 %>%
  rename_at(vars(oldnamesl09), ~ newnamesl09)

f09 <- f09 %>%
  mutate(hora_ocu = as.integer(hora_ocu)) %>%
  mutate(edad_pil = as.integer(edad_pil)) %>%
  mutate(edad_m1 = NULL) %>%
  mutate(lesio_fall = "Fallecidos")

l09 <- l09 %>%
  mutate(lesio_fall = "Lesionados")

##Join between f09 and l09
fl09 <- full_join(f09, l09) %>%
  mutate(ano_ocu = 2009) %>%
  mutate(num_hecho = NULL)
rm(f09)
rm(l09)


##Determine colnames for joining fl09 and fl10
oldnamesfl10 <- colnames(fl10)
newnamesfl10 <- c(oldnamesfl10[1], oldnamesfl10[2], oldnamesfl10[3], oldnamesfl10[4], oldnamesfl10[5],
                  oldnamesfl10[6], oldnamesfl10[7], "sexo_pil", "edad_pil", oldnamesfl10[10], 
                  oldnamesfl10[11], "tipo_veh", "causa_acc")
fl10 <- fl10 %>%
  rename_at(vars(oldnamesfl10), ~ newnamesfl10) %>%
  mutate(num_hecho = NULL) %>%
  mutate(ano_ocu = 2010)

##Join between fl09 and fl10
fl <- full_join(fl10, fl09)
rm(fl09)
rm(fl10)

##Determine colnames for joining fl and fl11
namesfl <- colnames(fl)
oldnamesfl11 <- colnames(fl11)
newnamesfl11 <- c(oldnamesfl11[1], oldnamesfl11[2], oldnamesfl11[3], oldnamesfl11[4], oldnamesfl11[5],
                  oldnamesfl11[6], oldnamesfl11[7], oldnamesfl11[8], oldnamesfl11[9], oldnamesfl11[10],
                  oldnamesfl11[11], oldnamesfl11[12], oldnamesfl11[13], namesfl[11], namesfl[12],
                  "marca_veh", namesfl[15], namesfl[16], oldnamesfl11[19])
fl11 <- fl11 %>%
  rename_at(vars(oldnamesfl11), ~ newnamesfl11) %>%
  mutate(num_hecho = NULL) %>%
  mutate(zona_ocu = as.integer(zona_ocu)) %>%
  mutate(edad_pil = as.integer(edad_pil)) %>%
  mutate(edad_m1 = NULL) %>%
  mutate(ano_ocu = 2011)

##Join between fl and fl11
fl <- full_join(fl, fl11)
rm(fl11)


##Determine colnames for joining fl and fl12
namesfl <- colnames(fl)
oldnamesfl12 <- colnames(fl12)
newnamesfl12 <- c(oldnamesfl12[1], oldnamesfl12[2], oldnamesfl12[3], oldnamesfl12[4], oldnamesfl12[5],
                  oldnamesfl12[6], namesfl[18], oldnamesfl12[8], oldnamesfl12[9], namesfl[8], 
                  namesfl[9], oldnamesfl12[12], namesfl[10], namesfl[11], namesfl[12], namesfl[15],
                  namesfl[13])
fl12 <- fl12 %>%
  rename_at(vars(oldnamesfl12), ~ newnamesfl12) %>%
  mutate(num_hecho = NULL) %>%
  mutate(edad_m1 = NULL) %>%
  mutate(zona_ocu = as.integer(zona_ocu)) %>%
  mutate(edad_pil = as.integer(edad_pil)) %>%
  mutate(muni_ocu = as.integer(muni_ocu)) %>%
  mutate(ano_ocu = 2012)


##Join between fl and fl12
fl <- full_join(fl, fl12) %>%
  mutate(g_edad = NULL)
rm(fl12)

##Determine colnames for joining fl and fl13
namesfl <- colnames(fl)
oldnamesfl13 <- colnames(fl13)
newnamesfl13 <- c(oldnamesfl13[1], oldnamesfl13[2], oldnamesfl13[3], oldnamesfl13[4], oldnamesfl13[5],
                  oldnamesfl13[6], oldnamesfl13[7], oldnamesfl13[8], oldnamesfl13[9], oldnamesfl13[10],
                  oldnamesfl13[11], oldnamesfl13[12], oldnamesfl13[13], namesfl[10], namesfl[11], 
                  namesfl[18], namesfl[14], namesfl[15], oldnamesfl13[19])

fl13 <- fl13 %>%
  rename_at(vars(oldnamesfl13), ~ newnamesfl13) %>%
  mutate(num_hecho = NULL) %>%
  mutate(g_edad = NULL) %>%
  mutate(edad_m1 = NULL) %>%
  mutate(zona_ocu = as.integer(zona_ocu)) %>%
  mutate(edad_pil = as.integer(edad_pil)) %>%
  mutate(ano_ocu = 2013)

##Join between fl and fl13
fl <- full_join(fl, fl13)
rm(fl13)


##Determine colnames for joining fl and fl14
namesfl <- colnames(fl)
oldnamesfl14 <- colnames(fl14)
newnamesfl14 <- newnamesfl13

fl14 <- fl14 %>%
  rename_at(vars(oldnamesfl14), ~ newnamesfl14) %>%
  mutate(num_hecho = NULL) %>%
  mutate(zona_ocu = as.integer(zona_ocu)) %>%
  mutate(edad_pil = as.integer(edad_pil)) %>%
  mutate(edad_m1 = NULL) %>%
  mutate(ano_ocu = 2014)

##Join between fl and fl14
fl <- full_join(fl, fl14)
rm(fl14)

##Determine colnames for joining fl and fl15
namesfl <- colnames(fl)

fl15 <- fl15 %>%
  mutate(núm_corre = NULL) %>%
  mutate(g_hora = NULL) %>%
  mutate(g_hora_5 = NULL) %>%
  mutate(mayor_menor = NULL) %>%
  mutate(g_edad_80ymás = NULL) %>%
  mutate(g_edad_60ymás = NULL) %>%
  mutate(edad_quinquenales = NULL)

oldnamesfl15 <- colnames(fl15)
newnamesfl15 <- c(namesfl[13], oldnamesfl15[2], namesfl[1], namesfl[3], oldnamesfl15[5], 
                  oldnamesfl15[6], namesfl[17], namesfl[6], oldnamesfl15[9], namesfl[8],
                  namesfl[9], namesfl[10], oldnamesfl15[13], oldnamesfl15[14], oldnamesfl15[15],
                  oldnamesfl15[16], oldnamesfl15[17], oldnamesfl15[18], namesfl[12])


fl15 <- fl15 %>%
  rename_at(vars(oldnamesfl15), ~ newnamesfl15) %>%
  mutate(mes_ocu = as.integer(mes_ocu))

# Desde el anio 2015 decidieron codificar las variables, consideramos que es mÃ¡s eficiente a nivel prÃ¡ctico codificar las variables de mes y dia de 
# la semana a variables numericas

# Recodificaciones


fl <- fl %>%
   mutate(mes_ocu = as.numeric(mapvalues(mes_ocu, from=c("Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", 
                                             "Julio", "Agosto", "Septiembre", "Septiemre", "Octubre",
                                             "Noviembre", "Diciembre"),
                          to=c(1,2,3,4,5,6,7,8,9,9,10,11,12)))) %>%
  mutate(dia_sem_ocu = as.numeric(mapvalues(dia_sem_ocu, from=c("Lunes", "Martes", "Miercoles", "MiÃ©rcoles", 
                                                                "Jueves", "Viernes", "Sabado", "SÃ¡bado",
                                                                "Domingo"), to=c(1,2,3,3,4,5,6,6,7)))) %>%
  mutate(sexo_pil = as.numeric(mapvalues(sexo_pil, from=c("Hombre", "Mujer", "Ignorado"), to=c(1,2,9)))) %>%
  mutate(estado_pil = as.numeric(mapvalues(estado_pil, from=c("Bajo efectos de alcohol", "Ebrio", "Normal",
                                                              "Ignorado"), to=c(2,2,1,9)))) %>%
  mutate(tipo_veh = as.numeric(mapvalues(tipo_veh, from= as.vector(as.data.frame(table(as.factor(tipo_veh)))$Var1),
                              to=c(1, 17, 7, 12, 6, 5, 5, 2, 15, 16,
                                   99, 8, 9, 4, 14, 11, 3, 3, 10, 13)))) %>%
  mutate(causa_acc = mapvalues(causa_acc, from = as.vector(as.data.frame(table(as.factor(causa_acc)))$Var1), 
                               to = c("Atropello", "Caída","Caída","Choque", "Choque", "Colisión","Colisión",
                                      "Colisión", "Derrumbe", "Caída", "Empotro", "Derrumbe", "Ignorado", "Vuelco",
                                      "Vuelco","Vuelco"))) %>%
  mutate(areag_ocu = as.numeric(mapvalues(areag_ocu, from = c("Rural", "Urbano"), to = c(2, 1))))


fl15 <- fl15 %>%
  mutate(depto_ocu = mapvalues(depto_ocu, from=c(1:22), to=c("Guatemala","El progreso","SacatepÃ©quez","Chimaltenango","Escuintla","Santa rosa","SololÃ¡","TotonicapÃ¡n","Quetzaltenango","SuchitepÃ©quez",
                                                                        "Retalhuleu","San Marcos","Huehuetenango","Quiche","Baja Verapaz","Alta Verapaz","Peten","Izabal","Zacapa","Chiquimula","Jalapa",
                                                                        "Jutiapa"))) %>%
  mutate(color_veh = mapvalues(color_veh, from=c(1:17,99), to=c("Rojo", "Blanco","Azul", "Gris", "Negro", "Verde", "Amarillo",
                                                "Celeste", "Corinto", "CafÃ©", "Beige", "Turquesa", "Marfil", "Anaranjado"
                                                , "Aqua", "Morado", "Rosado", "Ignorado"))) %>%
  mutate(modelo_veh = mapvalues(modelo_veh, from = 9999, to = "Ignorado")) %>%
  mutate(marca_veh = mapvalues(marca_veh, from=99, to="Ignorado")) %>%
  mutate(mes_ocu = as.numeric(mapvalues(mes_ocu, from=c("Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", 
                                                        "Julio", "Agosto", "Septiembre", "Septiemre", "Octubre",
                                                        "Noviembre", "Diciembre"),
                                        to=c(1,2,3,4,5,6,7,8,9,9,10,11,12)))) %>%
  mutate(lesio_fall = mapvalues(lesio_fall, from = c(1,2), c("Fallecido", "Lesionado"))) %>%
  mutate(causa_acc = mapvalues(causa_acc, from = c(1, 2, 3, 4, 5), to = c("Colisión", "Choque", "Vuelco", "Caída", "Atropello")))


##Join between fl and fl15
fl <- full_join(fl, fl15)
rm(fl15)

##Determine colnames for joining fl and fl16
namesfl <- colnames(fl)

fl16 <- fl16 %>%
  mutate(núm_corre = NULL) %>%
  mutate(g_hora = NULL) %>%
  mutate(g_hora_5 = NULL) %>%
  mutate(mayor_menor = NULL) %>%
  mutate(g_edad_80ymás = NULL) %>%
  mutate(g_edad_60ymás = NULL) %>%
  mutate(edad_quinquenales = NULL)

oldnamesfl16 <- colnames(fl16)
newnamesfl16 <- c(namesfl[1], "ano_ocu", oldnamesfl16[3], oldnamesfl16[4], "dia_sem_ocu",
                  "muni_ocu", oldnamesfl16[7], "areag_ocu", oldnamesfl16[9], "sexo_pil",
                  "edad_pil", oldnamesfl16[12], oldnamesfl16[13], oldnamesfl16[14], oldnamesfl16[15],
                  "causa_acc", oldnamesfl16[17], "lesio_fall", oldnamesfl16[19])

fl16 <- fl16 %>%
  rename_at(vars(oldnamesfl16), ~ newnamesfl16) %>%
  mutate(depto_ocu = mapvalues(depto_ocu, from=c(1:22), to=c("Guatemala","El progreso","SacatepÃ©quez","Chimaltenango","Escuintla","Santa rosa","SololÃ¡","TotonicapÃ¡n","Quetzaltenango","SuchitepÃ©quez",
                                                             "Retalhuleu","San Marcos","Huehuetenango","Quiche","Baja Verapaz","Alta Verapaz","Peten","Izabal","Zacapa","Chiquimula","Jalapa",
                                                             "Jutiapa"))) %>%
  mutate(color_veh = mapvalues(color_veh, from=c(1:17,99), to=c("Rojo", "Blanco","Azul", "Gris", "Negro", "Verde", "Amarillo",
                                                                "Celeste", "Corinto", "CafÃ©", "Beige", "Turquesa", "Marfil", "Anaranjado"
                                                                , "Aqua", "Morado", "Rosado", "Ignorado"))) %>%
  mutate(modelo_veh = mapvalues(modelo_veh, from = 9999, to = "Ignorado")) %>%
  mutate(marca_veh = mapvalues(marca_veh, from=99, to="Ignorado")) %>%
  mutate(mes_ocu = as.numeric(mapvalues(mes_ocu, from=c("Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", 
                                                        "Julio", "Agosto", "Septiembre", "Septiemre", "Octubre",
                                                        "Noviembre", "Diciembre"),
                                        to=c(1,2,3,4,5,6,7,8,9,9,10,11,12)))) %>%
  mutate(lesio_fall = mapvalues(lesio_fall, from = c(1,2), c("Fallecido", "Lesionado"))) %>%
  mutate(causa_acc = mapvalues(causa_acc, from = c(1, 2, 3, 4, 5), to = c("Colisión", "Choque", "Vuelco", "Caída", "Atropello")))
  

##Join between fl and fl16
fl <- full_join(fl, fl16)
rm(fl16)

##Determine colnames for joining fl and fl16
namesfl <- colnames(fl)

fl17 <- fl17 %>%
  mutate(núm_corre = NULL) %>%
  mutate(g_hora = NULL) %>%
  mutate(g_hora_5 = NULL) %>%
  mutate(mayor_menor = NULL) %>%
  mutate(g_edad_80ymás = NULL) %>%
  mutate(g_edad_60ymás = NULL) %>%
  mutate(edad_quinquenales = NULL)

oldnamesfl17 <- colnames(fl17)
newnamesfl17 <- c("ano_ocu", "dia_ocu", oldnamesfl17[3], oldnamesfl17[4], "dia_sem_ocu",
                  "muni_ocu", oldnamesfl17[7], oldnamesfl17[8], "sexo_pil", "edad_pil",
                  oldnamesfl17[11], oldnamesfl17[12], oldnamesfl17[13], oldnamesfl17[14], oldnamesfl17[15],
                  "causa_acc", "lesio_fall", oldnamesfl17[18])

fl17 <- fl17 %>%
  rename_at(vars(oldnamesfl17), ~ newnamesfl17) %>%
  mutate(depto_ocu = mapvalues(depto_ocu, from=c(1:22), to=c("Guatemala","El progreso","SacatepÃ©quez","Chimaltenango","Escuintla","Santa rosa","SololÃ¡","TotonicapÃ¡n","Quetzaltenango","SuchitepÃ©quez",
                                                             "Retalhuleu","San Marcos","Huehuetenango","Quiche","Baja Verapaz","Alta Verapaz","Peten","Izabal","Zacapa","Chiquimula","Jalapa",
                                                             "Jutiapa"))) %>%
  mutate(color_veh = mapvalues(color_veh, from=c(1:17,99), to=c("Rojo", "Blanco","Azul", "Gris", "Negro", "Verde", "Amarillo",
                                                                "Celeste", "Corinto", "CafÃ©", "Beige", "Turquesa", "Marfil", "Anaranjado"
                                                                , "Aqua", "Morado", "Rosado", "Ignorado"))) %>%
  mutate(modelo_veh = mapvalues(modelo_veh, from = 9999, to = "Ignorado")) %>%
  mutate(marca_veh = mapvalues(marca_veh, from=99, to="Ignorado")) %>%
  mutate(mes_ocu = as.numeric(mapvalues(mes_ocu, from=c("Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", 
                                                        "Julio", "Agosto", "Septiembre", "Septiemre", "Octubre",
                                                        "Noviembre", "Diciembre"),
                                        to=c(1,2,3,4,5,6,7,8,9,9,10,11,12)))) %>%
  mutate(lesio_fall = mapvalues(lesio_fall, from = c(1,2), c("Fallecido", "Lesionado"))) %>%
  mutate(causa_acc = mapvalues(causa_acc, from = c(1, 2, 3, 4, 5), to = c("Colisión", "Choque", "Vuelco", "Caída", "Atropello")))

##Join between fl and fl17
fl <- full_join(fl, fl17)
rm(fl17)


#Write final .csv file
write.csv(fl, file = "Results/fl09_17.csv", row.names = F)
