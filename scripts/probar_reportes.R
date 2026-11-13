
source("scripts/lector_secuencia.R")
source("scripts/estadistica.R")
source("scripts/translator.R")
source("scripts/generador_reportes.R")

archivos <- list.files("data", pattern = "\\.fasta$", full.names = TRUE)

for (archivo in archivos) {
  salida <- generar_reporte(archivo)
  if (!is.null(salida)) {
    print(salida)
  }
}
