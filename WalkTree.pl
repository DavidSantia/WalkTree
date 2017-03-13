#!/usr/bin/perl

use XML::Simple;
use Data::Dumper;
use Spreadsheet::WriteExcel;

my $simple = XML::Simple->new(); 
my $tree = $simple->XMLin('./Sample.xml',KeyAttr=>{
Campaigns=>'Campaign' 
} );


my $workbook = Spreadsheet::WriteExcel->new('./Sample.xls');
$worksheet = $workbook->add_worksheet();

my $i =2;
#print $i ."\n";
#print "AdvertiserId" . "\t\t" ."AdvertiserName" ."\t\t" . "CampaignId" ."\t\t". "CampaignName" ."\n";
#print Dumper ($Campaign);

$worksheet->write("A1","AdvertiserId");
$worksheet->write("B1","AdvertiserName");
$worksheet->write("C1","CampaignId");
$worksheet->write("D1","CampaignName");


foreach  my $n (@{$tree->{Campaigns}->{Campaign}}){


$worksheet->write("A${i}",$n->{AdvertiserId});
$worksheet->write("B${i}",$n->{AdvertiserName});
$worksheet->write("C${i}",$n->{CampaignId});
$worksheet->write("D${i}",$n->{CampaignName});

$i++;

};
