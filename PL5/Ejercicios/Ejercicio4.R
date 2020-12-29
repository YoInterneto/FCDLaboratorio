#Seleccionamos el directorio de trabajo
directorio <- dirname(parent.frame(2)$ofile)
setwd(directorio)


# Ejercicio 4 
#Analisis de datos anomalos mediante regresion

# Datos de muestra
muestra <- t(matrix(c(3,2,3.5,12,4.7,4.1,5.2,4.9,7.1,6.1,6.2,5.2,4,5.3), 2, 7, dimnames = list(c("r","d"))))
muestra = data.frame(muestra)

# Calculamos regresion
regresion = lm(muestra$d~muestra$r)

# Sacamos los residuos
residuos = summary(regresion)$residuals
print(residuos)

#Calculamos el error
error = sqrt(sum(residuos**2)/length(muestra$d))

grado_outlier = 1.5
dsr = grado_outlier * error


for (i in 1:length(muestra$r))
{
  if(abs(residuos[i]) > dsr)
  {
    cat("El dato", muestra$d[i], "es un outlayer. \n")
  }
}