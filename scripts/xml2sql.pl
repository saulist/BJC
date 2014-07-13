#!/usr/bin/perl

# Modules
use strict;
use warnings;
use XML::Simple;
use Data::Dumper;
# UTF8
use open ":encoding(utf8)";
use open IN => ":encoding(utf8)", OUT => ":utf8";

# Sources
my %livre = ();
#~ require('var-livres.pl');
$livre{"01"} = "Genese";
$livre{"02"} = "Exode";
$livre{"03"} = "Levitique";
$livre{"04"} = "Nombres";
$livre{"05"} = "Deuteronome";
$livre{"06"} = "Josué";
$livre{"07"} = "Juges";
$livre{"08"} = "Ruth";
$livre{"09"} = "1Samuel";
$livre{"10"} = "2Samuel";
$livre{"11"} = "1Rois";
$livre{"12"} = "2Rois";
$livre{"13"} = "1Chroniques";
$livre{"14"} = "2Chroniques";
$livre{"15"} = "Esdras";
$livre{"16"} = "Nehemie";
$livre{"17"} = "Esther";
$livre{"18"} = "Job";
$livre{"19"} = "Psaumes";
$livre{"20"} = "Proverbes";
$livre{"21"} = "Ecclesiaste";
$livre{"22"} = "Cantique";
$livre{"23"} = "Esaie";
$livre{"24"} = "Jeremie";
$livre{"25"} = "Lamentations";
$livre{"26"} = "Ezechiel";
$livre{"27"} = "Daniel";
$livre{"28"} = "Osee";
$livre{"29"} = "Joel";
$livre{"30"} = "Amos";
$livre{"31"} = "Abdias";
$livre{"32"} = "Jonas";
$livre{"33"} = "Michee";
$livre{"34"} = "Nahum";
$livre{"35"} = "Habacuc";
$livre{"36"} = "Sophonie";
$livre{"37"} = "Aggee";
$livre{"38"} = "Zacharie";
$livre{"39"} = "Malachie";
$livre{"40"} = "Matthieu";
$livre{"41"} = "Marc";
$livre{"42"} = "Luc";
$livre{"43"} = "Jean";
$livre{"44"} = "Actes";
$livre{"45"} = "Romains";
$livre{"46"} = "1Corinthiens";
$livre{"47"} = "2Corinthiens";
$livre{"48"} = "Galates";
$livre{"49"} = "Ephesiens";
$livre{"50"} = "Philippiens";
$livre{"51"} = "Colossiens";
$livre{"52"} = "1Thessaloniciens";
$livre{"53"} = "2Thessaloniciens";
$livre{"54"} = "1Timothee";
$livre{"55"} = "2Timothee";
$livre{"56"} = "Tite";
$livre{"57"} = "Philemon";
$livre{"58"} = "Hebreux";
$livre{"59"} = "Jacques";
$livre{"60"} = "1Pierre";
$livre{"61"} = "2Pierre";
$livre{"62"} = "1Jean";
$livre{"63"} = "2Jean";
$livre{"64"} = "3Jean";
$livre{"65"} = "Jude";
$livre{"66"} = "Apocalypse";

# Variables
my $name = 'martin_1744';
my $src = '../XML/'.$name.'.xml';
my $out = '../SQL/'.$name.'.sql';

# Read XML file
my $bible = XMLin($src, ForceArray => 1);

open(OUT, '>', $out)
	or die("Impossible d'ouvrir le fichier $out :\n$!");

foreach my $book ( @{ $bible->{BIBLEBOOK} } ) {
	my $bnumber = $book->{bnumber};
	if(length($bnumber) < 2) {
		$bnumber = '0'.$book->{bnumber};
	}
	foreach my $chapter ( @{ $book->{CHAPTER} } ) {
		my $key = 'pad:'.$bnumber.'-'.$livre{$bnumber}.'-'.$chapter->{cnumber}.'.txt';
		my $value = '';
		my $random = generate_random_string(16);
		foreach my $verse ( @{ $chapter->{VERS} } ) {
			$value = "$value".$verse->{content}."\\n";
		}
		$value =~ s/'/''/g;
		#~ print(OUT "INSERT INTO `store` (`key`, `value`) VALUES\n");
		#~ print(OUT "('pad2readonly:".$bnumber."-".$livre{$bnumber}."-".$chapter->{cnumber}.".txt', '\"r.".$random."\"');\n");
		print(OUT "INSERT INTO `store` (`key`, `value`) VALUES\n");
		print(OUT "('".$key."', '{\"atext\":{\"text\":\"".$value."\\n\",\"attribs\":\"|16m+4j5g\"},\"pool\":{\"numToAttrib\":{\"0\":[\"author\",\"a.RgaOS3m56kbNebtL\"],\"1\":[\"author\",\"\"]},\"nextNum\":2},\"head\":2,\"chatHead\":-1,\"publicStatus\":false,\"passwordHash\":null,\"savedRevisions\":[]}');\n");
		print(OUT "INSERT INTO `store` (`key`, `value`) VALUES\n");
		print(OUT "('".$key.":revs:0', '{\"\"changeset\":\"Z:1>6b|5+6b\$".$value.",\"meta\":{\"author\":\"\",\"timestamp\":1388798806154,\"atext\":{\"text\":\"".$value."\\n\",\"attribs\":\"|6+6c\"}}}');\n");
		#~ print(OUT "INSERT INTO `store` (`key`, `value`) VALUES\n");
		#~ print(OUT "('readonly2pad:r.".$random."', '\"".$bnumber."-".$livre{$bnumber}."-".$chapter->{cnumber}.".txt\"');\n");
	}
}

#{"changeset":"Z:1>6b|5+6b$Welcome to Etherpad!\n\nThis pad text is synchronized as you type, so that everyone viewing this page sees the same text. This allows you to collaborate seamlessly on documents!\n\nGet involved with Etherpad at http://etherpad.org\n","meta":{"author":"","timestamp":1388798806154,"atext":{"text":"Welcome to Etherpad!\n\nThis pad text is synchronized as you type, so that everyone viewing this page sees the same text. This allows you to collaborate seamlessly on documents!\n\nGet involved with Etherpad at http://etherpad.org\n\n","attribs":"|6+6c"}}}

close(OUT);

sub generate_random_string{
    my $length_of_randomstring = shift; # the length of
                                        # the random string to generate

    my @chars=('a'..'z','A'..'Z','0'..'9');
    my $random_string;
    for(1..$length_of_randomstring){
        # rand @chars will generate a random
        # number between 0 and scalar @chars
        $random_string.=$chars[rand @chars];
    }

    return $random_string;
}
