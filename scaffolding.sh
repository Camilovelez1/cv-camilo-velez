#!/bin/bash

# Nombre base del proyecto
PROJECT="cv-camilo-velez"
cd ~
mkdir -p $PROJECT/{common,es/{industria/sections,academia/sections,output},en/{industry/sections,academic/sections,output}}

# Archivos comunes
cat <<EOF > $PROJECT/common/packages.tex
% Paquetes comunes
\\usepackage[margin=1in]{geometry}
\\usepackage{titlesec}
\\usepackage{enumitem}
\\usepackage{xcolor}
\\usepackage{hyperref}
EOF

cat <<EOF > $PROJECT/common/style.tex
% Estilos comunes
\\titleformat{\\section}{\\Large\\bfseries\\color{blue}}{}{0em}{}
\\pagestyle{empty}
EOF

# Archivos base por idioma y versión
echo "% CV en Español - Industria" > $PROJECT/es/industria/camilo_velez_cv_es_industria.tex
echo "% CV en Español - Academia" > $PROJECT/es/academia/camilo_velez_cv_es_academia.tex
echo "% CV in English - Industry" > $PROJECT/en/industry/camilo_velez_cv_en_industry.tex
echo "% CV in English - Academic" > $PROJECT/en/academic/camilo_velez_cv_en_academic.tex

# README
cat <<EOF > $PROJECT/README.md
# Camilo Vélez – CV

Repositorio en LaTeX con múltiples versiones de mi hoja de vida (Español e Inglés, Industria y Academia).

## Estructura

- \`common/\`: paquetes y estilos compartidos
- \`es/\`: versiones en español
  - \`industria/\`
  - \`academia/\`
- \`en/\`: versiones en inglés
  - \`industry/\`
  - \`academic/\`

## Cómo compilar

Desde cualquier subcarpeta:

\`\`\`bash
pdflatex camilo_velez_cv_es_industria.tex
\`\`\`

O usar el script global:
\`\`\`bash
bash compile_all.sh
\`\`\`
EOF

# Script para compilar todas las versiones
cat <<EOF > $PROJECT/compile_all.sh
#!/bin/bash
echo "Compilando todas las versiones del CV..."

cd es/industria && pdflatex camilo_velez_cv_es_industria.tex && cd ../../
cd es/academia && pdflatex camilo_velez_cv_es_academia.tex && cd ../../
cd en/industry && pdflatex camilo_velez_cv_en_industry.tex && cd ../../
cd en/academic && pdflatex camilo_velez_cv_en_academic.tex && cd ../../

echo "Compilación completa"
EOF
chmod +x $PROJECT/compile_all.sh

# Gitignore para no subir PDFs
cat <<EOF > $PROJECT/.gitignore
**/output/
*.pdf
EOF

echo "Proyecto LaTeX creado en ~/$PROJECT"
