
# llama al script "lector_seucuencia" 
source("scripts/lector_secuencia.R")

# se busca todos los archivos .fasta en la carpeta data
archivos <- list.files("data", pattern = "\\.fasta$", full.names = TRUE)

#para cada uno de los archivos fasta ejecuta la función "leer_fasta" para que
# devuelva la cabecera y la secuencia correspondiente
for (archivo in archivos) {
  fasta <- leer_fasta(archivo)
  
  cat("Archivo:   ", archivo, "\n")
  cat("Cabecera:  ", fasta$cabecera, "\n")
  cat("Secuencia: ", fasta$secuencia, "\n\n")
}

