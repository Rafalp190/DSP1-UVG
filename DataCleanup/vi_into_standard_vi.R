#VI vertical join journey MONKAS
merginBottom <- function(x, y) {
  
  x.diff <- setdiff(colnames(x), colnames(y))
  y.diff <- setdiff(colnames(y), colnames(x))
  
  x[, c(as.character(y.diff))] <- NA
  
  y[, c(as.character(x.diff))] <- NA
  
  return(rbind(x, y))
}

#renombrando vi 10
new1 <- vi10csv
summary(new1)
colnames(new1) <- c("dia_ocu", "mes_ocu","dia_sem_ocu","hora_ocu","depto_ocu","areag_ocu","zona_ocu",
                   "sexo_pil","edad_pil","estado_pil","tipo_veh","color_veh","modelo_veh","causa_acc"
                   )
new1$ano_ocu <- 2010

#renombrando vi 12
new2 <- vi12csv
summary(new2)
new2$num_vehí <- NULL
colnames(new2) <- c("dia_ocu", "mes_ocu","dia_sem_ocu","hora_ocu","depto_ocu","muni_ocu","areag_ocu",
                   "zona_ocu","sexo_pil","edad_pil","grupo_edad_pil","mayor_men","estado_pil","tipo_veh","color_veh",
                   "modelo_veh","causa_acc")
new2$ano_ocu <- 2012

#renombrando vi 13
new3 <- vi13csv
summary(new3)
new3$num_hecho <- NULL
colnames(new3) <- c("dia_ocu", "mes_ocu","dia_sem_ocu","hora_ocu","depto_ocu","muni_ocu","areag_ocu",
                    "zona_ocu","sexo_pil","edad_pil","mayor_men","tipo_veh","color_veh","modelo_veh","causa_acc",
                    "marca_veh","grupo_edad_pil","estado_pil","grupo_mod_veh")
new3$ano_ocu <- 2013

#renombrando vi 14
new4 <- vi14csv
summary(new4)
new4$num_correlativo <- NULL
new4$corre_base <- NULL
colnames(new4) <- c("dia_ocu","dia_sem_ocu","hora_ocu","grupo_hor_ocu","mes_ocu","depto_ocu","muni_ocu",
                    "zona_ocu","areag_ocu","sexo_pil","edad_pil","grupo_eda_pil","mayor_men","estado_pil",
                    "tipo_veh","modelo_veh","color_veh","marca_veh","causa_acc")
new4$ano_ocu <- 2014

hue <- merginBottom(new1,new2)
huehue <- merginBottom(new3,new4)
huehuehue <- merginBottom(hue,huehue)
huehuehue$grupo_edad_pil <- NULL
huehuehue$grupo_hor_ocu <- NULL
huehuehue$grupo_mod_veh <- NULL
