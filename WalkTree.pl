#!/usr/bin/perl

use XML::Simple;
use Data::Dumper;
use Spreadsheet::WriteExcel;

my $simple = XML::Simple->new(); 
my $tree = $simple->XMLin('./sample.xml');

my $workbook = Spreadsheet::WriteExcel->new('./sample.xls');
$worksheet = $workbook->add_worksheet();

my $row = 2;

$worksheet->write("A1","Common");
$worksheet->write("B1","Botanical");
$worksheet->write("C1","Zone");
$worksheet->write("D1","Light");
$worksheet->write("E1","Price");
$worksheet->write("F1","Availability");

foreach  my $p (@{$tree->{plant}}){

    $worksheet->write("A${row}",$p->{common});
    $worksheet->write("B${row}",$p->{botanical});
    $worksheet->write("C${row}",$p->{zone});
    $worksheet->write("D${row}",$p->{light});
    $worksheet->write("E${row}",$p->{price});
    $worksheet->write("F${row}",$p->{availability});

    $row++;
};
