Bible de Jésus-Christ
===

Scripts et fichiers sources de la BJC

## Installation des outils (Debian)

```bash
# installation des paquets nécessaires
apt-get install git texmaker texlive-lang-french texlive-fonts-recommended texlive-xetex
```

## Récupération des fichiers

```bash
# copie locale du dépôt
git clone git@github.com:bible2vie/BJC.git ~/BJC
```

## Génération des fichiers LaTeX

Étape facultative si les fichiers `.tex` sont déjà présents dans le dépôt. Si vous lancez ces scripts, les fichiers existants (et leurs éventuelles personnalisations : titres, commentaires, corrections, etc.) seront écrasés.

```bash
# se placer dans le dossier scripts
cd ~/BJC/scripts/

# lancer l'export des fichiers txt vers le format XML
./txt2xml.py

# export du XML vers LaTeX
./xml2tex.pl
```

## Compilation PDF

```bash
# se placer dans le dossier des fichiers LaTeX
cd ~/BJC/tex/bjc_2014/

# lancer la compilation avec xelatex
xelatex bjc_2014.tex
```
Prochainement en ligne, site de présentation : http://www.bible-de-jesus.org/
