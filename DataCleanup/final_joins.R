require("plyr")
require("dplyr")

#JOINS VI y HT

vi <- read.csv("Results/vi10_17.csv")
ht <- read.csv("Results/HT09_17.csv")
fl <- read.csv("Results/fl09_17.csv")

mun_dicc <- read.csv("dicc_municipios.csv")

vi$mes_ocu <- as.factor(vi$mes_ocu)
ht$mes_ocu <- as.factor(ht$mes_ocu)
vi$dia_sem_ocu <- as.factor(vi$dia_sem_ocu)
ht$dia_sem_ocu <- as.factor(ht$dia_sem_ocu)
vi$areag_ocu <- as.factor(vi$areag_ocu)
ht$areag_ocu <- as.factor(ht$areag_ocu)
vi$sexo_pil <- as.factor(vi$sexo_pil)
ht$sexo_pil <- as.factor(ht$sexo_pil)
vi$estado_pil <- as.factor(vi$estado_pil)
ht$estado_pil <- as.factor(ht$estado_pil)
vi$tipo_veh <- as.factor(vi$tipo_veh)
ht$tipo_veh <- as.factor(ht$tipo_veh)
vi$modelo_veh <- as.factor(vi$modelo_veh)
ht$modelo_veh <- as.factor(ht$modelo_veh)
vi$muni_ocu <- as.factor(vi$muni_ocu)
ht$muni_ocu <- as.factor(ht$muni_ocu)
vi$mayor_men <- mapvalues(vi$mayor_men, from=c("Mayor", "Menor", "Ignorado"), to=c(1,2,9))
vi$mayor_men <- as.factor(vi$mayor_men)
ht$mayor_men <- as.factor(ht$mayor_men)

vi$grupo_eda_pil <- NULL
vi$grupo_edad_pil <- NULL
vi$grupo_hor_ocu <- NULL
vi$grupo_mod_veh <- NULL
# mes ocurrencia recodificacion
vi$mes_ocu <- mapvalues(vi$mes_ocu, from=c("Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Septiemre", "Octubre"
                                           , "Noviembre", "Diciembre"), to=c(1,2,3,4,5,6,7,8,9,9,10,11,12))
vi$mes_ocu <- as.numeric(vi$mes_ocu)

# dia semana ocurrencia recodificacion
vi$dia_sem_ocu <- mapvalues(vi$dia_sem_ocu, from=c("Lunes", "Martes", "Miercoles", "Miércoles", "Jueves", "Viernes", "Sabado", "Sábado", "Domingo")
                            , to=c(1,2,3,3,4,5,6,6,7))
vi$dia_sem_ocu <- as.numeric(vi$dia_sem_ocu)

tipovehLabels <- as.vector(as.data.frame(table(as.factor(vi$tipo_veh)))$Var1)
vi$tipo_veh <- mapvalues(vi$tipo_veh, from=tipovehLabels, to=c(1,10,11,12,13,14,15,16,17,18,2,20,22,3,4,5,6,7,8,9,99,1,1,18,17,7,12,6,5,5,2,15,15,16,99,8,9,14,4,14,11,3,3,10,13))
vi$tipo_veh <- as.numeric(vi$tipo_veh)
# Sexo Piloto recodificacion
vi$sexo_pil <- mapvalues(vi$sexo_pil, from=c("Hombre", "Mujer", "Ignorado"), to=c(1,2,9))
# Estado Piloto recodificacion
vi$estado_pil <- mapvalues(vi$estado_pil, from=c("Bajo efectos de alcohol", "Ebrio", "Normal", "Ignorado"), to=c(2,2,1,9))
vi$estado_pil <- as.numeric(vi$estado_pil)

vi$areag_ocu <- mapvalues(vi$areag_ocu, from=c("Rural", "RURAL","Urbano", "URBANO"), to=c(2,2,1,1))

causaAccLabels <- as.vector(as.data.frame(table(as.factor(vi$causa_acc)))$Var1)           
vi$causa_acc <- mapvalues(vi$causa_acc, 
                          from=causaAccLabels, to=c("Colisión", "Choque", "Vuelco", "Caída", "Atropello", "Ignorado",
                                                    "Atropello",  "Caída", "Caída", "Caída", "Choque","Choque", "Colisión","Colisión", "Colisión", "Catástrofe"
                                                    , "Ignorado","Ignorado", "Vuelco", "Vuelco"))


