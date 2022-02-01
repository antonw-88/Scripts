#!/usr/bin/perl
# This is a Perl practice script

use warnings;
use strict;

print("Enter name of file with word to replace, including file-ending:\n");
my $filename = <STDIN>;
chomp $filename;
my $newfile  = "$filename.new";
my $backup   = "$filename.b";
print ("Enter the word to be replaced:\n");
my $search = <STDIN>;
print ("Enter the new word:\n");
my $replace = <STDIN>;

open my $IN, '<', $filename or die $!;
open my $OUT, '>', $newfile or die $!;
while (<$IN>) {
    $_ =~ s/testa/aaa/g;
    print {$OUT} $_;
}
close $OUT or die $!;
rename $filename, $backup or die $!;
rename $newfile, $filename or die $!;

#To do:
#replace doesnt work with variables
#replace more than one type of word, loop file
