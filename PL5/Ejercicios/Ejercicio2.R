#Seleccionamos el directorio de trabajo
directorio <- dirname(parent.frame(2)$ofile)
setwd(directorio)


# Ejercicio 2
# Caja y bigotes

# Datos de muestra
muestra <- t(matrix(c(3, 2, 3.5, 12, 4.7, 4.1, 5.2, 4.9, 7.1, 6.1, 6.2, 5.2, 14, 5.3), 2, 7, dimnames = list(c("r","s"))))

muestra = data.frame(muestra)

# Ejecutamos el algoritmo 
boxplot(muestra$r, range=1.5, plot = FALSE)

# Dado que boxplot es una funcion de caja negra
# lo realiazamos a mano tambien.

# Calculamos cuantiles
q1 <- quantile(muestra$r, 0.25)
q3 <- quantile(muestra$r, 0.75)

# Obtenemos el intervalo de datos normales
s = 1.5
intervalo <- c(q1 - s * (q3 - q1), q1 + s*(q3-q1))

# Comprobamos que los datos estan en el intervalo
for (i in 1:length(muestra$r))
{
  # si se sale del intervalo, es un outlayer
  if(muestra$r[i] < intervalo[1] || muestra$r[i] > intervalo[2])
  {
    cat("El dato", muestra$r[i], "es un outlayer.")
  }
  
}