#Seleccionamos el directorio de trabajo
directorio <- dirname(parent.frame(2)$ofile)
setwd(directorio)

# Utilizamos el modelo multivariante
url <- "https://raw.githubusercontent.com/selva86/datasets/master/ozone.csv" 
ozono <- read.csv(url)

modelo <- lm(ozone_reading~., data=ozono)
distancia_cooks <- cooks.distance(modelo)

valor_maximo <- 4*mean(distancia_cooks, na.rm=T)

# Dibujamos la distancia de cooks
plot(distancia_cooks, pch="*", cex=2, main="Estudio de valores anomalos con la distancia de Cooks")  

# Dibujamos la linea que separa los datos normales de los outliers
abline(h = valor_maximo, col="red")  

# Ponemos etiquetas para identificar los outliers
text(x=1:length(distancia_cooks)+1, y=distancia_cooks, labels=ifelse(distancia_cooks>valor_maximo,names(distancia_cooks),""), col="red")
outliers <- list() 

for(i in 1:length(distancia_cooks)){
  if(distancia_cooks[i] > valor_maximo) { # Si los datos estan fuera del rango de valores normales
    outliers <- append(outliers, i) # Se añaden a la lista de anomalos
  }
}

# Imprimimos por pantalla la lista
matriz <- matrix(unlist(outliers))
cat("Los datos outliers son:\n")
cat(matriz, sep =', ')
cat("\n")