require("plyr")
require("dplyr")

#JOINS VI y HT
 
vi <- read.csv("Results/10_17.csv")
ht <- read.csv("Results/HT09_17.csv")
fl <- read.csv("Results/fl09_17.csv")

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
vi$tipo_veh <- mapvalues(vi$tipo_veh, from=tipovehLabels, to=c(1,1,18,17,7,12,6,5,2,2,15,16,99,8,9,14,4,14,11,3,3,10,13))
vi$tipo_veh <- as.numeric(vi$tipo_veh)
# Sexo Piloto recodificacion
vi$sexo_pil <- mapvalues(vi$sexo_pil, from=c("Hombre", "Mujer", "Ignorado"), to=c(1,2,9))
# Estado Piloto recodificacion
vi$estado_pil <- mapvalues(vi$estado_pil, from=c("Bajo efectos de alcohol", "Ebrio", "Normal", "Ignorado"), to=c(2,2,1,9))
vi$estado_pil <- as.numeric(vi$estado_pil)

vi$areag_ocu <- mapvalues(vi$areag_ocu, from=c("Rural", "RURAL","Urbano", "URBANO"), to=c(2,2,1,1))
                         
causaAccLabels <- as.vector(as.data.frame(table(as.factor(vi$causa_acc)))$Var1)           
vi$causa_acc <- mapvalues(vi$causa_acc, 
                          from=causaAccLabels, to=c("Atropello",  "Caída", "Caída", "Caída", "Choque","Choque", "Colisión","Colisión", "Colisión", "Catástrofe"
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

ine_accidentes <- left_join(ht,vi)


#FL Joins
fl$mes_ocu <- as.factor(fl$mes_ocu)
fl$dia_sem_ocu <- as.factor(fl$dia_sem_ocu)
ine_accidentes$areag_ocu <- as.factor(ine_accidentes$areag_ocu)
fl$areag_ocu <- as.factor(fl$areag_ocu)
fl$sexo_pil <- as.factor(fl$sexo_pil)
fl$estado_pil <- as.factor(fl$estado_pil)
fl$tipo_veh <- as.factor(fl$tipo_veh)
fl$muni_ocu <- as.factor(fl$muni_ocu)

ine_accidentes <- full_join(ine_accidentes, fl)



