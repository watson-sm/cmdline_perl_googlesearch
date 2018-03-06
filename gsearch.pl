#!/usr/bin/env perl
use strict;
use warnings;
use WWW::Mechanize;

# Variables
my $mech = WWW::Mechanize->new();
my $google = "https://www.google.com";
my $response = "";
my $search = $ARGV[0];
my $filename = 'output.html';

# Get Google's main page
$mech->get( $google );

# Find the search form
$mech->form_name('f');

# Submit the string from commandline as the intended search
$mech->field('q', "$search");
$response = $mech->submit();

# Output the search results page
open(my $fh, '>', $filename)
  or die "Could not open file '$filename' $!";
print $fh $response->decoded_content;
close $fh;
