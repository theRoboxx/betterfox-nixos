{
  stdenv,
  writeScriptBin,
  perl,
  makeWrapper,
  git,
  jq,
  betterfox-extractor,
  ...
}: let
  script = writeScriptBin "betterfox-generator" ''
    #!${perl}/bin/perl

    ${builtins.readFile ./generator.pl}
  '';
in
  stdenv.mkDerivation {
    pname = "betterfox-generator";
    version = "1.0";
    src = script;
    buildInputs = [makeWrapper git betterfox-extractor];
    installPhase = ''
      mkdir -p $out/bin
      cp $src/bin/betterfox-generator $out/bin
      wrapProgram $out/bin/betterfox-generator \
        --prefix PATH : ${betterfox-extractor}/bin \
        --prefix PATH : ${git}/bin \
        --prefix PATH : ${jq}/bin
    '';
  }
