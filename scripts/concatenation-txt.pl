#!/usr/bin/perl

# Fichier de sortie
$dst = "../sources/revision.txt";

# Ouverture fichier de sortie
open(OUT, "> $dst");

# Liste les élements du dossier '../txt/'
@dirLS=split(/\s/, `ls -d ../txt/*`);

foreach(@dirLS) {
	$numLivre = $1 if($_ =~ /(\d{2})/);
	print("$numLivre\t\n");

	open(LIVRE, $_);
	while($ligne = <LIVRE>) {
		#
		print(OUT "$numLivre\t$1\t$2\t$3\n") if($ligne =~ /^(\d{1,3}):(\d{1,3})\s(.*)\s$/);
	}
	close(LIVRE);
}

# Fermeture fichier de sortie
close(OUT);