vi$mes_ocu <- as.factor(vi$mes_ocu)
ht$mes_ocu <- as.factor(ht$mes_ocu)
vi$dia_sem_ocu <- as.factor(vi$dia_sem_ocu)
ht$dia_sem_ocu <- as.factor(ht$dia_sem_ocu)
vi$areag_ocu <- as.factor(vi$areag_ocu)
ht$areag_ocu <- as.factor(ht$areag_ocu)
vi$sexo_pil <- as.factor(vi$sexo_pil)
vi$estado_pil <- as.factor(vi$estado_pil)
ht$estado_pil <- as.factor(ht$estado_pil)
vi$tipo_veh <- as.factor(vi$tipo_veh)
ht$tipo_veh <- as.factor(ht$tipo_veh)
vi$modelo_veh <- as.factor(vi$modelo_veh)
ht$modelo_veh <- as.factor(ht$modelo_veh)
vi$muni_ocu <- as.factor(vi$muni_ocu)
ht$muni_ocu <- as.factor(ht$muni_ocu)

#Clear ht outliers

ht_clear <- ht %>%
  mutate(hora_ocu = ifelse(hora_ocu != 99, hora_ocu, NA)) %>%
  mutate(depto_ocu = mapvalues(depto_ocu, from = as.vector(unique(depto_ocu)), 
                               to = c("Quiché", "Jutiapa", "Petén", "Jalapa", "Suchitepéquez", "Izabal", "San Marcos",
                                      "Baja Verapaz", "Guatemala", "Chiquimula", "Huehuetenango", "Sacatepéquez",
                                      "Chimaltenango", "Santa Rosa", "Escuintla", "Zacapa", "Sololá", "Retalhuleu",
                                      "Quetzaltenango", "El Progreso", "Alta Verapaz", "Totonicapán", "Alta Verapaz",
                                      "Suchitepéquez", "Petén", "Quiché", "Sacatepéquez", "Totonicapán", "Santa Rosa",
                                      "Sololá", "El Progreso"))) %>%
  mutate(sexo_pil = ifelse(sexo_pil != 9, sexo_pil, NA)) %>%
  mutate(sexo_pil = ifelse(sexo_pil != 3, sexo_pil, NA)) %>%
  mutate(edad_pil = ifelse(edad_pil != 999, edad_pil, NA)) %>%
  mutate(edad_pil = ifelse(edad_pil >= 5, edad_pil, NA)) %>%
  mutate(estado_pil = ifelse(estado_pil != 9, estado_pil, NA)) %>%
  mutate(tipo_veh = ifelse(tipo_veh != 99, tipo_veh, NA)) %>%
  mutate(color_veh = ifelse(color_veh != "Ignorado", color_veh, NA)) %>%
  mutate(modelo_veh = ifelse(modelo_veh == "Ignorado" | modelo_veh == "IGNORADO", NA, modelo_veh)) %>%
  mutate(causa_acc = ifelse(causa_acc == "Ignorado", NA, causa_acc)) %>%
  mutate(zona_ocu = ifelse(zona_ocu != 99, zona_ocu, NA)) %>%
  mutate(mayor_men = ifelse(mayor_men == 3 | mayor_men == 9, NA, mayor_men)) %>%
  mutate(marca_veh = ifelse(marca_veh == "Ignorado", NA, marca_veh))

#Clear vi outliers


vi_clear <- vi %>%
  mutate(hora_ocu = ifelse(hora_ocu != 99, hora_ocu, NA)) %>%
  mutate(depto_ocu = mapvalues(depto_ocu, from = as.vector(unique(depto_ocu)), 
                               to = c("El Progreso", "Quetzaltenango", "Huehuetenango", "Alta Verapaz", "Guatemala", "Sololá",  "Chiquimula",
                                      "Petén", "Escuintla", "Suchitepéquez", "Izabal", "San Marcos", "Jutiapa", "Chimaltenango",
                                      "Totonicapán", "Quiché", "Zacapa", "Santa Rosa",  "Sacatepéquez", "Jalapa", "Baja Verapaz",
                                      "Retalhuleu", "Suchitepéquez", "Petén", "Quiché", "Sacatepéquez", "Totonicapán", "Santa Rosa",
                                      "Sololá", "Guatemala", "Santa Rosa", "Suchitepéquez", "Baja Verapaz", "Jalapa",
                                      "Chiquimula", "Escuintla", "San Marcos", "Alta Verapaz", "Izabal", "Sololá", "Zacapa", "Sacatepéquez", 
                                      "Jutiapa", "Quetzaltenango", "Petén", "Chimaltenango", "Suchitepéquez", "Huehuetenango", "El Progreso",
                                      "Quiché", "Totonicapán"))) %>%
  mutate(muni_ocu = match(muni_ocu, mun_dicc$id)) %>%
  mutate(sexo_pil = ifelse(sexo_pil ==  "9", NA, sexo_pil)) %>%
  mutate(edad_pil = ifelse(edad_pil != 999, edad_pil, NA)) %>%
  mutate(edad_pil = ifelse(edad_pil >= 5, edad_pil, NA)) %>%
  mutate(estado_pil = ifelse(as.numeric(estado_pil) > 3, NA, estado_pil)) %>%
  mutate(color_veh = ifelse(color_veh != "Ignorado", color_veh, NA)) %>%
  mutate(modelo_veh = ifelse(modelo_veh == 99, NA, modelo_veh)) %>%
  mutate(zona_ocu = ifelse(zona_ocu != 99, zona_ocu, NA)) %>%
  mutate(mayor_men = ifelse(as.numeric(mayor_men) == 9 | as.numeric(mayor_men) == 3, NA, mayor_men)) %>%
  mutate(causa_acc = ifelse(causa_acc == "Ignorado", NA, causa_acc)) %>%
  mutate(tipo_veh = as.numeric(tipo_veh)) %>%
  mutate(marca_veh = ifelse(marca_veh == "Ignorado", NA, marca_veh))
  



