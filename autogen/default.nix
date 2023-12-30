{
  "master" = builtins.fromJSON (builtins.readFile ./master.json);
  "115.0" = builtins.fromJSON (builtins.readFile ./115.0.json);
  "115.1" = builtins.fromJSON (builtins.readFile ./115.1.json);
  "117.0" = builtins.fromJSON (builtins.readFile ./117.0.json);
  "118.0" = builtins.fromJSON (builtins.readFile ./118.0.json);
  "119.0" = builtins.fromJSON (builtins.readFile ./119.0.json);
}
