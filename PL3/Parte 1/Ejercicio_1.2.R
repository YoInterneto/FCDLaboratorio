
# Cambiamos el directorio de trabajo
directorio <- dirname(parent.frame(2)$ofile)
setwd(directorio)

# Cargamos los datos
planetas <- read.table("./planetasMuestra.txt")
print(planetas)

# Estudiamos la regresion
regresion = lm(D~R, data=planetas)
print(regresion)