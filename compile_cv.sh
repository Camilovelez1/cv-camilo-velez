#!/bin/bash

# Verificación de argumentos
if [ $# -ne 1 ]; then
  echo "Uso: $0 ruta/al/archivo.tex"
  echo "Ejemplo: $0 en/industry/camilo_velez_cv_en_industry.tex"
  exit 1
fi

TEX_FILE=$1

# Extraer carpeta y nombre base del archivo
TEX_DIR=$(dirname "$TEX_FILE")
TEX_NAME=$(basename "$TEX_FILE")
FILE_BASE="${TEX_NAME%.*}"

# Ruta donde se guardará el PDF
OUTPUT_DIR="${TEX_DIR%/*}/output"
mkdir -p "$OUTPUT_DIR"

# Compilar dos veces por si hay referencias cruzadas
xelatex -output-directory="$OUTPUT_DIR" "$TEX_FILE"
xelatex -output-directory="$OUTPUT_DIR" "$TEX_FILE"


echo "PDF generado en: $OUTPUT_DIR/${FILE_BASE}.pdf"

# clean.sh
find . -type f \( -name "*.aux" -o -name "*.log" -o -name "*.out" \) -delete
echo "Auxiliary files cleaned."
