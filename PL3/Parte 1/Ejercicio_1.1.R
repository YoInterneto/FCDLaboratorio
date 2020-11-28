
#Cargamos librerias
library('rpart')
library('tree')

# Cambiamos el directorio de trabajo
dir <- dirname(parent.frame(2)$ofile)
setwd(dir)

# Leemos los datos
calificaciones <- read.table("./calificacionesMuestra.txt")


muestra <- data.frame(calificaciones)

# Clasificamos usando la funcion rpart
clasificacion <- rpart(Calificacion~., data=muestra, method="class", minsplit=1)
print(clasificacion)
print("-----------------")

# Clasificamos usando la funcion tree
calificaciontree <- tree(Calificacion~., data=muestra, mincut=1, minsize=2)
print(calificaciontree)
