BJC
===

Fichiers sources, srcipts, etc. de la BJC

## Compilation

```bash
# se placer dans le dossier scripts
cd ./scripts/

# lancer l'export des fichiers txt vers le format XML
./txt2xml.py

# export du XML vers LaTeX
./xml2tex.pl

# se placer dans le dossier des fichiers LaTeX
cd ../tex/bjc_2014/

# lancer la compilation avec xelatex
xelatex bjc_2014.tex
```