#FL refactor
fl$mes_ocu <- as.factor(fl$mes_ocu)su
fl$dia_sem_ocu <- as.factor(fl$dia_sem_ocu)
fl$areag_ocu <- as.factor(fl$areag_ocu)
fl$sexo_pil <- as.factor(fl$sexo_pil)
fl$estado_pil <- as.factor(fl$estado_pil)
fl$tipo_veh <- as.factor(fl$tipo_veh)
fl$muni_ocu <- as.factor(fl$muni_ocu)

#Clear fl outliers
fl_clear <- fl %>%
  mutate(g_edad = NULL) %>%
  mutate(hora_ocu = ifelse(hora_ocu < 24, hora_ocu, NA)) %>%
  mutate(depto_ocu = mapvalues(depto_ocu, from = as.vector(unique(depto_ocu)), 
                               to = c("Guatemala", "El Progreso", "Sacatepéquez", "Chimaltenango", "Escuintla", "Santa Rosa", "Sololá", "Totonicapán",
                                      "Quetzaltenango", "Suchitepéquez", "Retalhuleu", "San Marcos", "Huehuetenango", "Quiché", "Baja Verapaz", "Alta Verapaz",
                                      "Petén", "Izabal", "Zacapa", "Chiquimula", "Jalapa", "Jutiapa", "Huehuetenango", "Quiché", 
                                      "Sacatepéquez", "Sololá", "Totonicapán", "Petén", "Suchitepéquez",  "Santa Rosa", "Sololá", "Suchitepéquez", 
                                      "El Progreso", "Sacatepéquez", "Totonicapán"
                                      ))) %>%
  mutate(zona_ocu = ifelse(zona_ocu != 99, zona_ocu, NA)) %>%
  mutate(sexo_pil = ifelse(sexo_pil != 9, sexo_pil, NA)) %>%
  mutate(sexo_pil = ifelse(sexo_pil != 3, sexo_pil, NA)) %>%
  mutate(edad_pil = ifelse(edad_pil != 999, edad_pil, NA)) %>%
  mutate(edad_pil = ifelse(edad_pil >= 5, edad_pil, NA)) %>%
  mutate(lesio_fall = mapvalues(lesio_fall, from = c("Fallecido", "Fallecidos", "Lesionado", "Lesionados"), 
                                to = c("Fallecido", "Fallecido", "Lesionado", "Lesionado"))) %>%
  mutate(tipo_veh = ifelse(tipo_veh != 99, tipo_veh, NA)) %>%
  mutate(color_veh = ifelse(color_veh != "Ignorado", color_veh, NA)) %>%
  mutate(modelo_veh = ifelse(modelo_veh == "Ignorado" | modelo_veh == "IGNORADO", NA, modelo_veh)) %>%
  mutate(marca_veh = ifelse(marca_veh == "Ignorado" | marca_veh == "999", NA, as.numeric(marca_veh))) %>%
  mutate(causa_acc = ifelse(causa_acc == "Ignorado" | causa_acc == "99", NA, causa_acc)) %>%
  mutate(int_o_noint = ifelse(int_o_noint == 9, NA, int_o_noint)) %>%
  mutate(mes_ocu = as.factor(mes_ocu)) %>%
  mutate(areag_ocu = as.factor(areag_ocu)) %>%
  mutate(muni_ocu = as.factor(muni_ocu)) %>%
  mutate(dia_sem_ocu = as.factor(dia_sem_ocu))
  


#JOINS
ine_accidentes <- full_join(ht_clear, fl_clear)
ine_accidentes <- ine_accidentes %>%
  mutate(muni_ocu = as.numeric(muni_ocu))

ine_accidentes <- full_join(ine_accidentes, vi_clear)

write.csv(ine_accidentes,"Results/ine_accidentes.csv", row.names = F)
