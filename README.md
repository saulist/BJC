Bible de Jésus-Christ
===

Fichiers sources, srcipts, etc. de la BJC

## Installation des outils (Debian)

```bash
# installation des paquets nécessaires
apt-get install git texmaker texlive-lang-french texlive-fonts-recommended texlive-xetex
```

## Récupération des fichiers

```bash
# copie locale du dépôt
git clone git@github.com:bible2vie/BJC.git
```

## Compilation

```bash
# se placer dans le dossier scripts
cd ./BJC/scripts/

# lancer l'export des fichiers txt vers le format XML
./txt2xml.py

# export du XML vers LaTeX
./xml2tex.pl

# se placer dans le dossier des fichiers LaTeX
cd ../tex/bjc_2014/

# lancer la compilation avec xelatex
xelatex bjc_2014.tex
```
