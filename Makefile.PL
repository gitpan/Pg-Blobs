
use strict;
use warnings;



use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "Manage Postgresql blobs from any DBI (dbh) capable object.",
  "AUTHOR" => "Jerome Eteve <jerome.eteve\@gmail.com>",
  "BUILD_REQUIRES" => {
    "DBI" => 0,
    "Moose" => 0,
    "Test::Exception" => "0.31",
    "Test::More" => "0.98",
    "Test::postgresql" => 0,
    "strict" => 0,
    "warnings" => 0
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "Pg-Blobs",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "Pg::Blobs",
  "PREREQ_PM" => {
    "Moose::Role" => "2.0401"
  },
  "VERSION" => "0.001",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



