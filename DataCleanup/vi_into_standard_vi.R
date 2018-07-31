#renombrando vi 10
new10 <- read.csv("https://raw.githubusercontent.com/Rafalp190/DSP1-UVG/master/DataCleanup/Data/10VI.csv")
summary(new10)
colnames(new10) <- c("dia_ocu", "mes_ocu","dia_sem_ocu","hora_ocu","depto_ocu","areag_ocu","zona_ocu",
                   "sexo_pil","edad_pil","estado_pil","tipo_veh","color_veh","modelo_veh","causa_acc"
                   )
new10$ano_ocu <- 2010

#renombrando vi 12
new12 <- read.csv("https://raw.githubusercontent.com/Rafalp190/DSP1-UVG/master/DataCleanup/Data/12VI.csv")
summary(new12)
new12$num_vehí <- NULL
colnames(new12) <- c("dia_ocu", "mes_ocu","dia_sem_ocu","hora_ocu","depto_ocu","muni_ocu","areag_ocu",
                   "zona_ocu","sexo_pil","edad_pil","grupo_edad_pil","mayor_men","estado_pil","tipo_veh","color_veh",
                   "modelo_veh","causa_acc")
new12$ano_ocu <- 2012

#renombrando vi 13
new13 <- read.csv("https://raw.githubusercontent.com/Rafalp190/DSP1-UVG/master/DataCleanup/Data/13VI.csv")
summary(new13)
new13$num_hecho <- NULL
colnames(new13) <- c("dia_ocu", "mes_ocu","dia_sem_ocu","hora_ocu","depto_ocu","muni_ocu","areag_ocu",
                    "zona_ocu","sexo_pil","edad_pil","mayor_men","tipo_veh","color_veh","modelo_veh","causa_acc",
                    "marca_veh","grupo_edad_pil","estado_pil","grupo_mod_veh")
new13$ano_ocu <- 2013

#renombrando vi 14
new14 <- read.csv("https://raw.githubusercontent.com/Rafalp190/DSP1-UVG/master/DataCleanup/Data/14VI.csv")
summary(new14)
new14$num_correlativo <- NULL
new14$corre_base <- NULL
colnames(new14) <- c("dia_ocu","dia_sem_ocu","hora_ocu","grupo_hor_ocu","mes_ocu","depto_ocu","muni_ocu",
                    "zona_ocu","areag_ocu","sexo_pil","edad_pil","grupo_eda_pil","mayor_men","estado_pil",
                    "tipo_veh","modelo_veh","color_veh","marca_veh","causa_acc")
new14$ano_ocu <- 2014

#remombrado vi15
new15 <- read.csv("https://raw.githubusercontent.com/Rafalp190/DSP1-UVG/master/DataCleanup/Data/15VI.csv")
new15$núm_corre <- NULL
new15$g_hora <- NULL
new15$g_hora_5 <- NULL
new15$g_edad_60ymás <- NULL
new15$g_edad_80ymás <- NULL
new15$edad_quinquenales <-NULL
new15$g_modelo_veh <- NULL
summary(new15)
colnames(new15) <- c("mes_ocu", "dia_ocu","dia_sem_ocu","hora_ocu","depto_ocu","muni_ocu",
                    "areag_ocu", "zona_ocu","sexo_pil","edad_pil","mayor_men","estado_pil",
                    "tipo_veh","marca_veh","color_veh","modelo_veh","causa_acc")
new15$ano_ocu <- 2015

#renombrando vi16
new16 <- read.csv("https://raw.githubusercontent.com/Rafalp190/DSP1-UVG/master/DataCleanup/Data/16VI.csv")
new16$año_ocu <- NULL
new16$num_corre <- NULL
new16$g_hora <- NULL
new16$g_hora_5 <- NULL
new16$g_edad_60ymás <- NULL
new16$g_edad_80ymás <- NULL
new16$edad_quinquenales <-NULL
new16$g_modelo_veh <- NULL
summary(new16)
colnames(new16) <- c("dia_ocu","hora_ocu","mes_ocu","dia_sem_ocu","muni_ocu","depto_ocu",
                     "areag_ocu","sexo_pil","zona_ocu","edad_pil","estado_pil","mayor_men",
                     "tipo_veh","marca_veh","color_veh","modelo_veh","causa_acc")
new16$ano_ocu <- 2016

#renombrando vi17
new17 <- read.csv("https://raw.githubusercontent.com/Rafalp190/DSP1-UVG/master/DataCleanup/Data/17VI.csv")
new17$año_ocu <- NULL
new17$núm_corre <- NULL
new17$g_hora <- NULL
new17$g_hora_5 <- NULL
new17$g_edad_60ymás <- NULL
new17$g_edad_80ymás <- NULL
new17$edad_quinquenales <-NULL
new17$g_modelo_veh <- NULL
summary(new17)
colnames(new17) <- c("dia_ocu","hora_ocu","mes_ocu","dia_sem_ocu","muni_ocu","depto_ocu",
                     "zona_ocu","sexo_pil","edad_pil","estado_pil","mayor_men",
                     "tipo_veh","marca_veh","color_veh","modelo_veh","causa_acc")
