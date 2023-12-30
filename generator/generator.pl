use warnings;
use strict;

my $true  = !0;
my $false = !1;

sub generate_version {
    my ( $default, $version ) = @_;
    print "Generating v$version\n";
    my $script =
"curl -s https://raw.githubusercontent.com/yokoffing/BetterFox/$version/user.js | betterfox-extractor | jq . -S > $version.json";
    system $script;
    print $default
"  \"$version\" = builtins.fromJSON (builtins.readFile ./$version.json);\n";
}

open( my $git, '-|', "git ls-remote https://github.com/yokoffing/BetterFox" )
  or die $!;
open( my $default, '>', "default.nix" ) or die $!;
print $default "{\n";
generate_version $default, "master";
while ( my $line = <$git> ) {
    if ( $line =~ m/^.{40}\s+refs\/tags\/(\d+\.\d)/ ) {
        my $version = $1;
        next if $version < 91.0;
        generate_version $default, $version;
    }
}
print $default "}\n";
