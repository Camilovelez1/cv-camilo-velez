#!/bin/bash
echo "Compilando todas las versiones del CV..."

cd es/industria && pdflatex camilo_velez_cv_es_industria.tex && cd ../../
cd es/academia && pdflatex camilo_velez_cv_es_academia.tex && cd ../../
cd en/industry && pdflatex camilo_velez_cv_en_industry.tex && cd ../../
cd en/academic && pdflatex camilo_velez_cv_en_academic.tex && cd ../../

echo "✔️ Compilación completa"
