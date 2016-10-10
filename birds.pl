#!/usr/bin/perl
#
use Data::Dumper;
use LWP::UserAgent;
#
#foreach my $page (1..25) {
#  `wget http://www.birding.in/birds_of_india${page}.htm`
#}
#

my %birds = ();
open(my $file, "all_birds_of_india.html") or die "cannot open file [$!]";
#while (my $line = <DATA>.<DATA>) {
print "common_name,scientific_name,img_link,href,order,family,sub_family\n";
my $count = 0;
while (my $line = <$file>.<$file>) {
  #print "[$line]\n";
  $count++;
  #print "common_name,scientific_name,img_link,href,order,family,sub_family\n" if (($count % 20) == 0);
  if ($line =~ m{img.+src="(.+?)".+?alt="(.+?)".*?href="(.+?)".*?>(.+?)</a.+}s) {
    my $img_link = $1;
    my $scientific_name = $2;
    my $href = $3;
    my $common_name = $4;
    my $order = "";
    my $family = "";
    my $colour = '';
    my $size_in_cms = 0;
    my $subfamily = "";
    if ($href =~ m{birds/(.+?)/(.+?)/(.+?)/}) {
      $order = $1;
      $family = $2;
      $subfamily = $3;
    } elsif ($href =~ m{birds/(.+?)/(.+?)/}) {
      $order = $1;
      $family = $2;
    } elsif ($href =~ m{birds/(.+?)/.+\.htm}) {
      $order = $1;
    }
    my %bird = (
      img => $img_link,
      common_name => $common_name,
      href => $href,
      colour => $colour,
      scientific_name => $scientific_name,
      size => $size_in_cms,
      order => $order,
      family => $family,
      sub_family => $sub_family,
    );
    $birds{$order}{$family}{$subfamily}{$scientific_name} = \%bird;
    print "$common_name,$scientific_name,$img_link,$href,$order,$family,$subfamily,$colour,$size_in_cms\n";
  }
}

  #warn Data::Dumper->Dump([\%birds], [qw(birds)]);

__DATA__

[<td><img class="smlimg" src="images/Birds/rajiv/ichat_small.jpg" alt="Cercomela fusca"><br>
<a title="Cercomela fusca" href="birds/Passeriformes/Muscicapidae/indian_chat.htm">Indian Chat</a>
]

<td><img class="smlimg" src="images/Birds/rajiv/combduck_s.jpg" alt="Sarkidiornis melanotos"><br>
<a href="birds/Anseriformes/Anatidae/comb_duck.htm">Comb Duck</a>
<td><img class="smlimg" src="images/Birds/rajiv/gadwall_s.jpg" alt="Anas strepera"><br>
<a href="birds/Anseriformes/Anatidae/gadwall.htm">Gadwall</a>
<td><img class="smlimg" src="images/Birds/rajiv/rlapwing_s.jpg" alt="Vanellus duvaucelii"><br>
<a href="birds/Charadriiformes/Charadriidae/river_lapwing.htm">River Lapwing</a>
<tr><td><img class="smlimg" src="images/Birds/rajiv/greenshank_s.jpg" alt="Tringa nebularia"><br>
<a href="birds/Charadriiformes/Scolopacidae/common_greenshank.htm">Common Greenshank</a>
<td><img class="smlimg" src="images/Birds/rajiv/kplover_s.jpg" alt="Charadrius alexandrinus"><br>
<a href="birds/Charadriiformes/Charadriidae/kentish_plover.htm">Kentish Plover</a>
<td><img class="smlimg" src="images/Birds/rajiv/pfalcon_s.jpg" alt="Falco peregrinus"><br>
<a href="birds/Falconiformes/Falconidae/peregrine_falcon.htm">Peregrine Falcon</a>
<td><img class="smlimg" src="images/Birds/rajiv/francolin_s.jpg" alt="Francolinus pondicerianus"><br>
<a href="birds/Galliformes/grey_francolin.htm">Gray Francolin</a>
<tr><td><img src="images/Birds/rajiv/yebabbler_s.jpg" width="300" height="200" alt="Chrysomma sinense"><br>
<a href="birds/Passeriformes/Sylviidae/Timaliinae/yellow-eyed_babbler.htm">Yellow-eyed Babbler</a>
<td><img src="images/Birds/rajiv/wtlapwing_s.jpg" width="300" height="200" alt="Vanellus leucurus"><br>
<a href="birds/Charadriiformes/Charadriidae/white-tailed_lapwing.htm">White-tailed Lapwing</a>
<td><img src="images/Birds/rajiv/bfrancolin_s.jpg" width="300" height="200" alt="Francolinus francolinus"><br>
<a href="birds/Galliformes/black_francolin.htm">Black Francolin</a>
<td><img src="images/Birds/rajiv/martin_s.jpg" width="300" height="200" alt="Riparia paludicola"><br>