new17$ano_ocu <- 2017


#fixing types
new10$zona_ocu <- as.numeric(new10$zona_ocu)
new12$zona_ocu <- as.numeric(new12$zona_ocu)
new10$edad_pil <- as.numeric(new10$edad_pil)
new12$edad_pil <- as.numeric(new12$edad_pil)
new10$modelo_veh <- as.numeric(new10$modelo_veh)
new12$modelo_veh <- as.numeric(new12$modelo_veh)


#merging 
vi <- full_join(new10,new12)
vi$zona_ocu <- as.factor(vi$zona_ocu)
new13$zona_ocu <- as.factor(new13$zona_ocu)
vi$edad_pil <- as.factor(vi$edad_pil)
new13$edad_pil <- as.factor(new13$edad_pil)
vi$modelo_veh <- as.factor(vi$modelo_veh)
new13$modelo_veh <- as.factor(new13$mode)


vi <- full_join(vi, new13)
vi <- full_join(vi, new14)
vi$mes_ocu <- as.character(vi$mes_ocu)
new15$mes_ocu <- as.character(new15$mes_ocu)
vi$dia_sem_ocu <- as.character(vi$dia_sem_ocu)
new15$dia_sem_ocu <- as.character(new15$dia_sem_ocu)
vi$depto_ocu <- as.character(vi$depto_ocu)
new15$depto_ocu <- as.character(new15$depto_ocu)
vi$areag_ocu <- as.character(vi$areag_ocu)
new15$areag_ocu <- as.character(new15$areag_ocu)
vi$zona_ocu <- as.character(vi$zona_ocu)
new15$zona_ocu <- as.character(new15$zona_ocu)
vi$sexo_pil <- as.factor(vi$sexo_pil)
new15$sexo_pil <- as.factor(new15$sexo_pil)
vi$edad_pil <- as.numeric(vi$edad_pil)
new15$edad_pil <- as.numeric(new15$edad_pil)
vi$estado_pil <- as.character(vi$estado_pil)
new15$estado_pil <- as.character(new15$estado_pil)
vi$tipo_veh <- as.character(vi$tipo_veh)
new15$tipo_veh <- as.character(new15$tipo_veh)
vi$color_veh <- as.character(vi$color_veh)
new15$color_veh <- as.character(new15$color_veh)
vi$modelo_veh <- as.character(vi$modelo_veh)
new15$modelo_veh <- as.character(new15$modelo_veh)
vi$causa_acc <- as.character(vi$causa_acc)
new15$causa_acc <- as.character(new15$causa_acc)
vi$muni_ocu <- as.character(vi$muni_ocu)
new15$muni_ocu <- as.character(new15$muni_ocu)
vi$mayor_men <- as.character(vi$mayor_men)
new15$mayor_men <- as.character(new15$mayor_men)
vi$marca_veh <- as.character(vi$marca_veh)
new15$marca_veh <- as.character(new15$marca_veh)


vi <- full_join(vi,new15)
new16$mes_ocu <- as.character(new16$mes_ocu)
new16$dia_sem_ocu <- as.character(new16$dia_sem_ocu)
new16$depto_ocu <- as.character(new16$depto_ocu)
new16$areag_ocu <- as.character(new16$areag_ocu)
new16$zona_ocu <- as.character(new16$zona_ocu)
new16$sexo_pil <- as.factor(new16$sexo_pil)
new16$edad_pil <- as.numeric(new16$edad_pil)
new16$estado_pil <- as.character(new16$estado_pil)
new16$tipo_veh <- as.character(new16$tipo_veh)
new16$color_veh <- as.character(new16$color_veh)
new16$modelo_veh <- as.character(new16$modelo_veh)
new16$causa_acc <- as.character(new16$causa_acc)
new16$muni_ocu <- as.character(new16$muni_ocu)
new16$mayor_men <- as.character(new16$mayor_men)
new16$marca_veh <- as.character(new16$marca_veh)

vi <- full_join(vi, new16)
new17$mes_ocu <- as.character(new17$mes_ocu)
new17$dia_sem_ocu <- as.character(new17$dia_sem_ocu)
new17$depto_ocu <- as.character(new17$depto_ocu)
new17$areag_ocu <- as.character(new17$areag_ocu)
new17$zona_ocu <- as.character(new17$zona_ocu)
new17$sexo_pil <- as.factor(new17$sexo_pil)
new17$edad_pil <- as.numeric(new17$edad_pil)
new17$estado_pil <- as.character(new17$estado_pil)
new17$tipo_veh <- as.character(new17$tipo_veh)
new17$color_veh <- as.character(new17$color_veh)
new17$modelo_veh <- as.character(new17$modelo_veh)
new17$causa_acc <- as.character(new17$causa_acc)
new17$muni_ocu <- as.character(new17$muni_ocu)
new17$mayor_men <- as.character(new17$mayor_men)
new17$marca_veh <- as.character(new17$marca_veh)

vi <- full_join(vi, new17)




write.csv(vi, "Results/vi10_17.csv", row.names = F)
