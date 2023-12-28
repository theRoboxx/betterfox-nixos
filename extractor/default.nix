{
  writeScriptBin,
  perl,
  ...
}:
writeScriptBin "betterfox-extractor" ''
  #!${perl}/bin/perl

  ${builtins.readFile ./extractor.pl}
''
