#!/usr/bin/perl

# Chemin fichier source
$src = "../src/ostervald_1996.txt";

# Ouvrir fichier source
open(SRC, $src);

while($ligne = <SRC>) {
	# Découpage de chaque éléments de la ligne en cours
	@ligne = split(/\s/, $ligne);

	# Ouverture du fichier sortie correspondant au livre en cours
	if($numLivre != $ligne[0]) {
		close(OUT);
		print("> ../txt/".$ligne[0].".txt\n");
		open(OUT, "> ../txt/".$ligne[0].".txt");
	}

	# Premier élément, numéro du livre
	$numLivre = shift(@ligne);
	# Deuxième élément, numéro du chapitre
	$numChapitre = shift(@ligne);
	# Troisième élément, numéro du verset
	$numVerset = shift(@ligne);
	# Concaténation du reste, texte du verset
	$verset = join(' ', @ligne);

	# Écriture de la ligne
	print(OUT "${numChapitre}:${numVerset} ${verset}\n");
}

# Fermer fichier de sortie
close(OUT);
# Fermer fichier source
close(SRC);
