#!/usr/bin/perl

# Chemin fichier source
$src = "../sources/ostervald_1996.txt";

# Ouvrir fichier source
open(SRC, $src);

while($ligne = <SRC>) {
	# Découpage de chaque éléments de la ligne en cours
	@ligne = split(/\s/, $ligne);

	# Si on travaille sur un nouveau livre
	if($numLivre != $ligne[0]) {
		# Premier élément, numéro du livre
		$numLivre = shift(@ligne);
		$numLivre = $1 if($numLivre =~ /^(\d{2})/);

		# Fermeture des précédants fichiers de sortie
		close(LIVRE);
		close(COMMENTAIRES);
		# Ouverture des fichiers sortie correspondants au livre en cours
		print("> ../txt/".$numLivre.".txt\n");
		open(LIVRE, "> ../txt/".$numLivre.".txt");
		open(COMMENTAIRES, "> ../txt/".$numLivre."-commentaires.txt");
	} else {
		# Suppression premier élément
		shift(@ligne);
	}

	# Deuxième élément, numéro du chapitre
	$numChapitre = shift(@ligne);
	# Troisième élément, numéro du verset
	$numVerset = shift(@ligne);
	# Concaténation du reste, texte du verset
	$verset = join(' ', @ligne);

	# Écriture de la ligne
	print(LIVRE "${numChapitre}:${numVerset} ${verset}\n");
	print(COMMENTAIRES "#${numChapitre}:${numVerset}\n");
}

# Fermer fichier de sortie
close(LIVRE);
close(COMMENTAIRES);
# Fermer fichier source
close(SRC);
