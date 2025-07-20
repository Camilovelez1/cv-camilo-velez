# Camilo Vélez – CV

Repositorio en LaTeX con múltiples versiones de mi hoja de vida (Español e Inglés, Industria y Academia).

## Estructura

- `common/`: paquetes y estilos compartidos
- `es/`: versiones en español
  - `industria/`
  - `academia/`
- `en/`: versiones en inglés
  - `industry/`
  - `academic/`

## Cómo compilar

Desde cualquier subcarpeta:

```bash
pdflatex camilo_velez_cv_es_industria.tex
```

O usar el script global:
```bash
bash compile_all.sh
```
