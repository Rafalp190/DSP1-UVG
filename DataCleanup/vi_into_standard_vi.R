#renombrando vi 10
new10 <- vi10csv
summary(new10)
colnames(new10) <- c("dia_ocu", "mes_ocu","dia_sem_ocu","hora_ocu","depto_ocu","areag_ocu","zona_ocu",
                   "sexo_pil","edad_pil","estado_pil","tipo_veh","color_veh","modelo_veh","causa_acc"
                   )
new10$ano_ocu <- 2010

#renombrando vi 12
new12 <- vi12csv
summary(new12)
new12$num_vehí <- NULL
colnames(new12) <- c("dia_ocu", "mes_ocu","dia_sem_ocu","hora_ocu","depto_ocu","muni_ocu","areag_ocu",
                   "zona_ocu","sexo_pil","edad_pil","grupo_edad_pil","mayor_men","estado_pil","tipo_veh","color_veh",
                   "modelo_veh","causa_acc")
new12$ano_ocu <- 2012

#renombrando vi 13
new13 <- vi13csv
summary(new13)
new13$num_hecho <- NULL
colnames(new13) <- c("dia_ocu", "mes_ocu","dia_sem_ocu","hora_ocu","depto_ocu","muni_ocu","areag_ocu",
                    "zona_ocu","sexo_pil","edad_pil","mayor_men","tipo_veh","color_veh","modelo_veh","causa_acc",
                    "marca_veh","grupo_edad_pil","estado_pil","grupo_mod_veh")
new13$ano_ocu <- 2013

#renombrando vi 14
new14 <- vi14csv
summary(new14)
new14$num_correlativo <- NULL
new14$corre_base <- NULL
colnames(new14) <- c("dia_ocu","dia_sem_ocu","hora_ocu","grupo_hor_ocu","mes_ocu","depto_ocu","muni_ocu",
                    "zona_ocu","areag_ocu","sexo_pil","edad_pil","grupo_eda_pil","mayor_men","estado_pil",
                    "tipo_veh","modelo_veh","color_veh","marca_veh","causa_acc")
new14$ano_ocu <- 2014

#remombrado vi15
new15 <- vi15
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
new16 <- vi16
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
new17 <- vi17
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
new17$ano_ocu <- 2016


#fixing types
new10$zona_ocu <- as.numeric(new10$zona_ocu)
new12$zona_ocu <- as.numeric(new12$zona_ocu)
new10$edad_pil <- as.numeric(new10$zona_ocu)
new12$edad_pil <- as.numeric(new12$zona_ocu)
new10$modelo_veh <- as.numeric(new10$zona_ocu)
new12$modelo_veh <- as.numeric(new12$zona_ocu)
anos_2010_2012$zona_ocu <- as.numeric(anos_2010_2012$zona_ocu)
anos_2013_2014$zona_ocu <- as.numeric(anos_2013_2014$zona_ocu)
anos_2010_2012$edad_pil <- as.numeric(anos_2010_2012$zona_ocu)
anos_2013_2014$edad_pil <- as.numeric(anos_2013_2014$zona_ocu)
anos_2010_2012$modelo_veh <- as.character(anos_2010_2012$zona_ocu)
anos_2013_2014$modelo_veh <- as.character(anos_2013_2014$zona_ocu)

#merging 
anos_2010_2012 <- full_join(new10,new12)
anos_2013_2014 <- full_join(new13,new14)
anos_2015_2016 <- full_join(new15,new16)
anos_2015_2017 <- full_join(anos_2015_2016,new17)
anos_2010_2014 <- full_join(anos_2010_2012,anos_2013_2014)
anos_2010_2017 <- full_join(anos_2010_2014,anos_2010_2014)

write.csv(anos_2010_2017, "Results/10_17.csv", row.names = F)
