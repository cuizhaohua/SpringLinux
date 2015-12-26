package Module::Build::PPMMaker;

use strict;
use Config;
use vars qw($VERSION);

$VERSION = '0.4205';
$VERSION = eval $VERSION;

# This code is mostly borrowed from ExtUtils::MM_Unix 6.10_03, with a
# few tweaks based on the PPD spec at
# http://www.xav.com/perl/site/lib/XML/PPD.html

# The PPD spec is based on <http://www.w3.org/TR/NOTE-OSD>

sub new {
  my $package = shift;
  return bless {@_}, $package;
}

sub make_ppd {
  my ($self, %args) = @_;
  my $build = delete $args{build};

  my @codebase;
  if (exists $args{codebase}) {
    @codebase = ref $args{codebase} ? @{$args{codebase}} : ($args{codebase});
  } else {
    my $distfile = $build->ppm_name . '.tar.gz';
    print "Using default codebase '$distfile'\n";
    @codebase = ($distfile);
  }

  my %dist;
  foreach my $info (qw(name author abstract version)) {
    my $method = "dist_$info";
    $dist{$info} = $build->$method() or die "Can't determine distribution's $info\n";
  }

  $self->_simple_xml_escape($_) foreach $dist{abstract}, @{$dist{author}};

  # TODO: could add <LICENSE HREF=...> tag if we knew what the URLs were for
  # various licenses
  my $ppd = <<"PPD";
<SOFTPKG NAME=\"$dist{name}\" VERSION=\"$dist{version}\">
    <ABSTRACT>$dist{abstract}</ABSTRACT>
@{[ join "\n", map "    <AUTHOR>$_</AUTHOR>", @{$dist{author}} ]}
    <IMPLEMENTATION>
PPD

  # W