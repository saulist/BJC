#!/usr/bin/perl

# Conversion UTF8 :
# iconv -f ISO-8859-1 -t UTF-8 bible_ostervald_1996.txt -o bible_ostervald_1996_utf8.txt

#use strict;
use warnings;

# Fichiers
my $name = 'martin_1744';
my $entree = "../txt/".$name.".txt";
my $sortie = "../tex/".$name."/concordance.tex";
my $tmp = "../tex/tmp";
my (%concordance, $contexte);

# Ouverture du fichier de la Bible
open(READ, "<", $entree);

# Parcours du fichier de la Bible
while(my $ligne = <READ>) {
	# Découpaqe de chaque ligne du fichier
	my @div = split(/[:\.,;\-'!\?"\[\]\(\)\s\t]+/, $ligne);

	# Récupération de la référence du verset en cours (livre:chapitre:verset)
	my $ref = $div[0].":".$div[1].":".$div[2];

	# Filtre des termes inutiles
	my $filter = "(";
		$filter = $filter."je|tu|il|elle|nous|vous|ils|elles";
		$filter = $filter."|a|à|ô|n|l|d|j|y|c|s|m|t|i";
		$filter = $filter."|au|or|et|de|des|du|un|uns|une|unes|en|ou|où|ne|ni";
		$filter = $filter."|te|tes|ta|ton|toi|tous|tout|toute|toutes|tel|tels|telle|telles";
		$filter = $filter."|me|mes|ma|mon";
		$filter = $filter."|se|sa|son|ses|ça|ce|cela|ci|celui|celle|celles|ceux";
		$filter = $filter."|notre|nos|votre|vos|eux";
		$filter = $filter."|la|le|les|là|lui|leur|leurs";
		$filter = $filter."|qu|que|quel|quels|lequel|laquelle|lesquels|lesquelles|quelle|quelles|qui|quand";
		$filter = $filter."|pas|par|pour|dans|avec|selon|sur|donc|car|parce|mais|alors";
		$filter = $filter."|quant|même|mêmes|quelque|quelques";
		# Verbes
		$filter = $filter."|as|ai|ais|ait|aient|eut|fut|fit|vit|sont";
	$filter = $filter.")";

	for(my $i = 3; $i < scalar(@div); $i++) {
		# Application du filtre
		my $mot = lc($div[$i]);
		if($mot !~ /^$filter$/) {
			my @verset = split(/\s/, $ligne);
			my $contexte = "";
			my $pos = "";
			# Position du mot dans le verset
			for(my $j = 3; $j < scalar(@verset); $j++) {
				if($verset[$j] =~ /$div[$i]/) {
					$pos = $j;
				}
			}
			# Limitation du contexte (7 mots)
			while($pos > 6) {
				splice(@verset,3,1);
				for(my $j = 3; $j < scalar(@verset); $j++) {
					if($verset[$j] =~ /$div[$i]/) {
						$pos = $j;
					}
				}
			}
			while(scalar(@verset) > 10) {
				pop(@verset);
			}
			for(my $j = 3; $j < scalar(@verset); $j++) {
				$contexte = $contexte.$verset[$j]." ";
			}

			if(! -d $tmp) {
				`mkdir -p $tmp`;
			}

			open($mot, '>>', $tmp.'/'.$mot);

			print($mot $ref."\t".$contexte."\n");

			close($mot);

			#$concordance{$mot} = {
			#	$ref => $contexte,
			#	%concordance
			#};
		}
	}
}

close(READ);

@dirListe=split("\n", `ls -d $tmp/*`);

open(WRITE, '>', $sortie);
print(WRITE "\\begin{multicols}{3}\n");

foreach(@dirListe) {
	@mot = split('/', $_);
	print(WRITE "\n\\ConcordanceEntry{".$mot[3]."}\n");
	open(REF, '<', $_);
	my $check = "";
	while($data = <REF>) {
		if($check ne $data) {
			print(WRITE $data);
		}
		$check = $data;
	}
	close(REF);
}

print(WRITE "\n\\end{multicols}\n");
close(WRITE);

`rm -r $tmp`;

#my @triConcordance = sort({uc($a) cmp uc($b)} keys %concordance);
#foreach my $mot (@triConcordance) {
#        print($mot." :\n");
#        while ((my $ref,my $contexte) = each %{$concordance{$mot}}) {
#                print("\t".$ref." « ".$contexte." »\n");
#        }
#}

