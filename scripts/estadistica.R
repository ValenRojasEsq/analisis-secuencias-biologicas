# Módulo de Estadísticas (estadistica.R)
# Calcula la longitud total y el porcentaje de contenido GC de una secuencia FASTA

calcularEstadisticas <- function(secuencia) {
  # Limpiar la secuencia (quitar saltos de línea y pasar a mayúsculas)
  secuencia <- toupper(gsub("\n", "", secuencia))
  
  # 1. Longitud total de la secuencia
  longitud <- nchar(secuencia)
  
  # 2. Conteo de bases G y C
  g_count <- lengths(regmatches(secuencia, gregexpr("G", secuencia)))
  c_count <- lengths(regmatches(secuencia, gregexpr("C", secuencia)))
  
  # 3. Cálculo del porcentaje de Contenido GC
  if (longitud > 0) {
    gc_content <- ((g_count + c_count) / longitud) * 100
  } else {
    gc_content <- 0
  }
  
  # Mostrar el reporte en consola
  cat("--- REPORTE ESTADÍSTICO ---\n")
  cat("Longitud total:", longitud, "nucleótidos\n")
  cat("Contenido GC:", round(gc_content, 2), "%\n")
}