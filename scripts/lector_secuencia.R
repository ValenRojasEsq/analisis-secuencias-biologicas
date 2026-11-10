
# Archivo en el que está la función "leeer_fasta" para que a partir de una ruta especificada
# se lean todos los archivos .fasta que se encuentren. Se extraen cabecera de la secuencia y la secuencia. 
# Para la secuencia de nucleotidos se unen todas las lineas en una sola cadena, se pasan a mayúsculas y se eliminan los espacios.


leer_fasta <- function(ruta) {
  
  lineas <- readLines(ruta)
  es_cabecera <- startsWith(lineas, ">")
  cabecera    <- sub(">", "", lineas[es_cabecera][1])
  lineas_nucleotidos  <- lineas[!es_cabecera]
  secuencia <- paste(lineas_nucleotidos, collapse = "")
  secuencia <- toupper(secuencia)
  secuencia <- gsub(" ", "", secuencia)
  return(list(cabecera = cabecera, secuencia = secuencia))
}

