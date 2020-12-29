# k-vecinos con entrenamiento
# la libreria kknn realiza clasificacion de k-vecinos usando un training set
# despues se puede aplicar a un test set
# install.packages("kknn")
library(kknn)

#Seleccionamos el directorio de trabajo
directorio <- dirname(parent.frame(2)$ofile)
setwd(directorio)

# Libreria por defecto en R 
Data<-iris

# Datos de muestra
Muestra <- sample(1:150, 50)

conjunto_test <- Data[Muestra, ]

# Aprendizaje
conjunto_aprendizaje <- Data[-Muestra, ]

# Ejecuto algoritmo y entreno modelo
modelo <- train.kknn(Species ~ ., data = conjunto_aprendizaje, kmax = 9)
resultado_prediccion <- predict(modelo, conjunto_test[, -5])

# Matriz de confusion
matriz_confusion <- table(conjunto_test[, 5], resultado_prediccion)
print(matriz_confusion)

# Precision
acierto <- (sum(diag(matriz_confusion)))/sum(matriz_confusion)
cat("Acierto: ", acierto, "\n")

# Error
error <- 1 - acierto
cat("Error: ", error, "\n")

# Calidad de la representacion
plot(modelo)