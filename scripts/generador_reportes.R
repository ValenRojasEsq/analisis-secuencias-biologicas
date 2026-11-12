
generar_reporte <- function(ruta_fasta) {
  fasta <- leer_fasta(ruta_fasta)

  if (grepl("[^ATCG]", fasta$secuencia)) {
    cat("Secuencia invalida:", basename(ruta_fasta), "\n")
    return(NULL)
  }

  if (!dir.exists("results")) {
    dir.create("results")
  }

  nombre <- tools::file_path_sans_ext(basename(ruta_fasta))
  salida <- paste0("results/reporte_", nombre, ".txt")

  reporte <- c(
    "REPORTE DE ANALISIS DE SECUENCIA",
    paste("Archivo:", basename(ruta_fasta)),
    paste("Cabecera:", fasta$cabecera),
    paste("Secuencia:", fasta$secuencia)
  )

  writeLines(reporte, salida)
  return(salida)
}
